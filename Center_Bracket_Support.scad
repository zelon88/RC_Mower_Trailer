// ----------------------------------------------------------------------------------------------------
// PROJECT INFORMATION

// NAME:  R/C Mower Trailer
// REVISION:  A1
// START DATE:  8/20/2021
// CURRENT VERSION DATE:  9/2/2021
// LICENSE:  GPLv3
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    A tow-behind lawn mowing attachment for retrofit onto low-speed R/C vehicles.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PART INFORMATION

// NAME:  Center Bracket Support
// REVISION:  A1
// START DATE:  8/24/2021
// CURRENT VERSION DATE:  9/8/2021
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    A triangular support bracket that secures the mower decks to the center bracket. 
//    Intended to provide structural suppport to the mower decks.
//    Two pieces are required per assembly. 
//    Pieces are mounted vertically to the uprights of the center bracket with one on each side.
//    Pieces are also mounted horizontally to the tops of the mower decks.
// FILE NAME: Center_Bracket_Support.scad

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Apply CA glue onto dowel pins "Center_Bracked.scad".
// 3. Press dowel pins into locating holes on each upright of the center bracket.
// 4. Attach mower decks to center bracket and install screws to secure them to each triangular support.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating torus' to aide in crafting the body.
module Torus(R1,R2) { 
  RA=R1 /2;
  RB=R2 /2 - R1/2 ;
  rotate_extrude(convexity = 10, $fn = 144) translate([RB, 0, 0]) circle(r = RA, $fn = 144); }

// A module for creating right triangles.
// https://github.com/openscad/MCAD/blob/master/triangles.scad
module triangle(o_len, a_len, depth, center=false) {
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    translate(centroid) linear_extrude(height=depth) {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]); } }
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// Triangle upright supports, outer, lower.
difference() { 
    // Main body of center bracket support,
    translate([2.5, -17, 15]) rotate([90, 0, 270]) triangle(25.5, 40, 5, center=false);
    
    // Simulate the area consumed by the reinforcement rail. 
    translate([-50, -60, 15]) cube([60, 60, 3.175], center=false); 
    // Bottom screw holes for mower deck.
    translate([0, -50, 18.17]) cylinder($fn=28, r=1.22, h=6.5, center=false);
    translate([0, -40, 18.17]) cylinder($fn=28, r=1.22, h=6.5, center=false);
    translate([0, -30, 18.17]) cylinder($fn=28, r=1.22, h=6.5, center=false);
    translate([0, -20, 18.17]) cylinder($fn=28, r=1.22, h=6.5, center=false); }
// Screw support.
difference() { 
    translate([0, -50, 18.17]) cylinder($fn=28, r=2.25, h=5.5, center=false);
    // Through hole for screw. 
    translate([0, -50, 18.17]) cylinder($fn=28, r=1.22, h=8, center=false); }
// Locating dowel, center bracket suppport, lower.
translate([0, -13, 28.5]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center = true); 
// Locating dowel, center bracket suppport, upper.
translate([0, -13, 37]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center = true);
// ----------------------------------------------------------------------------------------------------