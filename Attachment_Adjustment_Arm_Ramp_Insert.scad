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

// NAME:  Attachment Adjustment Arm Ramp Insert
// REVISION:  A1
// START DATE:  7/16/2026
// CURRENT VERSION DATE:  7/16/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A reversible ramp insert that mounts into the paddle slot of the Attachment_Adjustment_Arm.
//    Provides the angled ramp surface that the Attachment_Adjustment_Arm_Crosshead rides against,
//    converting horizontal crosshead travel into vertical suspension motion.
//    Features upper and lower spring perches that locate the pen springs bearing against the crosshead.
//    The Left variant is the base geometry, and the Right variant is a mirrored copy of the Left.
// FILE NAME: Attachment_Adjustment_Arm_Ramp_Insert.scad
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

module Attachment_Adjustment_Arm_Ramp_Insert_Left() {
  difference() {
    union() {
      // Create the body of the ramp slot.
      translate([26.25,  5.5, 6.375]) cube([23.15, 3.52, 5.75], center=true); }
    // Cut the boss slot for the insert side bosses.
    translate([26.25,  5.05, 6.375]) rotate([0, 5, 0]) cube([22, 3.02, 3.5], center=true); }
  // Add the lower spring perch.
  translate([36.15,  4.85, 5.475]) rotate([0, 95, 0]) cylinder($fn=48, r1=1.15, r2=1.45, h=0.25);
  translate([36.4,  4.85, 5.45]) rotate([0, 95, 0]) cylinder($fn=48, r=1.45, h=1.25);
  translate([37.525,  4.85, 5.35]) rotate([0, 90, 0]) cylinder($fn=48, r=1.45, h=0.3);
  // Add the upper spring perch.
  translate([16.35,  4.85, 7.125]) rotate([0, -85, 0]) cylinder($fn=48, r1=1.15, r2=1.45, h=0.25);
  translate([16.1,  4.85, 7.15]) rotate([0, -85, 0]) cylinder($fn=48, r=1.45, h=1.25);
  translate([14.975,  4.85, 7.25]) rotate([0, -90, 0]) cylinder($fn=48, r=1.45, h=0.3); }

module Attachment_Adjustment_Arm_Ramp_Insert_Right() {
  mirror([0, 1, 0]) Attachment_Adjustment_Arm_Ramp_Insert_Left(); }

// Render the object.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Ramp_Insert_Left();
//Attachment_Adjustment_Arm_Ramp_Insert_Right();

// Render the object for printing.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Ramp_Insert_Left();
//Attachment_Adjustment_Arm_Ramp_Insert_Right();
// ----------------------------------------------------------------------------------------------------