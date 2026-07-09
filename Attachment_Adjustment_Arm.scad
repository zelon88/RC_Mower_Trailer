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

// NAME:  Attachment Adjustment Arm
// REVISION:  A1
// START DATE:  5/28/2026
// CURRENT VERSION DATE:  5/28/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    An adjustment arm for the attachment assembly.
//    Features a thick box section with a rounded paddle end for the adjustment screw insert,
//    a cylindrical reinforcement boss that pivots on the Attachment Hinge Boss,
//    and a flange for connecting to the lower attachment arm.
// FILE NAME: Attachment_Adjustment_Arm.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Slide Attachment_Adjustment_Arm_Insert longitudinally into paddle slot.
// 3. Slide reinforcement boss over Attachment_Hinge_Boss cylinder (hinge pin axis along Y).
// 4. Secure hinge pin through boss bore.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

include <Attachment_Adjustment_Arm_Cover.scad>;

module Attachment_Adjustment_Arm() {
  difference() {
    union() {
      // Create the thick box portion that attaches to the attachment boss.
      translate([0, 0, 0]) cube([30, 22.5, 8], center=true);
      // Create the rounded edge on the end of the paddle portion.
      translate([32, 0, 5]) cylinder($fn=48, r=11.25, h=5, center=true);
      // Create the thinner paddle body portion that attaches to the adjustment screw.
      translate([18.5, 0, 5]) cube([27.5, 22.5, 5], center=true);
      // Create a reinforcement boss for the attachment boss connection point.
      translate([-3.25, 0, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=6, h=22.5, center=true);
      // Create the flange on the end that attaches to the lower attachment arm.
      translate([-16.5, 0, 0]) cube([3, 32.5, 17.5], center=true); }

    // Cut out the reinforcement boss.
    translate([-3.25, 0, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=4, h=20, center=true);
    translate([-3.25, 0, -1]) rotate([90, 0, 0]) cylinder($fn=48, r=4, h=20, center=true);
    translate([-3.25, 0, -2]) rotate([90, 0, 0]) cylinder($fn=48, r=4, h=20, center=true);
    translate([-3.25, 0, -3]) rotate([90, 0, 0]) cylinder($fn=48, r=4, h=20, center=true);
    translate([-3.25, 0, -4]) rotate([90, 0, 0]) cylinder($fn=48, r=4, h=20, center=true);
    translate([-3.25, 0, -5]) rotate([90, 0, 0]) cylinder($fn=48, r=4, h=20, center=true);

    // Cut out the center through hole for the reinforcement boss.
    translate([-3.25, 0, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=2.55, h=25, center=true);

    // Cut the chamfer on the bottom of the arm.
    translate([17.4, 0, -4.2]) rotate([0, 25, 0]) cube([10, 25, 10], center=true);
    translate([14.9, 0, -5.7]) rotate([0, 45, 0]) cube([10, 25, 8], center=true);
    translate([12.4, 0, -7.2]) rotate([0, 65, 0]) cube([10, 25, 8], center=true);

    // Cut the chamfer on the top of the arm.
    translate([3, 0, 11.05]) rotate([0, 35, 0]) cube([10, 25, 10], center=true);
    translate([3.1, 0, 10.5]) rotate([0, 60, 0]) cube([10, 25, 8], center=true);

    // Cut the slot in the paddle for the Attachment Adjustment Arm Insert body.
    translate([26.25, 0, 5]) cube([22.85, 8, 5], center=true);

    // Cut the cover holes.
    translate([11.25,  3, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([17.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([23.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([29.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([35.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([39.5,  4.5, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([40.5,  0, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25,  -3, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([17.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([23.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([29.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([35.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([39.5,  -4.5, 5]) cylinder($fn=28, r=1.22, h=10, center=true);

    // Cut lower adjustment arm flange perimeter through-holes.
    translate([-16.5, 13, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, 13, 0]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, 13, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, -13, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, -13, 0]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, -13, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, 6.5, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, 0, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, -6.5, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5,  6.5, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, 0, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([-16.5, -6.5, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);

    // Cut out a mating surface for the Attachment Adjustment Arm Ramp Insert.
    translate([26.25,  5.5, 6.375]) cube([23.15, 3.53, 5.75], center=true);
    translate([26.25,  -5.5, 6.375]) cube([23.15, 3.53, 5.75], center=true);
    } }
    
// Render the object.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm();
//translate([0, 0, 4.75]) Attachment_Adjustment_Arm_Cover();

// Render the object for printing.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm();
// ----------------------------------------------------------------------------------------------------