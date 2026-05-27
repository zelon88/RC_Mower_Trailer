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

// NAME:  Bearing Carrier (Dual)
// REVISION:  A1
// START DATE:  5/24/2026
// CURRENT VERSION DATE:  5/27/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:  
//    A cylindrical cup bearing carrier that houses dual 1/4" ID x 1/2" OD x 3/16" Width (R4 Series) ball bearing.
//    Features a flange with mounting holes and integrated endcaps to retain the bearing.
// FILE NAME: Bearing_Carrier_Dual.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Press fit bearing into cup.
// 3. Endcaps are integrated into the carrier body.
// 4. A Bic "Round Stic" pen can be cut to length & used as a spacer.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Bearing_Carrier_Dual () { 

  // Bearing dimensions (metric conversions).
  bearing_id = 6.35;      // 1/4" ID.
  bearing_od = 12.7;      // 1/2" OD.
  bearing_width = 4.76;   // 3/16" width.

  // Flange dimensions.
  flange_od = 25.4;       // 1" OD.
  flange_thickness = 3;   // 3mm thick.
  cup_depth = 16;          // Cup depth to hold bearing.

  // Cup body with integrated caps.
  difference() {
      union() {
          // Main cylindrical cup.
          cylinder($fn=96, r=bearing_od/2 + 1, h=cup_depth);
          // Integrated cap at top.
          translate([0, 0, cup_depth]) cylinder($fn=96, r=bearing_od/2 + 1, h=flange_thickness); }
      // Hollow interior for bearing.
      translate([0, 0, flange_thickness - 0.5]) cylinder($fn=96, r=bearing_od/2 + 0.2, h=cup_depth - flange_thickness);
      // Center hole through bottom cap for bearing ID clearance.
      translate([0, 0, -1]) cylinder($fn=96, r=bearing_id/2 + 0.5, h=flange_thickness + 2);
      // Center hole through top cap for bearing ID clearance.
      translate([0, 0, cup_depth - 1]) cylinder($fn=96, r=bearing_id/2 + 0.5, h=flange_thickness + 2); }

  // Tapered reinforcement ribs (6x, between screw holes).
  // Each rib spans from the top of the flange to the top of the integrated cap.
  // Wide and deep at the base (full flange width), narrow at the top (cup wall only).
  cup_r_outer   = bearing_od/2 + 1;              // Outer radius of cup body (7.35 mm).
  rib_base_depth = flange_od/2 - cup_r_outer;    // Radial depth at base (~5.35 mm, flange edge to cup wall).
  rib_top_depth  = 2;                            // Radial depth at top (mm).
  rib_base_width = 3.5;                          // Tangential width at base (mm).
  rib_top_width  = 1.5;                          // Tangential width at top (mm).

  for (i = [0:5]) {
    rib_angle = i * 60 + 30;                     // Midway between each pair of screw holes.
    rotate([0, 0, rib_angle])
    hull() {
      // Wide base sitting on top of the flange.
      translate([cup_r_outer + rib_base_depth/2, 0, flange_thickness])
        cube([rib_base_depth, rib_base_width, 0.01], center=true);
      // Narrow tab at the very top of the part (top of integrated cap).
      translate([cup_r_outer + rib_top_depth/2, 0, cup_depth + flange_thickness])
        cube([rib_top_depth, rib_top_width, 0.01], center=true); } }

  // Flange.
  difference() {
      // Main flange plate.
      translate([0, 0, 0]) cylinder($fn=96, r=flange_od/2, h=flange_thickness);
      // Center hole for bearing ID clearance.
      translate([0, 0, -1]) cylinder($fn=96, r=bearing_id/2 + 0.5, h=flange_thickness + 2);
      // Six mounting holes spaced evenly around flange.
      for(i = [0:5]) {
          angle = i * 60;  // 360/6 = 60 degrees.
          radius = flange_od/2 - 3;  // Holes in middle of flange width.
          translate([radius * cos(angle), radius * sin(angle), -1]) cylinder($fn=20, r=1.25, h=flange_thickness + 2); } }

  // Add a lip for attaching a dust boot.
  difference() {
    union() {
      translate([0, 0, flange_thickness + cup_depth - 2]) cylinder($fn=96, r1=bearing_od/2 + 1, r2=bearing_od/2 + 3.15, h=2.15);
      translate([0, 0, flange_thickness + cup_depth]) cylinder($fn=96, r1=bearing_od/2 + 3.25, r2=bearing_od/2 + 3.35, h=0.25); }
    translate([0, 0, flange_thickness + cup_depth - 2]) cylinder($fn=96, r1=bearing_od/2, r2=bearing_od/2 + 0.3, h=2.4); } }

module Bearing_Carrier_Dual_Cap() {

  // Bearing dimensions (metric conversions).
  bearing_id = 6.35;      // 1/4" ID.
  bearing_od = 12.7;      // 1/2" OD.
  bearing_width = 4.76;   // 3/16" width.

  // Flange dimensions.
  flange_od = 25.4;       // 1" OD.
  flange_thickness = 3;   // 3mm thick.
  cup_depth = 10;          // Cup depth to hold bearing.

  difference() {
    // Cap at bottom.
    cylinder($fn=96, r=bearing_od/2 + 1, h=flange_thickness); 
    // Center hole through bottom cap for bearing ID clearance.
    translate([0, 0, -1]) cylinder($fn=96, r=bearing_id/2 + 0.5, h=flange_thickness + 2); } }

// Render the object. 
// Comment or uncomment as needed.
//Bearing_Carrier_Dual();
//Bearing_Carrier_Dual_Cap();

// Render the object for printing. 
// Comment or uncomment as needed.
Bearing_Carrier_Dual();
//translate([30, 0, 0]) Bearing_Carrier_Dual_Cap();
// ----------------------------------------------------------------------------------------------------