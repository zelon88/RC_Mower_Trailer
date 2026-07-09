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

// NAME:  Attachment Adjustment Arm Crosshead
// REVISION:  A1
// START DATE:  7/9/2026
// CURRENT VERSION DATE:  7/9/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A sliding crosshead that rides inside the angled ramp slot of the
//    Attachment_Adjustment_Arm_Ramp_Insert. Converts the X travel of the
//    Attachment_Adjustment_Arm_Insert boss pin into Z motion via the 5deg ramp,
//    providing the compliant suspension action of the adjustment arm assembly.
//    Features a 3mm deep spring perch recess on each X end face to locate
//    the pen springs that return the crosshead to the set position after
//    downward wheel travel. A transverse pin hole through the Y faces accepts
//    the boss pin from the Attachment_Adjustment_Arm_Insert.
//    Two crossheads are required per arm — one per ramp insert (left and right).
// FILE NAME: Attachment_Adjustment_Arm_Crosshead.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Slide crosshead into ramp slot from the open end.
// 3. Insert pen spring into each spring perch recess before installation.
// 4. Springs bear between crosshead face and ramp insert end wall.
// 5. Align pin hole with boss pin on Attachment_Adjustment_Arm_Insert.
// 6. Slide insert boss pin through pin hole to engage crosshead.
// 7. Light lubrication on crosshead faces reduces friction and improves spring return.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Attachment_Adjustment_Arm_Crosshead() {
  // Body dimensions — sized to slide freely in ramp slot.
  body_x = 8;    // X - length, short enough to slide freely in slot.
  body_y = 3.0625; // Y - slightly less than slot width.
  body_z = 3.49;  // Z - slightly less than slot height.

  // Spring perch recess dimensions.
  // Recess accepts the end coil of a standard clicky pen spring (~4mm OD).
  spring_perch_r = 1.6;   // Radius of recess which matches 4mm OD pen spring.
  spring_perch_h = 5;   // Depth of recess.

  // Pin hole dimensions.
  // Accepts the boss pin from Attachment_Adjustment_Arm_Insert.
  pin_r = 1.5;

  difference() {
    union() {
      // Crosshead body.
      cube([body_x, body_y, body_z], center=true);
      // Spring perches.
      translate([(-body_x/2) + (spring_perch_h/2), 0.5, 0]) rotate([0, -90, 0])
        cylinder($fn=28, r=spring_perch_r, h=spring_perch_h);
      // Spring perch recess on +X end face — 3mm deep into body toward -X.
      translate([(body_x/2) - (spring_perch_h/2), 0.5, 0]) rotate([0, 90, 0])
        cylinder($fn=28, r=spring_perch_r, h=spring_perch_h); }

    // Create top lubrication pockets.
    translate([(body_x/2-2.0625), 0, (body_z/2)]) cube([(body_x/2)-1, (body_y-0.75), 0.05], center=true);
    translate([-(body_x/2-2.0625), 0, (body_z/2)]) cube([(body_x/2)-1, (body_y-0.75), 0.05], center=true);
    // Create bottom lubrication pockets.
    translate([(body_x/2-2.0625), 0, (body_z/2)]) cube([(body_x/2)-1, (body_y-0.75), 0.05], center=true);
    translate([-(body_x/2-2.0625), 0, (body_z/2)]) cube([(body_x/2)-1, (body_y-0.75), 0.05], center=true);

    // Chamfer along the X edges.
    translate([0, (body_y/2), (body_z/2)]) rotate([45, 0, 0]) cube([body_x+1, 0.25, 0.25], center=true);
    translate([0, -(body_y/2), (body_z/2)]) rotate([45, 0, 0]) cube([body_x+1, 0.25, 0.25], center=true);
    translate([0, (body_y/2), -(body_z/2)]) rotate([45, 0, 0]) cube([body_x+1, 0.25, 0.25], center=true);
    translate([0, -(body_y/2), -(body_z/2)]) rotate([45, 0, 0]) cube([body_x+1, 0.25, 0.25], center=true);
    // Chamfer along the Y edges.
    translate([(body_x/2), 0, (body_z/2)]) rotate([0, 45, 0]) cube([0.25, body_y+1, 0.25], center=true);
    translate([(-body_x/2), 0, (body_z/2)]) rotate([0, 45, 0]) cube([0.25, body_y+1, 0.25], center=true);
    translate([(body_x/2), 0, -(body_z/2)]) rotate([0, 45, 0]) cube([0.25, body_y+1, 0.25], center=true);
    translate([(-body_x/2), 0, -(body_z/2)]) rotate([0, 45, 0]) cube([0.25, body_y+1, 0.25], center=true);
    // Chamfer along the Z edges.
    translate([(body_x/2), -(body_y/2), 0]) rotate([0, 0, 45]) cube([0.25, 0.25, body_z+1], center=true);
    translate([-(body_x/2), -(body_y/2), 0]) rotate([0, 0, 45]) cube([0.25, 0.25, body_z+1], center=true);
    // Clean up the outside edges of the Crosshead.
    translate([(body_x/3), body_y+0.325, 0]) rotate([0, 0, 10]) cube([(body_x/2), body_y, body_z], center=true);
    translate([-(body_x/3), body_y+0.325, 0]) rotate([0, 0, -10]) cube([(body_x/2), body_y, body_z], center=true);
    translate([0, -body_y-0.001, 0]) cube([(body_x), body_y, body_z], center=true);
    // Pin hole through Y faces — boss pin slides in from the open side.
    rotate([90, 0, 0]) cylinder($fn=28, r=pin_r, h=body_y + 1, center=true);
 } }
// Render the object.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Crosshead();

// Render the object for printing.
// Comment or uncomment as needed.
Attachment_Adjustment_Arm_Crosshead();
// ----------------------------------------------------------------------------------------------------
