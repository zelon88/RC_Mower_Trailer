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

// NAME:  Body Stiffener Inner (Lower)
// REVISION:  A1
// START DATE:  6/7/2026
// CURRENT VERSION DATE:  6/10/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    Inner Lower structural stiffener plate for the Body_Skirt assembly.
// FILE NAME: Body_Stiffener_Inner_Lower.scad
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
// GEOMETRY

module Body_Stiffener_Inner_Lower() {
  difference() {
    union() {
      // Create the main body of the outer stiffener.
      cube([30, 35, 5], center=true);
      // Create the rounded outer corners.
      translate([ 15, -17.5, 0]) cylinder($fn=128, r=35, h=5, center=true);
      translate([-15, -17.5, 0]) cylinder($fn=128, r=35, h=5, center=true); }
    // Cut off the back of the rounded corners to create the flat rear edge.
    translate([0, -35, 0]) cube([100, 35, 5], center=true);
    // Reinforcement Rail screw hole recesses.
    translate([ 0, 10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 0, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 0, 0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 8, 10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 8, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 8, 0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8, 10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8, 0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    // Reinforcement Rail screw holes.
    translate([ 0, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 0, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 0, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    // Top Cover screw hole recesses.
    translate([ 16,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 16,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 16, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 24,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 24,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 24, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 32,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 32, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 40, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-24,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-24,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-24, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-32,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-32, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-40, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    // Top Cover screw holes.
    translate([ 16,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 16,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 24,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 24,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 24, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 32,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 32, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 40, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-32,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-32, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-40, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    // Cut the whole thing almost in half.
    translate([-38.5, 0, 0]) cube([50, 60, 10], center=true);
    // Angled grooves on top.
    for (y_pos = [-90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30, 35, 40, 45]) {
      translate([-26, y_pos, 2.5]) rotate([0, 0,  45]) cube([300, 1.5, 3], center=true);
      translate([ 26, y_pos, 2.5]) rotate([0, 0, -45]) cube([300, 1.5, 3], center=true); } } }

// Render the object.
// Comment or uncomment as needed.
//Body_Stiffener_Inner_Lower();

// Render the object for printing.
// Comment or uncomment as needed.
//Body_Stiffener_Inner_Lower();
// ----------------------------------------------------------------------------------------------------
