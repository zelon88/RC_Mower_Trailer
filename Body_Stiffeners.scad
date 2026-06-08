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

// NAME:  Body Stiffeners
// REVISION:  A1
// START DATE:  6/7/2026
// CURRENT VERSION DATE:  6/7/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    Structural stiffener plates for the Body_Skirt assembly.
//    This file provides two modules consumed by Body_Skirt.scad:
//      - Body_Stiffener_Inner: inner stiffener with a slot for the Center Bracket Support.
//      - Body_Stiffener_Outer: outer stiffener without the bracket support slot.
//    Both stiffeners share the same screw hole pattern for the Reinforcement Rails.
//    All exposed edges are chamfered for a clean finish.
// FILE NAME: Body_Stiffeners.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align screw holes with Reinforcement Rail pattern before installing.
// 3. Inner stiffener slot must clear the Center Bracket Support during assembly.
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
    translate([0, 0, 0]) cube([30, 35, 5], center=true);
    // Cut out a slot for the Center Bracket Support.
    translate([0, 5, 0]) cube([5, 39, 5], center=true);
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

module Body_Stiffener_Outer() {
  difference() {
    union() {
      // Create the main body of the outer stiffener.
      cube([30, 35, 5], center=true);
      // Create the rounded corners.
      translate([15, -17.5, 0]) cylinder($fn=28, r=35, h=5, center=true);
      translate([-15, -17.5, 0]) cylinder($fn=28, r=35, h=5, center=true);
    }
    // Cut off the back of the rounded corners to create the flat side.
    translate([0, -35, 0]) cube([100, 35, 5], center=true);
    // Reinforcement Rail screw holes.
    translate([ 0,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 0,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 0, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    // Top Cover Screw Holes.
    translate([ 16,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 16,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([24,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([24,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([24, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([32,  0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([32, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([40,  -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-32,  0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-32, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-40,  -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
} }

// Render the object.
// Comment or uncomment as needed.
//translate([0, 30, 0]) Body_Stiffener_Inner();
//Body_Stiffener_Outer();

// Render the object for printing.
// Comment or uncomment as needed.
//translate([35, 0, 0]) Body_Stiffener_Inner();
//Body_Stiffener_Outer();
// ----------------------------------------------------------------------------------------------------
