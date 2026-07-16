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

// NAME:  Motors
// REVISION:  A1
// START DATE:  5/28/2026
// CURRENT VERSION DATE:  5/28/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    Low-poly representative models of the two standard 540 brushed DC electric motors,
//    used for rendering and fit-checking only. Not intended to be 3D printed.
// FILE NAME: Motors.scad
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

module Motors() {
  // These cylinders represent standard 540 brushed DC electric motors with a length of 55mm.
  translate([-28, 12, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=55);
  translate([28, 45.5, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=55); }