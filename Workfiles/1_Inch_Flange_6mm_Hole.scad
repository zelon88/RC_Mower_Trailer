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

// NAME:  1 Inch Flange 6mm Hole
// REVISION:  A1
// START DATE:  6/8/2026
// CURRENT VERSION DATE:  6/8/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A utility module that mates a 1" flange screw pattern with a 6mm center through hole.
// FILE NAME: 1_Inch_Flange_6mm_Hole.scad
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

module One_Inch_Flange_6mm_Hole() {
  // Six mounting holes spaced evenly around flange.
  for (i = [0:5]) {
    angle = i * 60;             // 360 / 6 = 60 degrees.
    radius = 25.4/2 - 3;        // Holes in middle of flange width.
    translate([radius * cos(angle), radius * sin(angle), -1]) cylinder($fn=20, r=1.25, h=10); }
  // Center hole through bottom half of body for bearing ID clearance.
  translate([0, 0, 0]) cylinder($fn=28, r=6 - 1, h=20); }