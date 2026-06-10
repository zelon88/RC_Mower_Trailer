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

// NAME:  Body Stiffener Inner
// REVISION:  A1
// START DATE:  6/7/2026
// CURRENT VERSION DATE:  6/10/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    Inner structural stiffener plate for the Body_Skirt assembly.
// FILE NAME: Body_Stiffener_Inner.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align screw holes with Reinforcement Rail pattern before installing.
// 3. Slot must clear the Center Bracket Support during assembly.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

include <Center_Bracket_Support.scad>
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Body_Stiffener_Inner() {
  difference() {
    // Create the main body of the inner stiffener.
    translate([0,0,0]) cube([30,35,5], center=true);
    // Cut out a slot for the Center Bracket Support.
    translate([0,5,0]) cube([5,39,5], center=true);
    // Reinforcement Rail screw holes.
    translate([ 0, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 0, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 0, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true); } }

// Render the object.
// Comment or uncomment as needed.
//Body_Stiffener_Inner();

// Render the object for printing.
// Comment or uncomment as needed.
//Body_Stiffener_Inner();
// ----------------------------------------------------------------------------------------------------
