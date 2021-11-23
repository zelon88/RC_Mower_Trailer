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

// NAME:  Center Bracket
// REVISION:  A1
// START DATE:  8/31/2021
// CURRENT VERSION DATE:  8/31/2021
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    The top cover serves as a mounting bracket for a single 40mm cooling fan.
//    Also protects the motors and differential from airborne debris.
// FILE NAME: Top_Cover.scad

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// Make studs by installing extra long screws and cutting off the heads.

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
        polygon(points=[[0, 0], [a_len,0], [0,o_len]], paths=[[0, 1, 2]]); } }
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// Top cover.

// Center piece, flat.
difference() { 
    // Main body of center piece.
    translate([0, 0, 70]) cube([16.4, 37, 3], center=true);
    
    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13.5, h=20, center=true); 
    }

// Right piece, 15 degrees.
difference() { 
    // Main body of right piece, 15 degrees.
    translate([23.5, 0, 65.9]) rotate([0, 15, 0]) cube([33, 37, 3], center=true);

    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13.5, h=20, center=true); 
    // Screw holes.
    translate([15, 13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([25, 13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([35, 13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true); 
    translate([15, -13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([25, -13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([35, -13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true); }

// Left piece, 15 degrees.
difference() { 
    // Left piece, 15 degrees.
    translate([-23.5, 0, 65.9]) rotate([0, -15, 0]) cube([33, 37, 3], center=true);

    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13.5, h=20, center=true); 
     // Screw holes.
    translate([-15, 13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-25, 13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-35, 13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-15, -13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-25, -13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-35, -13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true); }

// End piece, 35 degrees.
difference() { 
    // Main body of end piece.
    translate([45, 0, 57.7]) rotate([0, 35, 0]) cube([15, 37, 3], center=true);
    
    // Trim the edge flush.
    translate([57.5, 0, 52]) rotate([0, 0, 0]) cube([15, 37, 10], center=true); 
    // Screw holes.
    translate([49, 13.5, 65]) rotate([0, 35, 0]) cylinder($fn=15, r=1.22, h=25, center=true); 
    translate([49, -13.5, 65]) rotate([0, 35, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    // Dowel hole.
    translate([48, 0, 65]) rotate([0, 0, 0]) cylinder($fn=15, r=1.22, h=35, center=true); }

// End piece, 35 degrees,
difference() { 
    // Main body of end piece.
    translate([-45, 0, 57.7]) rotate([0, -35, 0]) cube([15, 37, 3], center=true);
    
    // Trim the edge flush.
    translate([-57.5, 0, 52]) rotate([0, 0, 0]) cube([15, 37, 10], center=true); 
    // Screw holes.
    translate([-49, 13.5, 65]) rotate([0, -35, 0]) cylinder($fn=15, r=1.22, h=25, center=true); 
    translate([-49, -13.5, 65]) rotate([0, -35, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    // Dowel hole.
    translate([-48, 0, 65]) rotate([0, 0, 0]) cylinder($fn=15, r=1.22, h=35, center=true); }

// Fan mounting bracket.
difference() { 
    // Main body of fan mounting bracket.
    translate([0, 0, 84.5]) rotate([0, 0, 45]) cube([42, 42, 3.5], center=true);
    
    // Hollow section connecting cone to cover.
    translate([0, 0, 84.5]) cylinder($fn=256, r1=17, r2=19, h=3.5, center=true); 
    // Fan mounting holes.
    translate([0, 24, 85]) cylinder($fn=22, r=1.22, h=22, center=true);
    translate([24, 0, 85]) cylinder($fn=22, r=1.22, h=22, center=true);
    translate([0, -24, 85]) cylinder($fn=22, r=1.22, h=22, center=true);
    translate([-24, 0, 85]) cylinder($fn=22, r=1.22, h=22, center=true); 
    // Rounded corners.
    translate([3, 34.5, 85]) rotate([0, 0, 67.5]) cube([15, 20, 5], center=true);
    translate([0, 34.75, 85]) rotate([0, 0, 90]) cube([15, 20, 5], center=true);
    translate([-3, 34.5, 85]) rotate([0, 0, 112.5]) cube([15, 20, 5], center=true);
    
    translate([3, -34.5, 85]) rotate([0, 0, -67.5]) cube([15, 20, 5], center=true);
    translate([0, -34.75, 85]) rotate([0, 0, -90]) cube([15, 20, 5], center=true);
    translate([-3, -34.5, 85]) rotate([0, 0, -112.5]) cube([15, 20, 5], center=true);

    translate([34.5, 3, 85]) rotate([0, 0, -337.5]) cube([15, 20, 5], center=true);
    translate([34.75, 0, 85]) rotate([0, 0, 0]) cube([15, 20, 5], center=true);
    translate([34.5, -3, 85]) rotate([0, 0, -22.5]) cube([15, 20, 5], center=true);    

    translate([-34.5, 3, 85]) rotate([0, 0, 337.5]) cube([15, 20, 5], center=true);
    translate([-34.75, 0, 85]) rotate([0, 0, 0]) cube([15, 20, 5], center=true);
    translate([-34.5, -3, 85]) rotate([0, 0, 22.5]) cube([15, 20, 5], center=true); }

// Conical section.
difference() { 
    // Main body of conical section.
    translate([0, 0, 77]) cylinder($fn=256, r1=15, r2=20, h=15, center=true);
    
    // Smaller center cone for hollowing purposes.
    translate([0, 0, 77]) cylinder($fn=256, r1=13, r2=18, h=15, center=true);
    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13, h=20, center=true); }

// Conical supports.
difference() { 
    // Main body of support.
    translate([-12.55, -12.25, 77]) rotate([-9, -9, 135]) cube([3, 3, 14.75], center=true);
    
    // Hollow section connecting cone to cover.
    translate([0, 0, 84.5]) cylinder($fn=256, r1=17, r2=19, h=3.5, center=true); 
    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13, h=20, center=true); }

difference() { 
    // Main body of support.
    translate([12.55, -12.25, 77]) rotate([-9, 9, 215]) cube([3, 3, 14.75], center=true);
    
    // Hollow section connecting cone to cover.
    translate([0, 0, 84.5]) cylinder($fn=256, r1=17, r2=19, h=3.5, center=true); 
    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13, h=20, center=true); }

difference() { 
    // Main body of support.
    translate([-12.55, 12.25, 77]) rotate([9, -9, 215]) cube([3, 3, 14.75], center=true);
    
    // Hollow section connecting cone to cover.
    translate([0, 0, 84.5]) cylinder($fn=256, r1=17, r2=19, h=3.5, center=true); 
    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13, h=20, center=true); }

difference() { 
    // Main body of support.
    translate([12.55, 12.25, 77]) rotate([9, 9, 135]) cube([3, 3, 14.75], center=true);
    
    // Hollow section connecting cone to cover.
    translate([0, 0, 84.5]) cylinder($fn=256, r1=17, r2=19, h=3.5, center=true); 
    // Hollow section connecting cone to cover.
    translate([0, 0, 75]) cylinder($fn=256, r=13, h=20, center=true); }
// ----------------------------------------------------------------------------------------------------