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
// [Manufacturing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Attachment_Adjustment_Arm_Insert() {
  difference() {
    union() {
      // Create the rectangular center block.
      cube([12, 7, 5], center=true);
      // Create the main body of the pin.
      translate([0, 0, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=1.5, h=13.5, center=true);
      // Create the front chamfer cap.
      translate([0, 6.75, 0]) rotate([-90, 0, 0]) cylinder($fn=48, r1=1.5, r2=1.25, h=0.1625);
      // Create the back chamfer cap.
      translate([0, -6.75, 0]) rotate([90, 0, 0]) cylinder($fn=48, r1=1.5, r2=1.25, h=0.1625);
      // Create the center boss.
      translate([0, 0, 4]) cylinder($fn=48, r=2.95, h=4, center=true);
      // Taper the base of the upper portion of the center boss for strength.
      translate([0, 0, 3]) cylinder($fn=48, r1=3.05, r2=2.95, h=2, center=true);
      // Chamfer the bottom of the center boss to support a shrink wrap dust boot.
      translate([0, 0, -2.5]) cylinder($fn=48, r=2.95, h=1.5, center=true);
      // Add a lip to the bottom of the center boss to support a shrink wrap dust boot.
      translate([0, 0, -3.15]) cylinder($fn=48, r=3.15, h=0.5, center=true); }

    // Drill the center hole for the adjustment screw.
    cylinder($fn=48, r=2.495, h=15, center=true);

    // Chamfer the front and rear top and bottom edges along the X axis.
    translate([0,  3.5,  2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);
    translate([0, -3.5,  2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);
    translate([0,  3.5, -2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);
    translate([0, -3.5, -2.5]) rotate([45, 0, 0]) cube([14, 0.7, 0.7], center=true);

    // Chamfer the left and right top and bottom edges along the Y axis.
    translate([ 5.75, 0,  2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);
    translate([-5.75, 0,  2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);
    translate([ 5.75, 0, -2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);
    translate([-5.75, 0, -2.5]) rotate([0, 45, 0]) cube([2.828, 9, 2.828], center=true);

    // Chamfer the vertical corner edges along the Z axis (tips of the Y axis wedges).
    translate([ 5.75,  4.6, 0]) rotate([0, 0, 60]) cube([6, 6, 6], center=true);
    translate([ 5.75, -4.6, 0]) rotate([0, 0, 30]) cube([6, 6, 6], center=true);
    translate([-5.75,  4.6, 0]) rotate([0, 0, 30]) cube([6, 6, 6], center=true);
    translate([-5.75, -4.6, 0]) rotate([0, 0, 60]) cube([6, 6, 6], center=true);

    // Cut off the front and back faces of the X surface.
    translate([ 5.675,  0, 0]) cube([2, 4, 4], center=true);
    translate([-5.675, 0, 0]) cube([2, 4, 4], center=true); } }

// Render the object.
// Comment or uncomment as needed.
Attachment_Adjustment_Arm_Insert();

// Render the object for printing.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Insert();
// ----------------------------------------------------------------------------------------------------