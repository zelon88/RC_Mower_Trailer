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
// REVISION:  A4
// START DATE:  7/18/2026
// CURRENT VERSION DATE:  7/26/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Sonnet 5.
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
// Shared frustum-with-radiused-large-end profile — also used by the roller and cover race cut.
include <Workfiles/Filleted_Frustum.scad>;
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
      // The upper trapezoid spring perch.
      translate([0, 0, (flange_h / 2) - 0.5]) rotate([0, 90, 0]) hull() {
        translate([0, 0, 0]) 
          cube([flange_h - 1, 1, 2], center = true); 
        translate([0, 0, 6.7]) 
          cube([flange_h - 1, 7, 2], center = true); }
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
    // Screw holes for cover.
    translate([5.25, 0, 5])
      cylinder($fn=96, r=0.99, h=15, center=true);
    translate([-5.25, 0, 5])
      cylinder($fn=96, r=0.99, h=15, center=true);
    // Roller bearing inner race — partial frustum groove in yolk OD, 2mm from open end.
    // Frustum matches roller taper: deep cut (large-end match) at the bottom of this
    // block (Z=4, world), shallow cut (small-end match) at the top (Z=7.375, world) —
    // confirmed against the cover's assembly transform: the cover's own race puts the
    // roller's large end at the LOWER world Z and small end at the HIGHER world Z, so
    // the yolk's cut must follow the same sense.
    // r1=flange_r-0.35 (deep, large-end match) sits at Z=0 and gets the fillet via
    // fillet_end="r1" — a direct tangent-circle derivation for that corner, not a
    // mirrored copy of the r2 case. (An earlier attempt built this by mirroring the
    // standard r2-end shape onto Z=0; mirror() reflects the mesh, which flips face
    // winding/normals and rendered the round-over as a concave notch instead of a
    // proper fillet.) r2=flange_r-0.30 (shallow, small-end match) stays sharp at
    // Z=3.375, with extra_h=0.4 continuing flat to clear the outer clipping shell —
    // same total reach (3.775) as before.
    translate([0, 0, 4])
      difference() {
        cylinder($fn=96, r=flange_r + 0.1, h=3.375 + 0.2, center=false);
        Filleted_Frustum(r1=flange_r - 0.35, r2=flange_r - 0.30, h=3.375, fillet_r=0.15, extra_h=0.4, fillet_end="r1", fn=96);

 }


    // The installation notch.
    rotate([0, 0, 110])
      translate([flange_r + 0.725, 0, 2.75])
        cylinder($fn=28, r=1.025, h=5.5, center=true);

    // Screw recesses in bottom face for cover.
    translate([5.25, 0, (flange_h + 1.125)])
      cylinder($fn=96, r=1.75, h=3, center=true);
    translate([-5.25, 0, (flange_h + 1.125)])
      cylinder($fn=96, r=1.75, h=3, center=true);

    // Upper Spring perch recesses.
    translate([4.5, 2.825, 2.25]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4.5, -2.825, 2.25]) rotate([0, 90, 65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    // Lower Spring perch recesses.
    translate([4.5, 2.825, 6.375]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4.5, -2.825, 6.375]) rotate([0, 90, 65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);

} 
}

// We need to make this fit a toothed belt. With 15mm spur and 7.5mm pinion this needs 91.85mm distance.


// Render the object.
// Comment or uncomment as needed.
Differential_Output_Yolk();
// Create the triple stacked 5x8 bearings that support independant rotation of the cover.
translate([0, 0, 0])bearing_3x5x2_5();
translate([0, 0, 2.5])bearing_3x5x2_5();
translate([0, 0, 5]) bearing_3x5x2_5();
// Outer bearing that mounts into the Center Bracket.
translate([0, 0, 14.5]) rotate([0, 180, 0]) flanged_bearing_5x8x2_5();
translate([0, 0, 14.5]) bearing_5x8x2_5();

// USE THIS FOR DIMENSIONAL REFERENCE!!!
// Add the Output Yolk Cover.
translate([0, 0, 9.9875]) rotate([0, 180, 0]) Differential_Output_Yolk_Cover();

// THIS IS FOR VISUAL REFERENCE ONLY!!!
// DO NOT USE THIS AS AN ASSEMBLY DIAGRAM!!!
// DO NOT USE THIS FOR DIMENSIONAL REFERENCE!!!
// Check alignment of the internal damper parts by layering the Output Yolk and Output Cover over each other with open ends facing the same direction.
//translate([0, 0, 0]) rotate([0, 0, 180]) Differential_Output_Yolk_Cover();

// Render the object for printing.
// Comment or uncomment as needed.
//Differential_Output_Yolk();
// ----------------------------------------------------------------------------------------------------
