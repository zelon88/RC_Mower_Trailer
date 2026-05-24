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
// CURRENT VERSION DATE:  9/8/2021
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    Drive pulleys for primary motors.
// FILE NAME: Pulley_Layout.scad

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Press fit 4x 5mm x 8mm bearings into idler pulleys.
// 3. Press fit 4x 2.5mm x 5mm flanged inserts into bearings.
// 4. Attach pulleys to each respective shaft and secure with hardware.

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// Spur Gear, Right.
difference() { 
  translate([0, 25, 53]) rotate([0, 90, 90]) cylinder($fn=64, r=11, h=10, center=true); 

  translate([0, 25, 53]) rotate([90, 0, 0]) cube([4.3, 4.3, 10], center=true);
  translate([0, 25, 53]) rotate([90, 45, 0]) cube([4.3, 4.3, 10], center=true); 
    }

// Pinion Gear, Right.
difference() { 
  translate([-28, 25, 40]) rotate([90, 0, 0]) cylinder($fn=64, r=6, h=10, center=true);

  translate([-28, 25, 40]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true); }

// Idler Gear, Right.
difference() { 
  translate([-14, 25, 39]) rotate([90, 0, 0]) cylinder($fn=64, r=6, h=10, center=true);

  translate([-14, 25, 39]) rotate([90, 0, 0]) cylinder($fn=48, r=4.01, h=10, center=true); }

// Spur Gear, Left.
difference() { 
  translate([0, -25, 53]) rotate([0, 90, 90]) cylinder($fn=64, r=11, h=10, center=true);

  translate([0, -25, 53]) rotate([90, 0, 0]) cube([4.3, 4.3, 10], center=true);
  translate([0, -25, 53]) rotate([90, 45, 0]) cube([4.3, 4.3, 10], center=true); }

// Pinion Gear, Left.
difference() { 
  translate([28, -25, 40]) rotate([90, 0, 0]) cylinder($fn=64, r=6, h=10, center=true);

  translate([28, -25, 40]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=10, center=true); }

// Idler  Gear, Left.
difference() { 
  translate([14, -25, 39]) rotate([90, 0, 0]) cylinder($fn=64, r=6, h=10, center=true);

  translate([14, -25, 39]) rotate([90, 0, 0]) cylinder($fn=48, r=4.01, h=10, center=true); }
// ----------------------------------------------------------------------------------------------------