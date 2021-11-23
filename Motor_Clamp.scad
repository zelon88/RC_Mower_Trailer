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

// NAME:  Motor Clamp
// REVISION:  A1
// START DATE:  11/22/2021
// CURRENT VERSION DATE:  11/22/2021
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    The motor clamp secures the rear of the motor to the opposite side upright of the center bracket.
// FILE NAME: Motor_Clamp.scad

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
// GEOMETRY

// Motor Clamp

difference() { 
   // Main body of ring. 
    translate([28, 25, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=20, h=5, center=true);   
    
    // Slot.
    translate([10.5, 25, 27.5]) rotate([90, 60, 0]) cube([1.25, 10, 5], center=true);
    // Through hole for motor.
    translate([28, 25, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=5, center=true); }
    
difference() { 
    // Main body of upper clamp screw boss.
    translate([9, 25, 30]) rotate([90, 0, 0]) cylinder($fn=64, r=2.75, h=5, center=true);
    
    // Through hole, motor clamp mounting screw, center.
    translate([9, 25, 30]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=5, center=true); }

difference() { 
    // Main body of lower clamp screw boss.
    translate([12, 25, 25]) rotate([90, 0, 0]) cylinder($fn=64, r=2.75, h=5, center=true);
    
    // Through hole, motor clamp mounting screw, left.
    translate([12, 25, 25]) rotate([90, 0, 0]) cylinder($fn=15, r=1.22, h=5, center=true); }
    
// ----------------------------------------------------------------------------------------------------