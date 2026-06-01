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
// NAME:  Attachment Adjustment Arm Insert
// REVISION:  A1
// START DATE:  5/28/2026
// CURRENT VERSION DATE:  5/28/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    An insert for the attachment adjustment arm assembly.
//    Features a rectangular center block with side bosses and a center boss for an adjustment screw.
//    All exposed edges are chamfered for a clean finish.
// FILE NAME: Attachment_Adjustment_Arm_Insert.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS
// 1. Deburr all edges to break sharp edges.
// 2. Thread Adjustment Screw into center hole.
// 3. Clamp into Attachment Adjustment Arm.
// 4. Clamp into place with Adjustment Arm Cover.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Attachment_Adjustment_Arm_Insert() {
  difference() {
    union() {
      // Create the rectangular center block.
      cube([12, 7, 5], center=true);
      // Create the side bosses.
      translate([0, 7, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=1.5, h=14);
      // Create the center boss.
      translate([0, 0, 4]) cylinder($fn=48, r=2.95, h=4, center=true); }
    // Drill the center hole for the adjustment screw.
    cylinder($fn=48, r=2.495, h=15, center=true);
    // Chamfer the front & rear top & bottom edges along X axis.
    // Block Y half = 3.5, Block Z half = 2.5.
    translate([0,  3.5,  2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);
    translate([0, -3.5,  2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);
    translate([0,  3.5, -2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);
    translate([0, -3.5, -2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);
    // Chamfer the left & right top & bottom edges along Y axis (80% of side material).
    // Block X half = 6, Block Z half = 2.5.
    translate([ 6, 0,  2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);
    translate([-6, 0,  2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);
    translate([ 6, 0, -2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);
    translate([-6, 0, -2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);
    // Chamfer the vertical corner edges along Z axis (tips of the Y axis wedges).
    // Block X half = 6, Block Y half = 3.5.
    translate([ 6,  3.5, 0]) rotate([0, 0, 45]) cube([0.7, 0.7, 6], center=true);
    translate([ 6, -3.5, 0]) rotate([0, 0, 45]) cube([0.7, 0.7, 6], center=true);
    translate([-6,  3.5, 0]) rotate([0, 0, 45]) cube([0.7, 0.7, 6], center=true);
    translate([-6, -3.5, 0]) rotate([0, 0, 45]) cube([0.7, 0.7, 6], center=true);
    // Chamfer the circular end faces of the side bosses (r=2, 0.5mm chamfer).
    translate([0,  7, 0]) rotate([ 90, 0, 0]) cylinder($fn=48, r1=2.5, r2=2, h=0.5);
    translate([0, -7, 0]) rotate([-90, 0, 0]) cylinder($fn=48, r1=2.5, r2=2, h=0.5); } }

// Render the object.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Insert();

// Render the object for printing.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Insert();
// ----------------------------------------------------------------------------------------------------
