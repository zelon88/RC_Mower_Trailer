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
// CURRENT VERSION DATE:  7/4/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A clippings evacuation flange that mates with the landing pad in Body_Half.scad.
//    Features a 3mm flange plate matching the landing pad outer radius (r=19), an 8x screw
//    hole pattern matching Clippings_Flange_Screw_Holes(), a 20mm tube with ID=13mm
//    for routing clippings away from the cutting deck, and 8x tapered vertical ribs
//    between the screw holes spanning from the flange face to 10mm up the tube.
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
// 4. Attach clippings routing hose or chute to tube OD.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

include <Workfiles/Clippings_Flange_Screw_Holes.scad>
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Clippings_Flange() {
  // Flange dimensions.
  flange_r = 18; // Outer radius — matches landing pad r1=19 in Body_Half.
  flange_t = 2.5; // Thickness of flange plate.
  flange_id = 13; // Inner bore radius through flange face.

  // Tube dimensions.
  tube_id = 13; // Inner radius.
  tube_od = 14; // Outer radius — 1mm wall.
  tube_h = 20; // Length of tube above flange.

  // Rib dimensions.
  rib_base_depth = flange_r - tube_od; // Radial depth at base (4mm, flange edge to tube wall).
  rib_top_depth = 1.5; // Radial depth at top (mm).
  rib_base_width = 2.5; // Tangential width at base (mm).
  rib_top_width = 1.2; // Tangential width at top (mm).
  rib_h = 10; // Height of ribs above flange face (mm).

  difference() {
    union() {
      // Flange plate.
      cylinder($fn=96, r=flange_r, h=flange_t, center=false);
      // Tube rising from top face of flange.
      translate([0, 0, flange_t]) cylinder($fn=96, r=tube_od, h=tube_h, center=false);
      // Tapered vertical ribs (8x, between screw holes).
      // Placed at 22.5deg offset — midway between each 45deg screw hole position.
      // Hull between wide base at flange top and narrow tab at rib_h up the tube.
      for (i = [0:7]) {
        rotate([0, 0, i * 45 + 22.5])
        hull() {
          // Wide base sitting on top of the flange face.
          translate([tube_od + rib_base_depth / 2, 0, flange_t])
            cube([rib_base_depth, rib_base_width, 0.01], center=true);
          // Narrow tab at rib_h up the tube wall.
          translate([tube_od + rib_top_depth / 2, 0, flange_t + rib_h])
            cube([rib_top_depth, rib_top_width, 0.01], center=true); } } }
    // Bore through full assembly (flange + tube).
    translate([0, 0, flange_t]) cylinder($fn=96, r=tube_id, h=flange_t + tube_h + 2, center=false);
    translate([0, 0, -1]) cylinder($fn=96, r=flange_id, h=flange_t + tube_h + 2, center=false);
    // 8x screw holes through flange, with deep recess on bottom face.
    translate([0, 0, 7.25]) rotate([0, 180, 0]) Clippings_Flange_Screw_Holes(); } }

// Render the object.
// Comment or uncomment as needed.
//Clippings_Flange();

// Render the object for printing.
// Comment or uncomment as needed.
Clippings_Flange();
// ----------------------------------------------------------------------------------------------------
