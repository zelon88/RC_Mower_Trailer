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

// NAME:  Center Bracket
// REVISION:  A1
// START DATE:  8/23/2021
// CURRENT VERSION DATE:  11/22/2021
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    The center bracket that serves as the basis for the chassis and transmission for the mower.
//    All other components are built off of this piece.
// FILE NAME: Center_Bracket.scad

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Make studs by installing extra long screws and cutting off the heads.

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

// Upright portion, left.
difference() { 
    // Main body of upright.
    translate([0, 13.5, 41.5]) cube([100, 8, 53], center=true);
    
    // Reinforcement slot.
    translate([0, 0, 16.58]) cube([25.6, 100, 3.175], center=true);
    // Through hole, motor clamp mounting screw, center.
    translate([9, 25, 30]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=36); 
    // Through hole, motor clamp mounting screw, left.
    translate([12, 25, 25]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=36); 
    // Through hole for motor armature shaft.
    translate([-28, 18, 40]) rotate([90, 0, 0]) cylinder(r=6.55, h=9); 
    // Through hole, motor screws, lower.
    translate([-28, 18, 27.25]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=9); 
    // Through hole for motor screws, upper.
    translate([-28, 18, 52.25]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=9); 
    // Through hole, motor.
    translate([28, 18, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=9);
    // Recessed hole, motor.
    translate([-28, 12, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=2.5); 
    // Hole, center shaft.
    translate([0, 18, 53]) rotate([90, 0, 0]) cylinder($fn=48, r=5.055, h=36); 
    // Screw holes, differential.
    translate([8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([-8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 45]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 61]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    // Bottom screw holes.
    translate([20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([0, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    // Locating dowel, center bracket suppport, lower.
    translate([0, 13, 28.5]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center = true); 
    // Locating dowel, center bracket suppport, upper.
    translate([0, 13, 37]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center = true);
    // Fillets, top edge.
    translate([30, 13, 75]) rotate([90, 15, 0]) cube([50, 25, 10], center = true);
    translate([53, 13, 65]) rotate([90, 35, 0]) cube([25, 25, 10], center = true);
    translate([-30, 13, 75]) rotate([90, -15, 0]) cube([50, 25, 10], center = true);
    translate([-53, 13, 65]) rotate([90, -35, 0]) cube([25, 25, 10], center = true); 
    // Screw holes, top cover.
    translate([15, 13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([25, 13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([35, 13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true); 
    translate([49, 13.5, 65]) rotate([0, 35, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-15, 13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-25, 13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-35, 13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true); 
    translate([-49, 13.5, 65]) rotate([0, -35, 0]) cylinder($fn=15, r=1.22, h=25, center=true); }

// Upright portion, right.
difference() { 
    // Main body of upright.
    translate([0, -13.5, 41.5]) cube([100, 8, 53], center=true); 
    
    // Reinforcement slot.
    translate([0, 0, 16.58]) cube([25.6, 100, 3.175], center=true);
    // Through hole for motor clamp mounting screw, center.
    translate([-9, 1, 30]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=36); 
    // Through hole for motor clamp mounting screw, left.
    translate([-12, 1, 25]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=36); 
    // Through hole for motor armature shaft.
    translate([28, -9.5, 40]) rotate([90, 0, 0]) cylinder(r=6.55, h=9); 
    // Through hole for motor screws, lower.
    translate([28, -9.5, 27.25]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=9); 
    // Through hole for motor screws, upper.
    translate([28, -9.5, 52.25]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=9); 
    // Through hole for motor.
    translate([-28, -9, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=9); 
    // Recessed hole for motor. 
    translate([28, -9.5, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=2.5); 
    // Hole for center shaft.
    translate([0, 1, 53]) rotate([90, 0, 0]) cylinder($fn=48, r=5.055, h=36); 
    // Screw holes for differential.
    translate([8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([-8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 45]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 61]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    // Bottom screw holes.
    translate([20, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([8.75, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([0, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-8.75, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-20, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    // Locating dowel, center bracket suppport, lower.
    translate([0, -13, 28.5]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center = true); 
    // Locating dowel, center bracket suppport, upper.
    translate([0, -13, 37]) rotate([90, 0, 0]) cylinder($fn=28, r=2.5, h=10, center = true);
    // Fillets, top edge.
    translate([30, -13, 75]) rotate([90, 15, 0]) cube([50, 25, 10], center = true);
    translate([53, -13, 65]) rotate([90, 35, 0]) cube([25, 25, 10], center = true);
    translate([-30, -13, 75]) rotate([90, -15, 0]) cube([50, 25, 10], center = true);
    translate([-53, -13, 65]) rotate([90, -35, 0]) cube([25, 25, 10], center = true);
    // Screw holes, top cover.
    translate([15, -13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([25, -13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([35, -13.5, 65]) rotate([0, 15, 0]) cylinder($fn=15, r=1.22, h=25, center=true); 
    translate([49, -13.5, 65]) rotate([0, 35, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-15, -13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-25, -13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-35, -13.5, 65]) rotate([0, -15, 0]) cylinder($fn=15, r=1.22, h=25, center=true);
    translate([-49, -13.5, 65]) rotate([0, -35, 0]) cylinder($fn=15, r=1.22, h=25, center=true); }

// Lower portion.
difference() { 
    // Main body of lower portion.
    translate([0, 0, 10]) cube([100, 35, 20], center=true);

    // Reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 100, 3.175], center=true);
    translate([0, 0, ]) cube([25.6, 100, 31], center=true);
    // Toruses.
    translate([0, 75, 0]) Torus(40, 150); 
    translate([0, -75, 0]) Torus(40, 150); 
    // Square cutout between toruses.
    translate([0, 0, 5]) cube([60, 20, 10], center=true); 
    // Torus screw hole reliefs.
    translate([33.25, 10, 8]) cube([5, 5, 5], center=true);
    translate([33.25, -10, 8]) cube([5, 5, 5], center=true);
    translate([-33.25, 10, 8]) cube([5, 5, 5], center=true);
    translate([-33.25, -10, 8]) cube([5, 5, 5], center=true);
    // Torus screw holes.
    translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=30, center=true);
    translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=30, center=true);
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true);
    // Bottom screw holes.
    translate([20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([0, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([20, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([8.75, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([0, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-8.75, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-20, -14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    }

// Sides.
difference() { 
    // Main body of side.
    translate([48, 0, 36.5]) cube([4, 20, 33], center=true);
    
    // Chamfered edge.
    translate([53, 0, 65]) rotate([90, 35, 0]) cube([25, 25, 50], center = true); 
    // Vent slots.
    translate([50, 7.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([50, 5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([50, 2.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([50, 0, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([50, -2.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([50, -5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([50, -7.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    }
    
difference() { 
    // Main body of side.
    translate([-48, 0, 36.5]) cube([4, 20, 33], center=true);
    
    // Chamfered edge.
    translate([-53, 0, 65]) rotate([90, -35, 0]) cube([25, 25, 50], center = true); 
    // Vent slots.
    translate([-50, 7.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([-50, 5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([-50, 2.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([-50, 0, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([-50, -2.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([-50, -5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    translate([-50, -7.5, 25]) rotate([10, 0, 0]) cube([10, 1.5, 7], center=true);
    }

// Center reinforcement.
difference() { 
    // Main body of center support.
    translate([-5, -10, 19.3]) cube([10, 20, 23], center=false);
    
    // Notch for differential case.
    translate([0, 0, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=11.85, h=20, center=true);
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); }

// Conical support.
difference() { 
    // Main body of conical support.
    translate([0, 0, 30.3]) cylinder($fn=64, r1=9.25, r2=5, h=22, center=true); 
    
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); }

// Dowels, top cover.
translate([-48, 0, 54]) rotate([0, 0, 0]) cylinder($fn=15, r1=1.22, r2=1.15, h=6, center=true);
translate([48, 0, 54]) rotate([0, 0, 0]) cylinder($fn=15, r1=1.22, r2=1.15, h=6, center=true);


// ---------------------------------------------------------------------------------------------------- 

