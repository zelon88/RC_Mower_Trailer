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

// NAME:  Wheel
// REVISION:  A1
// START DATE:  6/3/2026
// CURRENT VERSION DATE:  6/3/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A placeholder wheel used to represent a standard 1.9" R/C wheel and tire for rendering.
// FILE NAME: Wheel.scad
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

module Wheel() {
  difference() {
    // Create a cylinder to represent the tire.
    rotate([90, 0, 0]) cylinder($fn=48, r=46, h=30, center=true);
    // Bore a center hole.
    rotate([90, 0, 0]) cylinder($fn=48, r=2, h=30, center=true);
    // Bore a hole in the sides to represent a 1.9" rim.
    translate([0, 22, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=24.13, h=30, center=true);
    translate([0, -12, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=24.13, h=30, center=true); } }

// Render the object.
// Comment or uncomment as needed.
//Wheel();

// Render the object for printing.
// Comment or uncomment as needed.
//Wheel();
// ----------------------------------------------------------------------------------------------------