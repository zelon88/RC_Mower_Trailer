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
//    The differential housing that supports the planetary gearbox.
// FILE NAME: Differential_Housing.scad

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

include <Differential_Gears.scad>;

module Differential_Housing() {
  // Differential support.
  difference() { 
    union() { 
      // Outer case.
      translate([0, 0, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=11.85, h=20, center=true);
      // Outer radial support ribs.
      translate([0, 0, 53.85]) rotate([90, 0, 0]) cylinder($fn=96, r=12.5, h=2.5, center=true);
      translate([0, 7.5, 53.85]) rotate([90, 0, 0]) cylinder($fn=96, r=11.875, h=2.5, center=true);
      translate([0, -7.5, 53.85]) rotate([90, 0, 0]) cylinder($fn=96, r=11.875, h=2.5, center=true);
      // Top perpendicular support rib.
      translate([0, 0, 65]) cube([2.5, 17.5, 1.25], center=true);
      // Side perpendicular support ribs.
      translate([12, 0, 53]) cube([1.25, 20, 2.5], center=true);
      translate([-12, 0, 53]) cube([1.25, 20, 2.5], center=true); }
    
    // Clean up the outer radial support ribs.
    translate([0, 0, 66.25]) cube([10, 10, 1], center=true);
    // Clean up the side perpendicular support ribs.
    translate([14.1875, 0.25, 53]) rotate([0, 0, 9.875]) cube([1.25, 20, 2.5], center=true);
    translate([14.1875, -0.25, 53]) rotate([0, 0, -9.875]) cube([1.25, 20, 2.5], center=true);

    translate([-14.1875, 0.25, 53]) rotate([0, 0, -9.875]) cube([1.25, 20, 2.5], center=true);
    translate([-14.1875, -0.25, 53]) rotate([0, 0, 9.875]) cube([1.25, 20, 2.5], center=true);

    // Hollow out the center.
    translate([0, 0, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=10.5, h=20, center=true); 
    // Planetary shaft through holes.
    translate([0, 0, 53]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); 
    translate([0, 0, 53]) rotate([0, 90, 0]) cylinder($fn=64, r=3.03, h=100, center=true); }
    
  // Outer case end cap, rear.
  difference() { 
    translate([0, -9.5, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=11.85, h=1, center=true);
    
    // Center hole.
    translate([0, -9.5, 53]) rotate([90, 0, 0]) cylinder($fn=48, r=5.055, h=1, center=true); 
    // Screw holes.
    translate([8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([-8, 18, 53]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 45]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36);
    translate([0, 18, 61]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=36); }
    
  // Round pads, planetary shaft support, outer case, outer.
  difference() { 
    translate([10.5, 0, 53]) rotate([0, 90, 0]) cylinder(r1=5.5, r2=4.75, h=4.5, center=true); 
    translate([0, 0, 53]) rotate([0, 90, 0]) cylinder($fn=64, r=3.03, h=100, center=true); }

  difference() { 
    translate([-10.5, 0, 53]) rotate([0, 270, 0]) cylinder(r1=5.5, r2=4.75, h=4.5, center=true); 
    translate([0, 0, 53]) rotate([0, 270, 0]) cylinder($fn=64, r=3.03, h=100, center=true); }

  difference() { 
    translate([0, 0, 63.5]) rotate([0, 0, 0]) cylinder(r1=5.5, r2=4.75, h=4.5, center=true); 
    translate([0, 0, 64]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); }

  difference() { 
    translate([0, 0, 43.55]) rotate([0, 0, 0]) cylinder(r1=5, r2=4.75, h=2.4, center=true); 
    translate([0, 0, 64]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); }

  // Inside lip.
  difference() { 
    // Main body of inside lip.
    translate([0, 8.75, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=11.75, h=0.5, center=true);
    
    // Hollow out the center.
    translate([0, 8.75, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=10.2, h=0.5, center=true); }

  // Outside lip.
  difference() { 
    // Main body of outside lip.
    translate([0, 9.75, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=11, h=0.5, center=true);
    
    // Hollow out the center.
    translate([0, 9.75, 53]) rotate([90, 0, 0]) cylinder($fn=96, r=10.2, h=0.5, center=true); 
    // Cut out the crosses.
    translate([0, 9.75, 53]) rotate([0, 45, 0]) cube([23, 1, 5], center=true); 
    translate([0, 9.75, 53]) rotate([0, 135, 0]) cube([23, 1, 5], center=true); } }
// ----------------------------------------------------------------------------------------------------



Differential_Housing();
translate([0, 0, 53]) Differential_Assembly();