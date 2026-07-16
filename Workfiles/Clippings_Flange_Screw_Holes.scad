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

// NAME:  Clippings Flange Screw Holes
// REVISION:  A1
// START DATE:  7/6/2026
// CURRENT VERSION DATE:  7/6/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A reusable module that cuts the 8-hole screw pattern for the clippings flange,
//    including a deep screw recess on the bottom (-Z) face.
// FILE NAME: Clippings_Flange_Screw_Holes.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS
// [Manufacturing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Clippings_Flange_Screw_Holes() {
  // Clippings flange screw holes with deep screw recess on bottom (-Z) face.
  for (i = [0:7]) {
    translate([15.25 * cos(i * 45), 15.25 * sin(i * 45), 0]) {
      // Through hole.
      cylinder($fn=28, r=1.22, h=15, center=false);
      // Deep screw recess on bottom (-Z) face.
      translate([0, 0, -5]) cylinder($fn=28, r=2, h=10, center=false); } } }