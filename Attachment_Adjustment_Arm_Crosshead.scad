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
//    Attachment_Adjustment_Arm_Insert boss pin into Z motion via the 5 degree ramp,
//    providing the compliant suspension action of the adjustment arm assembly.
//    Features cylindrical spring perch standoffs on each X end face to locate
//    the pen springs that return the crosshead to the set position after
//    downward wheel travel. Standoff tips are chamfered via cone subtraction
//    for a shallow lead-in angle that prevents binding against the ramp slot wall.
//    A transverse pin hole through the Y faces accepts the boss pin from the
//    Attachment_Adjustment_Arm_Insert.
//    Two crossheads are required per arm, one per ramp insert (left and right).
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
// 3. Place pen spring over each spring perch standoff before installation.
// 4. Springs bear between crosshead face and ramp insert end wall.
// 5. Align pin hole with boss pin on Attachment_Adjustment_Arm_Insert.
// 6. Slide insert boss pin through pin hole to engage crosshead.
// 7. Light lubrication on crosshead faces reduces friction and improves spring return.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Attachment_Adjustment_Arm_Crosshead() {
  // Body dimensions. Sized to slide freely in the ramp slot.
  body_x = 6.5;    // X length. Short enough to slide freely in the slot.
  body_y = 2.875;  // Y width. Slightly less than the slot width.
  body_z = 3.49;   // Z height. Slightly less than the slot height.

  // Spring perch standoff dimensions.
  spring_perch_r = 1.5;  // Radius. Matches the inner coil of a roughly 4mm OD pen spring.
  spring_perch_h = 1.45; // Total height of the standoff extending from the body face.
  chamfer_h = 0.25;      // Depth of the chamfer taper at the tip.

  // Pin hole radius. Accepts the boss pin from the Attachment_Adjustment_Arm_Insert.
  pin_r = 1.5;

  difference() {
    union() {
      // Create the crosshead body.
      cube([body_x, body_y, body_z], center=true);
      // Create the spring perch standoff on the -X face.
      translate([-body_x/2, 0.5, 0]) rotate([0, -90, 0]) {
        // Create the main cylinder base.
        cylinder($fn=28, r=spring_perch_r, h=spring_perch_h - chamfer_h);
        // Create the chamfered tip cone.
        translate([0, 0, spring_perch_h - chamfer_h]) cylinder($fn=28, r1=spring_perch_r, r2=spring_perch_r - chamfer_h, h=chamfer_h); }
      // Create the spring perch standoff on the +X face.
      translate([body_x/2, 0.5, 0]) rotate([0, 90, 0]) {
        // Create the main cylinder base.
        cylinder($fn=28, r=spring_perch_r, h=spring_perch_h - chamfer_h);
        // Create the chamfered tip cone.
        translate([0, 0, spring_perch_h - chamfer_h]) cylinder($fn=28, r1=spring_perch_r, r2=spring_perch_r - chamfer_h, h=chamfer_h); } }

    // Cut the lubrication passages for the pin.
    translate([1, 0, 0]) cylinder(r=0.125, h=5, $fn=28, center=true);
    translate([-1, 0, 0]) cylinder(r=0.125, h=5, $fn=28, center=true);
    translate([-2, -1, 0]) rotate([90, 0, -45]) cylinder(r=0.125, h=5, $fn=28, center=true);
    translate([2, -1, 0]) rotate([90, 0, 45]) cylinder(r=0.125, h=5, $fn=28, center=true);
    // Cut the top lubrication pockets.
    translate([-(body_x/1.92-2.025), 0, (body_z/2)]) cube([(body_x/2)-1, (body_y-0.95), 0.05], center=true);
    translate([(body_x/1.92-2.025), 0, (body_z/2)]) cube([(body_x/2)-1, (body_y-0.95), 0.05], center=true);
    // Cut the bottom lubrication pockets.
    translate([(body_x/1.92-2.025), 0, -(body_z/2)]) cube([(body_x/2)-1, (body_y-0.95), 0.05], center=true);
    translate([-(body_x/1.92-2.025), 0, -(body_z/2)]) cube([(body_x/2)-1, (body_y-0.95), 0.05], center=true);
    // Cut the side lubrication pockets.
    translate([(body_x/3.1+0.165), -(body_y/2-.02), 0]) cube([(body_x/2.75)-1, 0.05, (body_z-0.75)], center=true);
    translate([-(body_x/3.1+0.165), -(body_y/2-0.02), 0]) cube([(body_x/2.75)-1, 0.05, (body_z-0.75)], center=true);
    // Chamfer the pin hole.
    translate([0, (body_y/2+.0675), 0]) rotate([90, 0, 0]) cylinder(r1=2.25, r2=1, h=1, $fn=28, center=true);
    translate([0, -(body_y/2+.0675), 0]) rotate([-90, 0, 0]) cylinder(r1=2.25, r2=1, h=1, $fn=28, center=true);
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
    // Clean up the outside edges of the crosshead.
    translate([(body_x/1.75), body_y+0.375, 0]) rotate([0, 0, 15]) cube([(body_x/2), body_y, body_z], center=true);
    translate([-(body_x/1.75), body_y+0.375, 0]) rotate([0, 0, -15]) cube([(body_x/2), body_y, body_z], center=true);
    translate([0, -body_y-0.001, 0]) cube([(body_x), body_y, body_z], center=true);
    // Cut the pin hole through the Y faces. The boss pin slides in from the open side.
    rotate([90, 0, 0]) cylinder($fn=28, r=pin_r, h=body_y + 1, center=true); } }

// Render the object.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Crosshead();

// Render the object for printing.
// Comment or uncomment as needed.
//Attachment_Adjustment_Arm_Crosshead();
// ----------------------------------------------------------------------------------------------------