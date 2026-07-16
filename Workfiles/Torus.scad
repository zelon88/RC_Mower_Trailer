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

// NAME:  Torus
// REVISION:  A1
// START DATE:  5/25/2026
// CURRENT VERSION DATE:  5/25/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A utility module for creating a torus, used to aid in crafting the mating surfaces of the body.
// FILE NAME: Torus.scad
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

module Torus(R1, R2) {
  RA = R1 / 2;
  RB = R2 / 2 - R1 / 2;
  rotate_extrude(convexity=10, $fn=144) translate([RB, 0, 0]) circle(r=RA, $fn=144); }