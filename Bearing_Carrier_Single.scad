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

// NAME:  Bearing Carrier (Single)
// REVISION:  A1
// START DATE:  5/24/2026
// CURRENT VERSION DATE:  5/24/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude 4.5.
// DESCRIPTION:  
//    A cylindrical cup bearing carrier that houses a 1/4" ID x 1/2" OD x 3/16" Width (R4 Series) ball bearing.
//    Features a flange with mounting holes and integrated endcaps to retain the bearing.
// FILE NAME: Bearing_Carrier_Single.scad
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

module Bearing_Carrier_Single () { 

  // Bearing dimensions (metric conversions).
  bearing_id = 6.35;      // 1/4" ID.
  bearing_od = 12.7;      // 1/2" OD.
  bearing_width = 4.76;   // 3/16" width.

  // Flange dimensions.
  flange_od = 25.4;       // 1" OD.
  flange_thickness = 3;   // 3mm thick.
  cup_depth = 10;          // Cup depth to hold bearing.

  // Cup body with integrated caps.
  difference() {
      union() {
          // Main cylindrical cup.
          cylinder($fn=96, r=bearing_od/2 + 1, h=cup_depth);
          // Integrated cap at bottom.
          cylinder($fn=96, r=bearing_od/2 + 1, h=flange_thickness);
          // Integrated cap at top.
          translate([0, 0, cup_depth]) cylinder($fn=96, r=bearing_od/2 + 1, h=flange_thickness); }
      // Hollow interior for bearing.
      translate([0, 0, flange_thickness - 0.5]) cylinder($fn=96, r=bearing_od/2 + 0.2, h=cup_depth - flange_thickness);
      // Center hole through bottom cap for bearing ID clearance.
      translate([0, 0, -1]) cylinder($fn=96, r=bearing_id/2 + 0.5, h=flange_thickness + 2);
      // Center hole through top cap for bearing ID clearance.
      translate([0, 0, cup_depth - 1]) cylinder($fn=96, r=bearing_id/2 + 0.5, h=flange_thickness + 2); }

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
          translate([radius * cos(angle), radius * sin(angle), -1]) cylinder($fn=20, r=1.25, h=flange_thickness + 2); } } }

// Render the object. 
// Comment or uncomment as needed.
//Bearing_Carrier_Single();
// ----------------------------------------------------------------------------------------------------