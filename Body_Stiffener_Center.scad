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

// NAME:  Body Stiffener Center
// REVISION:  A1
// START DATE:  6/7/2026
// CURRENT VERSION DATE:  6/10/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    Center structural stiffener plate for the Body_Skirt assembly.
// FILE NAME: Body_Stiffener_Center.scad
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

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Body_Stiffener_Center() {
  difference() {
    // Create the main body of the inner stiffener.
    translate([0, 0, 0]) cube([100, 34, 5], center=true);
    // Cut out the holes for the Bearing Carriers.
    translate([0, 0, 0]) cylinder($fn=28, r1=12.85, r2=13.25, h=5, center=true);
    translate([0, 0, 1.5]) cylinder($fn=28, r1=12.9, r2=13.75, h=5, center=true);
    // Cut out the holes for the Ball Joint Receivers.
    translate([32.5, 0, 0]) cylinder($fn=28, r1=12.85, r2=13.25, h=5, center=true);
    translate([32.5, 0, 1.5]) cylinder($fn=28, r1=12.9, r2=13.75, h=5, center=true);
    translate([-32.5, 0, 0]) cylinder($fn=28, r1=12.85, r2=13.25, h=5, center=true);
    translate([-32.5, 0, 1.5]) cylinder($fn=28, r1=12.9, r2=13.75, h=5, center=true);
    // Top Cover screw hole recesses.
    translate([46.5, 10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([46.5, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([8, 13.75, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([8, -13.75, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([16,  0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([16, 10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([16, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16, 0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16, 10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8, 13.75, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8, -13.75, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-46.5, 10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-46.5, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    // Top Cover screw holes.
    translate([46.5, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([46.5, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([8, 13.75, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([8, -13.75, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([16, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([16, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, 13.75, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, -13.75, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-46.5, 10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-46.5, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true); } }

// Render the object.
// Comment or uncomment as needed.
//Body_Stiffener_Center();

// Render the object for printing.
// Comment or uncomment as needed.
Body_Stiffener_Center();
// ----------------------------------------------------------------------------------------------------
