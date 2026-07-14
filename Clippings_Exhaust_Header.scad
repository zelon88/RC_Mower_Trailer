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

// NAME:  Clippings Exhaust Header
// REVISION:  A1
// START DATE:  7/4/2026
// CURRENT VERSION DATE:  7/13/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A clippings evacuation flange that mates with the landing pad in Body_Half.scad.
//    Features a 3mm flange plate, 8x screw holes, a 20mm straight tube (ID=13mm),
//    8x tapered vertical ribs, a 45deg curved elbow indexed between flange screw holes,
//    and a straight extension after the elbow that reaches into the rear of the hopper.
//    Adjust ext_h to position the pipe end inside the hopper in the assembly.
//    Once situated, a mating flange will be added to join the two parts.
// FILE NAME: Clippings_Exhaust_Header.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align screw holes with Clippings_Flange_Screw_Holes() pattern on Body_Half.
// 3. Fasten with M2.5 screws through 8x flange holes.
// 4. Orient elbow and extension toward hopper — adjust index_angle if needed.
// 5. Adjust ext_h until pipe end sits inside hopper, then add mating flange.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

include <Workfiles/Clippings_Flange_Screw_Holes.scad>
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Clippings_Flange_Exhaust_Header() {
  // Flange dimensions.
  flange_r = 18; // Outer radius — matches landing pad r1=19 in Body_Half.
  flange_t = 2.5; // Thickness of flange plate.
  flange_id = 13; // Inner bore radius of flange face.

  // Tube dimensions.
  tube_id = 13; // Inner radius.
  tube_od = 14; // Outer radius — 1mm wall.
  tube_h = 40; // Length of straight tube above flange.

  // Rib dimensions.
  rib_base_depth = flange_r - tube_od; // Radial depth at base (4mm).
  rib_top_depth = 1.5; // Radial depth at top (mm).
  rib_base_width = 2.5; // Tangential width at base (mm).
  rib_top_width = 1.2; // Tangential width at top (mm).
  rib_h = 10; // Height of ribs above flange face (mm).

  // Elbow dimensions.
  bend_r = 14; // Centerline bend radius = 1x tube OD.
  bend_angle = 45; // Bend angle in degrees.
  // index_angle orients the elbow exit toward the hopper.
  // Screw holes are at every 45deg; keep at multiples of 22.5 to stay between holes.
  index_angle = 7.5;

  // Extension dimensions.
  // Straight pipe section after the elbow, angled at 45deg into the hopper.
  // Increase ext_h until the pipe end sits comfortably inside the hopper in the assembly.
  ext_h = 52.75; // Length of extension pipe (mm) — tune in assembly to reach hopper interior.

  // Exit point of elbow in tube-top-local space.
  // Derived from bend_r and bend_angle — update if either changes.
  exit_x = bend_r * (1 - cos(bend_angle)); // = 14 * 0.293 = 4.1mm.
  exit_z = bend_r * sin(bend_angle);        // = 14 * 0.707 = 9.9mm.

  difference() {
    union() {
      // Flange plate.
      cylinder($fn=96, r=flange_r, h=flange_t, center=false);
      // Straight tube rising from top face of flange.
      translate([0, 0, flange_t]) cylinder($fn=96, r=tube_od, h=tube_h, center=false);
      // Tapered vertical ribs (8x, between screw holes).
      for (i = [0:7]) {
        rotate([0, 0, i * 45 + 22.5])
        hull() {
          translate([tube_od + rib_base_depth / 2, 0, flange_t])
            cube([rib_base_depth, rib_base_width, 0.01], center=true);
          translate([tube_od + rib_top_depth / 2, 0, flange_t + rib_h])
            cube([rib_top_depth, rib_top_width, 0.01], center=true); } }
      // 45deg curved elbow at top of straight tube.
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r, 0, 0])
      rotate([0, 0, 180])
      rotate([90, 0, 0])
      rotate_extrude(angle=bend_angle, $fn=96)
        translate([bend_r, 0]) circle(r=tube_od, $fn=48);
      // Straight extension after the elbow, following the elbow exit direction at 45deg.
      // exit_x and exit_z position the start at the elbow exit face.
      // rotate([0, 45, 0]) aligns the cylinder axis with the exit tangent (0.707, 0, 0.707).
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([exit_x, 0, exit_z])
      rotate([0, 45, 0])
        cylinder($fn=48, r=tube_od, h=ext_h, center=false); }

    // Bore through flange and straight tube.
    translate([0, 0, flange_t]) cylinder($fn=96, r=tube_id, h=flange_t + tube_h + 2, center=false);
    translate([0, 0, -1]) cylinder($fn=96, r=flange_id, h=flange_t + 2, center=false);
    // Bore through the elbow.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([bend_r, 0, 0])
    rotate([0, 0, 180])
    rotate([90, 0, 0])
    rotate_extrude(angle=bend_angle + 1, $fn=96)
      translate([bend_r, 0]) circle(r=tube_id, $fn=48);
    // Bore through the straight extension.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([exit_x, 0, exit_z])
    rotate([0, 45, 0])
      cylinder($fn=48, r=tube_id, h=ext_h + 1, center=false);
    // 8x screw holes through flange with deep recess on bottom face.
    translate([0, 0, 7.25]) rotate([0, 180, 0]) Clippings_Flange_Screw_Holes(); } }

// Render the object.
// Comment or uncomment as needed.
Clippings_Flange_Exhaust_Header();

// Render the object for printing.
// Comment or uncomment as needed.
//Clippings_Flange_Exhaust_Header();
// ----------------------------------------------------------------------------------------------------
