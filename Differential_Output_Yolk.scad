// ----------------------------------------------------------------------------------------------------
// PROJECT INFORMATION

// NAME:  R/C Mower Trailer
// REVISION:  A1
// START DATE:  8/20/2021
// CURRENT VERSION DATE:  9/8/2021
// LICENSE:  GPLv3
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  A tow-behind lawn mowing attachment for retrofit onto low-speed R/C vehicles.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PART INFORMATION

// NAME:  Differential Output Yolk
// REVISION:  B1
// START DATE:  7/18/2026
// CURRENT VERSION DATE:  7/27/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Opus 5.
// DESCRIPTION:
//    A driveshaft yoke that couples the Differential Output Gear to the driveshaft.
//    The hexagonal boss ($fn=6, r=2.0) slides into the matching hex cut in the output
//    shaft for positive rotational engagement. A clamping screw passes through the center
//    bore (r=1.5) and into the output shaft bore, squeezing the yoke onto the shaft.
//    The circular flange (r=10, h=2.5mm) provides the driveshaft attachment surface.
// FILE NAME: Differential_Output_Yolk.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Slide hex boss into the hex cut on the Differential Output Gear shaft.
// 3. Align any of the 6 faces — all orientations are identical.
// 4. Pass clamping screw through flange bore and into output shaft center bore.
// 5. Tighten screw to clamp yoke onto shaft.
// 6. Attach driveshaft to flange face.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating bearings.
include <Workfiles/Bearings.scad>;
// A module for creating bearings.
include <Differential_Output_Yolk_Cover.scad>;
// Shared roller and race profiles, held in common with the cover so both halves agree.
include <Workfiles/Filleted_Frustum.scad>;
// The roller that rides in the race, for the assembly reference at the bottom of this file.
// Imported with use rather than include because that file renders itself when loaded, and
// include would execute that render and leave a stray roller sitting at the origin.
use <Differential_Output_Yolk_Roller_Bearing.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Differential_Output_Yolk() {
  // Hex boss dimensions — must match hex cut in Differential_Gears.scad output shaft.
  boss_r  = 2.0; // Hex boss radius — matches $fn=6, r=2.0 cut in output shaft.
  boss_h  = 14.375; // Hex boss length — fills the output shaft hex cut depth.

  // Circular flange dimensions.
  flange_r = 8.5; // Flange outer radius.
  flange_h = 10; // Flange thickness — increased to 5mm to accommodate hardware recess.

  // Center bore — matches output shaft bore r=1.5 for clamping screw pass-through.
  bore_r = 1.22;

  // Hardware recess on bottom face of flange — seats mounting hardware flush.
  recess_r = 2.375; // Recess radius.
  recess_h = 9.25; // Recess depth from bottom face.

  // Bearing recess on bottom face of flange — seats mounting bearing flush.
  bearing_recess_r = 2.505; // Bearing radius.
  bearing_recess_h = 7.56; // Recess depth from bottom face. Fits three 3x5 bearings.
  bearing_id_r = 1.5; 

  // Outer hub dimensions. 
  outer_face_h = 2;
  outer_hub_r1 = flange_r;
  outer_hub_r2 = flange_r - 8.5;
  outer_hub_h = outer_face_h + 5;

  difference() {
    union() {
      difference() {
        // Create the body of the circular flange — driveshaft attachment surface.
        cylinder($fn=96, r=flange_r, h=flange_h, center=false);
        // Hollow out the flange to create a drum.
        cylinder($fn=96, r=flange_r - 1, h=flange_h - 1.5, center=false); }
      // The upper trapezoid spring perch. Both cubes are widened by the same 1.5mm over
      // the original 1 and 7, which keeps the sloped face at its original angle and simply
      // moves it 0.75mm outboard. Holding the angle matters because the spring perch
      // recesses are cut normal to that face; had only the wide end grown, the face would
      // have steepened and the recesses would have ended up buried inside the material
      // rather than dished into its surface.
      // The extra width recovers what the widened cover arc slot takes out of the
      // opposing perch, which at slot_r=1.72 was breaking clean through the face.
      // Widening pushes the far corners past the 8.5 drum OD, so the result is trimmed
      // back to flange_r. Previously the corners landed at r=8.458 and stayed inside on
      // their own, which is why no trim was needed before.
      intersection() {
        translate([0, 0, (flange_h / 2) - 0.5]) rotate([0, 90, 0]) hull() {
          translate([0, 0, 0]) 
            cube([flange_h - 1, 2.5, 2], center = true); 
          translate([0, 0, 6.7]) 
            cube([flange_h - 1, 8.5, 2], center = true); }
        cylinder($fn=96, r=flange_r, h=flange_h + 1, center=false); }
      // Add the hub material to the inside of the drum.
      cylinder($fn=96, r=bearing_recess_r + 0.75, h=flange_h, center=false);
      // Outer hub to ensure cover mounting hardware clearance.
      translate([0, 0, flange_h])
        cylinder($fn=96, r1=outer_hub_r1, r2=outer_hub_r2, h=outer_face_h, center=false);
      // Shoulder for outer 5x8 bearing.
      translate([0, 0, flange_h])
        cylinder($fn=96, r=2.875, h=2, center=false); 
      translate([0, 0, flange_h])
        cylinder($fn=96, r=2.5, h=outer_hub_h, center=false); 
      // Hexagonal boss — slides into hex cut in output shaft for rotational engagement.
      // $fn=6 matches the output shaft cut exactly. All 6 orientations are identical.
      translate([0, 0, flange_h])
        cylinder($fn=6, r=boss_r, h=boss_h, center=false); 
      // Screw boss standoffs. These run from the drum floor at Z=8.5 down through the
      // cover's arc slots and stand 0.05mm proud of the cover cap's outer face, so the
      // washer and lock nut land on the boss rather than on the cap. The cap is then
      // located axially without being clamped, and is free to rotate through the slot's
      // travel. Boss length is what sets the drums' separation, and through the cone that
      // sets roller preload directly — 1mm of boss length moves the races 0.058mm
      // radially, so preload is set by geometry rather than by how hard anyone pulls.
      // OD 1.65 against the 0.85 screw hole leaves a 0.80mm wall, which is two perimeters
      // at a 0.4mm nozzle. That wall is the whole reason for dropping to M1.6.
      translate([5.25, 0, -1.0625])
        cylinder($fn=96, r=1.65, h=9.5625, center=false);
      translate([-5.25, 0, -1.0625])
        cylinder($fn=96, r=1.65, h=9.5625, center=false); 
      

}
    // Center bore through full assembly for mounting screw.
    translate([0, 0, -1])
      cylinder($fn=96, r=bore_r, h=flange_h + boss_h + 2, center=false);
    // Hardware recess on bottom face — allows mounting hardware to sit flush.
    translate([0, 0, -1])
      cylinder($fn=96, r=recess_r, h=recess_h, center=false); 
    // Bearing recess on bottom face — allows bearing to sit flush.
    translate([0, 0, -1])
      cylinder($fn=96, r=bearing_recess_r, h=bearing_recess_h + 1, center=false); 
    // Screw holes for cover. r=0.85 is a close clearance fit on M1.6. Dropping a screw
    // size from M2 is what funds a printable wall on the standoff boss: the boss carries
    // the clamping compression, so the fastener itself does comparatively little work.
    translate([5.25, 0, 5])
      cylinder($fn=96, r=0.85, h=15, center=true);
    translate([-5.25, 0, 5])
      cylinder($fn=96, r=0.85, h=15, center=true);
    // Roller bearing inner race. A cone sharing one apex on the drum axis with the
    // cover's outer race, which is the condition that makes this a true conical roller
    // bearing and lets the rollers roll without scrubbing along the contact line.
    // The apex lies far BELOW the part, so both races widen going up and the gap between
    // them widens with them. Drawing the cover upward therefore narrows the gap and seats
    // the rollers, which is the direction the clamping screws pull. Apex above would have
    // meant tightening the screws unloaded the bearing instead.
    // The roller's fat end consequently sits at the top, at Z=7.575.
    // Cut depth runs 0.2549mm at Z=4 to 0.0826mm at Z=7.575, leaving 0.745mm of the
    // 1.0mm drum wall standing. Separation is resisted by the fasteners rather than by
    // the cone, which is the conventional arrangement for a preloaded single row.
    translate([0, 0, 4])
      Race_Groove(base_r=flange_r, r_start=8.24506, r_end=8.41744, race_h=3.575, ramp_h=1, run_h=1, back_r=flange_r + 1, fillet_r=0.15, fn=96);
    // The installation notch. Collinear with a seated roller, so it leans 3.037 degrees
    // out from the drum axis the way the rollers do. With the apex below, a roller runs
    // toward the drum axis as it descends, so this notch leans the opposite way to the
    // cone's previous sense and has to cut deeper into the drum wall on the approach.
    // Radius matches the cover's installation hole.
    // It stays 20 degrees off the cover hole so the two only line up when the drums are
    // rotated to the install position, outside the springs' working travel.
    rotate([0, 0, 110])
      translate([8.859785, 0, 0])
        rotate([0, 3.03675, 0])
          cylinder($fn=96, r=0.87375, h=5.5, center=false);

    // Screw recesses in bottom face for cover.
    translate([5.25, 0, (flange_h + 1.125)])
      cylinder($fn=96, r=1.75, h=3, center=true);
    translate([-5.25, 0, (flange_h + 1.125)])
      cylinder($fn=96, r=1.75, h=3, center=true);

    // Upper Spring perch recesses.
    translate([4, 3.575, 2.25]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4, -3.575, 2.25]) rotate([0, 90, 65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    // Lower Spring perch recesses.
    translate([4, 3.575, 6.375]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4, -3.575, 6.375]) rotate([0, 90, 65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);

} 
}

// We need to make this fit a toothed belt. With 15mm spur and 7.5mm pinion this needs 91.85mm distance.


// Render the object.
// Comment or uncomment as needed.
//Differential_Output_Yolk();
// Create the triple stacked 5x8 bearings that support independant rotation of the cover.
//translate([0, 0, 0])bearing_3x5x2_5();
//translate([0, 0, 2.5])bearing_3x5x2_5();
//translate([0, 0, 5]) bearing_3x5x2_5();
// Outer bearing that mounts into the Center Bracket.
//translate([0, 0, 14.5]) rotate([0, 180, 0]) flanged_bearing_5x8x2_5();
//translate([0, 0, 14.5]) bearing_5x8x2_5();

// USE THIS FOR DIMENSIONAL REFERENCE!!!
// Add the Output Yolk Cover.
//translate([0, 0, 9.9875]) rotate([0, 180, 0]) Differential_Output_Yolk_Cover();

// Add the roller bearings seated in the race.
// Each roller leans 3.037 degrees out from the drum axis, in the plane containing that
// axis. That lean is not a styling choice: it is what puts the roller's own cone apex
// on the drum axis alongside the two race apexes, which is the condition for the roller
// to roll rather than scrub. The rollers are consequently no longer surfaces of
// revolution about the drum axis, so each one is placed individually rather than being
// swept around it.
// With the apex below, the gap between the race cones is widest at the top, so the
// roller sits fat end up and needs no end for end flip: the module already runs thin at
// its Z=0 and fat at its Z=h.
// Placement is about the roller's own midpoint at r=9.16685, Z=5.7875, the midpoint of
// the pitch line running from r=9.07745 at the thin end to r=9.25625 at the fat end.
// Seated this way the roller exactly fills the gap at every station along its length,
// since nominal clearance is zero for preload.
//roller_qty = 30;
//for (i = [0 : roller_qty - 1])
  //rotate([0, 0, i * 360 / roller_qty])
    //translate([9.16685, 0, 5.7875])
      //rotate([0, 3.03675, 0])
        //translate([0, 0, -3.375 / 2])
          //Output_Yolk_Roller_Bearing();

// THIS IS FOR VISUAL REFERENCE ONLY!!!
// DO NOT USE THIS AS AN ASSEMBLY DIAGRAM!!!
// DO NOT USE THIS FOR DIMENSIONAL REFERENCE!!!
// Check alignment of the internal damper parts by layering the Output Yolk and Output Cover over each other with open ends facing the same direction.
//translate([0, 0, 0]) rotate([0, 0, 180]) Differential_Output_Yolk_Cover();

// Render the object for printing.
// Comment or uncomment as needed.
//Differential_Output_Yolk();
// ----------------------------------------------------------------------------------------------------
