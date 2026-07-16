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

// NAME:  Attachment Adjustment Arm Cover
// REVISION:  A1
// START DATE:  5/28/2026
// CURRENT VERSION DATE:  5/28/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A cover for the Attachment Adjustment Arm that retains the sliding insert.
//    Features a central slot, perimeter mounting holes, witness marks every 2mm
//    along the slot for insert position reference, and chamfered top edges.
// FILE NAME: Attachment_Adjustment_Arm_Cover.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align slot over Attachment_Adjustment_Arm_Insert.
// 3. Fasten to arm with screws through perimeter holes.
// 4. Use witness marks to record insert position before locking.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// Annular chamfer ring for the rounded end top outer edge.
// Nested difference() produces a triangular cross-section ring:
// zero width at Z=5.75 (bottom), 0.5mm wide at Z=6.25 (top face) = 45deg chamfer.
module Rounded_End_Chamfer_Ring() {
  translate([32, 0, 5.75])
    difference() {
      cylinder($fn=48, r=11.75, h=0.5);
      cylinder($fn=48, r1=11.75, r2=10.75, h=0.5); } }

module Attachment_Adjustment_Arm_Cover() {
  difference() {
    union() {
      // Create the body of the cover.
      translate([18.5, 0, 4.5]) cube([27.5, 22.5, 3.5], center=true);
      // Create the rounded end of the cover.
      translate([32, 0, 4.5]) cylinder($fn=48, r=11.25, h=3.5, center=true); }

    // Cut the slot in the paddle for the Attachment Adjustment Arm Insert body.
    translate([26.25, 0, 5]) cube([22.85, 8, 8], center=true);

    // Cut out a mating surface for the Attachment Adjustment Arm Ramp Insert.
    translate([26.25,  5.5, 2.15]) cube([23.15, 3.53, 4.75], center=true);
    translate([26.25,  -5.5, 2.15]) cube([23.15, 3.53, 4.75], center=true);

    // Cut the chamfer on the top of the cover.
    translate([0.5, 0, 10.5]) rotate([0, 25, 0]) cube([20, 25, 15], center=true);

    // Chamfer the top outer edges along Y axis.
    translate([22,  11.25, 6.25]) rotate([ 45, 0, 0]) cube([50, 0.707, 0.707], center=true);
    translate([22, -11.25, 6.25]) rotate([-45, 0, 0]) cube([50, 0.707, 0.707], center=true);

    // Chamfer the top outer edge of the rounded end.
    intersection() {
      Rounded_End_Chamfer_Ring();
      translate([32, -12, 5.74]) cube([12, 24, 0.52]); }

    // Chamfer the top inner slot edges along Y axis.
    translate([26.25,  3.5, 6.25]) rotate([-45, 0, 0]) cube([22, 0.707, 0.707], center=true);
    translate([26.25, -3.5, 6.25]) rotate([ 45, 0, 0]) cube([22, 0.707, 0.707], center=true);

    // Cut the witness marks every 2mm along X on either side of the slot.
    for (i = [0:10]) {
      translate([16.25 + i*2,  5.5, 6.05]) cube([0.4, 3, 0.5], center=true);
      translate([16.25 + i*2, -5.5, 6.05]) cube([0.4, 3, 0.5], center=true); }

    // Cut the cover holes.
    translate([11.25,  3,    5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([17.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([23.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([29.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([35.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([39.5,   4.5,  5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([40.5, 0, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25, -3, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25, -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([17.25, -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([23.25, -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([29.25, -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([35.25, -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([39.5, -4.5, 5]) cylinder($fn=28, r=1.22, h=10, center=true); } }

// Render the object.
// Comment or uncomment as needed.
Attachment_Adjustment_Arm_Cover();

// Render the object for printing.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Cover();
// ----------------------------------------------------------------------------------------------------