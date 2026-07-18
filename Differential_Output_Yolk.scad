
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
// REVISION:  A1
// START DATE:  7/18/2026
// CURRENT VERSION DATE:  7/18/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A driveshaft yoke with integrated inertial damper that couples the Differential
//    Output Gear to the driveshaft. The hexagonal boss ($fn=6, r=2.0) slides into the
//    matching hex cut in the output shaft for positive rotational engagement. A clamping
//    screw passes through the center bore (r=1.5) into the output shaft bore.
//    The 12mm OD (r=6) flange houses two clicky pen springs that curve around the
//    perimeter providing servo-saver style shock absorption. Each spring seats in a
//    curved toroidal groove (3.5mm wide, radiused to flange OD) recessed into a
//    trapezoidal pocket on the mating face. A hard stop boss at 180 degrees constrains
//    the rotation arc and prevents spring over-extension.
//    Two parts required per differential: one Yolk and one Cover (separate file).
//    Yolk: trapezoid pocket at 0deg, hard stop boss at 180deg.
//    Cover: trapezoid pocket at 180deg, hard stop boss at 0deg.
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
// 3. Pass clamping screw through flange bore into output shaft center bore and tighten.
// 4. Curve two clicky pen springs around the flange OD, seating each end in a groove.
// 5. Mate Cover onto Yolk face, trapping the springs between the trapezoid pockets.
// 6. Fasten Cover to Yolk via boss screw holes.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Differential_Output_Yolk() {
  // Hex boss dimensions — must match hex cut in Differential_Gears.scad.
  boss_r    = 2.0;    // Hex boss radius.
  boss_h    = 8.375;  // Hex boss length.

  // Flange dimensions.
  flange_r  = 6;      // Flange outer radius — OD=12mm houses spring assembly.
  flange_h  = 5;      // Flange thickness.

  // Center bore and hardware recess.
  bore_r    = 1.5;    // Clamping screw clearance bore.
  recess_r  = 3;      // Hardware recess radius on bottom face.
  recess_h  = 3.675;  // Hardware recess depth.

  // Spring groove dimensions.
  // Groove follows flange OD arc — outer edge of groove sits at r=flange_r=6mm.
  // Spring enters through OD opening and seats in curved toroidal floor.
  spring_r  = 1.75;   // Half of 3.5mm oval slot width = spring coil radius.
  groove_r  = flange_r - spring_r;  // 4.25mm — groove centerline radius.
  groove_arc = 50;    // Arc sweep of oval groove in degrees, centered on 0deg.
  pocket_d  = 2.5;    // Depth of trapezoid spring seat pocket from mating face.

  // Hard stop boss dimensions — constrains rotation arc, prevents spring over-extension.
  // Located at 180deg opposite the trapezoid pocket.
  // Cover's trapezoid pocket travels around this boss; boss hits pocket wall to stop.
  stop_r    = 1.5;    // Hard stop boss radius.
  stop_h    = 2.5;    // Hard stop boss protrusion height above mating face.

  difference() {
    union() {
      // Flange plate.
      cylinder($fn=96, r=flange_r, h=flange_h, center=false);
      // Hexagonal boss — slides into output shaft hex cut.
      translate([0, 0, flange_h])
        cylinder($fn=6, r=boss_r, h=boss_h, center=false);
      // Hard stop boss at 180deg — constrains cover rotation arc.
      // Cover's trapezoid pocket sweeps around this boss and stops against its wall.
      rotate([0, 0, 180])
      translate([groove_r, 0, flange_h])
        cylinder($fn=28, r=stop_r, h=stop_h, center=false); }

    // Center bore through full assembly for clamping screw.
    translate([0, 0, -1])
      cylinder($fn=96, r=bore_r, h=flange_h + boss_h + 2, center=false);
    // Hardware recess on bottom face.
    translate([0, 0, -1])
      cylinder($fn=96, r=recess_r, h=recess_h + 1, center=false);

    // Trapezoid spring seat pocket at 0deg — cut from mating face (Z=flange_h) downward.
    // Plan view is trapezoidal: wide at OD edge (4mm), narrow at inner end (2mm).
    // Spring end enters from the OD and seats in the curved groove at the pocket floor.
    hull() {
      // Outer end near OD — wide end of trapezoid.
      translate([5, -2, flange_h - pocket_d]) cube([1, 4, pocket_d + 0.1]);
      // Inner end toward center — narrow end of trapezoid.
      translate([2.5, -1, flange_h - pocket_d]) cube([1, 2, pocket_d + 0.1]); }

    // Curved oval spring groove at 0deg — toroidal section at groove_r=4.25mm.
    // rotate_extrude sweeps circle(r=1.75) along flange OD arc for groove_arc degrees.
    // Outer edge of groove sits at r=6mm = flange_r, opening groove through OD face.
    // Spring curves around OD and its end seats in this curved groove from the side.
    translate([0, 0, flange_h - pocket_d])
    rotate([0, 0, -groove_arc / 2])
    rotate_extrude(angle=groove_arc, $fn=96)
      translate([groove_r, 0]) circle(r=spring_r, $fn=28);

    // Hard stop boss screw hole at 180deg.
    rotate([0, 0, 180])
    translate([groove_r, 0, flange_h - 1])
      cylinder($fn=28, r=1.22, h=stop_h + 2, center=false); } }

// Render the object.
// Comment or uncomment as needed.
//Differential_Output_Yolk();

// Render the object for printing.
// Comment or uncomment as needed.
Differential_Output_Yolk();
// ----------------------------------------------------------------------------------------------------
EOF