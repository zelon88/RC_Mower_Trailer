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

// NAME:  1 Inch Flange Plug
// REVISION:  A1
// START DATE:  6/10/2026
// CURRENT VERSION DATE:  6/10/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A plug that fills an unused 1" flange mounting location, matching the flange screw pattern.
// FILE NAME: 1_Inch_Flange_Plug.scad
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

module One_Inch_Flange_Plug() {
  difference() {
    cylinder($fn=28, r=12.7, h=3, center=true);
    // Six mounting holes spaced evenly around flange.
    for (i = [0:5]) {
      angle = i * 60;            // 360 / 6 = 60 degrees.
      radius = 25.4/2 - 3;       // Holes in middle of flange width.
      translate([radius * cos(angle), radius * sin(angle), -1]) cylinder($fn=20, r=1.25, h=10, center=true);
      translate([radius * cos(angle), radius * sin(angle), 0.5]) cylinder($fn=28, r=2, h=2, center=true); }
    // Angled grooves on top.
    for (y_pos = [-90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30, 35, 40, 45]) {
      translate([-26, y_pos, 1.5]) rotate([0, 0,  45]) cube([300, 1.5, 3], center=true);
      translate([ 26, y_pos, 1.5]) rotate([0, 0, -45]) cube([300, 1.5, 3], center=true); } } }

// Render the object.
// Comment or uncomment as needed.
//One_Inch_Flange_Plug();

// Render the object for printing.
// Comment or uncomment as needed.
//One_Inch_Flange_Plug();
// ----------------------------------------------------------------------------------------------------