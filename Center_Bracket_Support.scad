// ----------------------------------------------------------------------------------------------------
// PROJECT INFORMATION

// NAME:  R/C Mower Trailer
// REVISION:  A1
// START DATE:  8/20/2021
// CURRENT VERSION DATE:  9/2/2021
// LICENSE:  GPLv3
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  A tow-behind lawn mowing attachment for retrofit onto low-speed R/C vehicles.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PART INFORMATION

// NAME:  Center Bracket Support
// REVISION:  A1
// START DATE:  8/24/2021
// CURRENT VERSION DATE:  5/28/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A triangular support bracket that secures the mower decks to the center bracket.
//    Intended to provide structural support to the mower decks.
//    Two pieces are required per assembly.
//    Pieces are mounted vertically to the uprights of the center bracket with one on each side.
//    Pieces are also mounted horizontally to the tops of the mower decks.
// FILE NAME: Center_Bracket_Support.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Apply CA glue onto dowel pins "Center_Bracket.scad".
// 3. Press dowel pins into locating holes on each upright of the center bracket.
// 4. Attach mower decks to center bracket and install screws to secure them to each triangular support.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating torus' to aide in crafting the body.
include <Workfiles/Torus.scad>;
// A module for creating right triangles.
include <Workfiles/Right_Triangle.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Center_Bracket_Support() {
  // Create the triangle upright supports, outer, lower.
  difference() {
    // Main body of center bracket support.
    translate([2.5, -17, 15.23]) rotate([90, 0, 270]) triangle(26.5, 55, 5, center=false);

    // Cut off the end of the triangle after the final screw hole.
    translate([0, -62, 20]) cube([10, 15, 10], center=true);

    // Square off the top of the triangle to clear the Differential Output Yolk Cover.
    translate([0, -20, 45]) cube([10, 10, 10], center=true);

    // Adjust height to match reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 150, 3.175], center=true);

    // Adjust height to match top cover plate of mower deck.
    // Note that this is offset slightly to trim an unwanted chunk of leftover geometry.
    translate([0, -70, 16]) cylinder(r1=62, r2=57, h=4, $fn=144);

    // Bottom screw holes for mower deck.
    translate([0, -50, 15]) cylinder($fn=28, r=1.22, h=10, center=false);
    translate([0, -40, 15]) cylinder($fn=28, r=1.22, h=10, center=false);
    translate([0, -30, 15]) cylinder($fn=28, r=1.22, h=10, center=false); }

  // Create the lower locating dowel for the center bracket support.
  translate([0, -13, 28.5]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center=true);
  // Create the upper locating dowel for the center bracket support.
  translate([0, -13, 37]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center=true); }

// Render the object.
// Comment or uncomment as needed.
//Center_Bracket_Support();

// Render the object for printing.
// Comment or uncomment as needed.
Center_Bracket_Support();
// ----------------------------------------------------------------------------------------------------