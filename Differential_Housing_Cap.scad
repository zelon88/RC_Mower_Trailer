// ----------------------------------------------------------------------------------------------------
// PROJECT INFORMATION

// NAME:  R/C Mower Trailer
// REVISION:  A2
// START DATE:  8/20/2021
// CURRENT VERSION DATE:  9/8/2021
// LICENSE:  GPLv3
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  A tow-behind lawn mowing attachment for retrofit onto low-speed R/C vehicles.

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PART INFORMATION

// NAME:  Differential Housing
// REVISION:  A1
// START DATE:  8/23/2021
// CURRENT VERSION DATE:  9/8/2021
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    The differential housing cap covers the open end of the differential housing.
// FILE NAME: Differential_Housing_Cap.scad

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Assemble the planetary gears inside the gearbox using the access holes.
// 3. Press fit the "Differential Housing Cap" onto the open end of the differential housing.

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// Outer case end cap, front.
difference() { 
    // Main body of end cap.
    translate([0, 10, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=10.499, h=2, center=true);
    
    // Center hole.
    translate([0, 10, 53]) rotate([90, 0, 0]) cylinder($fn=48, r=5.055, h=2, center=true); 
    // Screw holes.
    translate([8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([-8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 45]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 61]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36); }

difference() {
    // Main body of half cross.
    translate([0, 9.5, 53]) rotate([0, 90, 0]) cube([22, 1, 5], center=true); 
    
    // Center hole.
    translate([0, 9.5, 53]) rotate([90, 0, 0]) cylinder($fn=48, r=5.055, h=2, center=true); 
    // Screw holes.
    translate([8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([-8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 45]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 61]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36); }
    
difference() {
    // Main body of half cross.
    translate([0, 9.5, 53]) rotate([0, 180, 0]) cube([22, 1, 5], center=true);
    
    // Center hole.
    translate([0, 9.5, 53]) rotate([90, 0, 0]) cylinder($fn=48, r=5.055, h=2, center=true); 
    // Screw holes.
    translate([8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([-8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 45]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 61]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36); }
// ----------------------------------------------------------------------------------------------------