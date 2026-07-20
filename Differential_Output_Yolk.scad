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
// GEOMETRY

module Differential_Output_Yolk() {
  // Hex boss dimensions — must match hex cut in Differential_Gears.scad output shaft.
  boss_r  = 2.0;    // Hex boss radius — matches $fn=6, r=2.0 cut in output shaft.
  boss_h  = 8.375;  // Hex boss length — fills the output shaft hex cut depth.

  // Circular flange dimensions.
  flange_r = 14;    // Flange outer radius.
  flange_h = 10;     // Flange thickness — increased to 5mm to accommodate hardware recess.

  // Center bore — matches output shaft bore r=1.5 for clamping screw pass-through.
  bore_r = 1.5;

  // Hardware recess on bottom face of flange — seats mounting hardware flush.
  recess_r = 3.675;      // Recess radius.
  recess_h = 3.875;  // Recess depth from bottom face.

  difference() {
    union() {
      difference() {
        // Create the body of the circular flange — driveshaft attachment surface.
        cylinder($fn=96, r=flange_r, h=flange_h, center=false);
        // Hollow out the flange to create a drum.
        cylinder($fn=96, r=flange_r - 1, h=flange_h - 1, center=false); }
      // The upper trapezoid spring perch.
      translate([0, 0, (flange_h / 2) - 0.5]) rotate([0, 90, 0]) hull() {
        translate([0, 0, 0]) 
          cube([flange_h - 1, 1, 2], center = true); 
        translate([0, 0, 12]) 
          cube([flange_h - 1, 9, 2], center = true); }
      // Add the hub material to the inside of the drum.
      cylinder($fn=96, r=recess_r + 1, h=flange_h, center=false);
      // Hexagonal boss — slides into hex cut in output shaft for rotational engagement.
      // $fn=6 matches the output shaft cut exactly. All 6 orientations are identical.
      translate([0, 0, flange_h])
        cylinder($fn=6, r=boss_r, h=boss_h, center=false); }
    // Center bore through full assembly for mounting screw.
    translate([0, 0, -1])
      cylinder($fn=96, r=bore_r, h=flange_h + boss_h + 2, center=false);
    // Hardware recess on bottom face — allows mounting hardware to sit flush.
    translate([0, 0, -1])
      cylinder($fn=96, r=recess_r, h=recess_h + 1, center=false); 
    // Screw holes for cover.
    translate([10.5, 0, 5])
      cylinder($fn=96, r=1.22, h=10, center=true);
    translate([6.5, 0, 5])
      cylinder($fn=96, r=1.22, h=10, center=true);
    translate([-10.5, 0, 5])
      cylinder($fn=96, r=1.22, h=10, center=true);
    translate([-6.5, 0, 5])
      cylinder($fn=96, r=1.22, h=10, center=true);
    // Spring perch recesses.
    translate([8.125, 3.39, 4.5]) rotate([0, 90, -71.5])
      cylinder($fn=96, r=4.1, h=0.325, center=true);
    translate([8.125, -3.39, 4.5]) rotate([0, 90, 71.5])
      cylinder($fn=96, r=4.1, h=0.325, center=true);

} }


// We need to make this fit a toothed belt. With 15mm spur and 7.5mm pinion this needs 91.85mm distance.


// Render the object.
// Comment or uncomment as needed.
//Differential_Output_Yolk();

// Render the object for printing.
// Comment or uncomment as needed.
Differential_Output_Yolk();
// ----------------------------------------------------------------------------------------------------
