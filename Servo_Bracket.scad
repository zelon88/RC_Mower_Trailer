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

// NAME:  RC Servo Bracket
// REVISION:  A1
// START DATE:  6/14/2026
// CURRENT VERSION DATE:  6/14/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    This file extends two functions, RC_Servo_Bracket_Left() & RC_Servo_Bracket_Right();
//    Both Left & Right sides are required to mount each servo.
//    A T-shaped servo mounting bracket resembling a single-leg diner table.
//    The top of the T (flange) mounts to a flat surface via 2 parallel slots per wing.
//    The leg of the T is the servo standoff, with 2 slots perpendicular to the flange slots.
//    Flange slots run along Y — lateral adjustment.
//    Leg slots run along X — fore-aft adjustment.
//    Z adjustment is achieved via servo linkage arm length.
//    Slot dimensions allow for servo variation in both X and Y axes.
// FILE NAME: RC_Servo_Bracket.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Install two brackets per servo, one on each tab side.
// 3. Fasten flange to mounting surface with M3 screws through flange slots.
// 4. Fasten servo tab to leg with M4 screws through leg slots.
// 5. Adjust X position via leg slots before tightening servo screws.
// 6. Adjust Y position via flange slots before tightening surface screws.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// A module for creating the Left Servo Bracket. 
// The Right Servo Bracket is a mirror image of this module.
module RC_Servo_Bracket_Left() {
  // Servo tab reference dimensions (must match RC_Servo.scad).
  body_w = 20.5; // Y - Servo body width.
  tab_hole_x = 4; // Distance of tab hole center from servo body edge.
  tab_hole_r = 2.1; // Tab hole radius (M4 clearance).

  // Flange (tabletop) dimensions.
  flange_w = 30; // Y - Flange width.
  flange_d = 21; // X - Flange depth.
  flange_t = 3; // Z - Flange thickness.

  // Leg (standoff) dimensions.
  leg_t = 4; // X - Leg thickness.
  leg_w = 7.5; // Y - Leg width.
  leg_h = 25; // Z - Leg height.

  // Slot dimensions.
  slot_r = 1.65; // Radius of slot end caps (M3 clearance, r=1.65).
  slot_len_flange = 4; // X - Slot travel length in flange wings.
  slot_len_leg = 4; // Z - Slot travel length in leg.
  slot_x_inner = 5; // X center of inner flange slot.
  slot_x_outer = 14.5; // X center of outer flange slot.

  // Leg slot Y positions — match servo tab hole spacing.
  leg_slot_y1 = tab_hole_x; // Y=4, inner tab hole.
  leg_slot_y2 = body_w - tab_hole_x; // Y=16.5, outer tab hole.

  difference() {
    union() {
      // Flange plate.
      translate([0, 0, leg_h]) cube([flange_d, flange_w, flange_t], center=false);
      // Leg.
      translate([(flange_d - leg_t) / 1.125, (flange_w - leg_w) / 2, 0])
        cube([leg_t, leg_w, leg_h], center=false);
      // Add support brace to one side of the leg.
      translate([14.125, 20, 12.5]) cube([10, 2.5, 25], center=true); }

    // Flange slots — 2 on one side wing running along X.
    // Left wing slots.
    for (xi = [slot_x_inner, slot_x_outer]) {
      wing_cy = (flange_w - leg_w) / 4;
      translate([xi, wing_cy, leg_h - 0.5])
        hull() {
          translate([-slot_len_flange / 2, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 1);
          translate([ slot_len_flange / 2, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 1); } }
    // Center slot.
    for (leg_y = [leg_slot_y1, leg_slot_y2]) {
      leg_cy = 16.5;
      // Top round end cap.
      translate([flange_d / 7, leg_cy, 20])
        rotate([0, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 15, center=true);
      // Bottom round end cap.
      translate([flange_d / 7 + 4, leg_cy, 20])
        rotate([0, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 15, center=true);
      // Rectangular body connecting the two end caps.
      translate([flange_d / 7 + 2, leg_cy, 20])
        cube([4, slot_r * 2, 20], center=true); }
          
    // Leg slots — 2 vertical slots boring through the X surface.
    for (leg_y = [leg_slot_y1, leg_slot_y2]) {
      leg_cy = 15;
      // Top round end cap.
      translate([flange_d / 2, leg_cy, 4])
        rotate([0, 90, 0]) cylinder($fn=20, r=tab_hole_r, h=leg_t + 15, center=true);
      // Bottom round end cap.
      translate([flange_d / 2, leg_cy, 9])
        rotate([0, 90, 0]) cylinder($fn=20, r=tab_hole_r, h=leg_t + 15, center=true);
      // Rectangular body connecting the two end caps.
      translate([flange_d / 2, leg_cy, 6.5])
        cube([leg_t + 15, tab_hole_r * 2, 5], center=true); }
    for (leg_y = [leg_slot_y1, leg_slot_y2]) {
      leg_cy = 15;
      // Top round end cap.
      translate([flange_d / 2, leg_cy, 16])
        rotate([0, 90, 0]) cylinder($fn=20, r=tab_hole_r, h=leg_t + 15, center=true);
      // Bottom round end cap.
      translate([flange_d / 2, leg_cy, 21])
        rotate([0, 90, 0]) cylinder($fn=20, r=tab_hole_r, h=leg_t + 15, center=true);
      // Rectangular body connecting the two end caps.
      translate([flange_d / 2, leg_cy, 18.5])
        cube([leg_t + 15, tab_hole_r * 2, 5], center=true); }
  
  // Angle the top of the leg supports.
  translate([0.875, 15, -5]) rotate([0, -25, 0]) cube([30, 30, 50], center=true);
  translate([0, 15, -5]) rotate([0, -17.5, 0]) cube([30, 30, 50], center=true);
  // Trim off the excess edges.
  translate([10, -8, 15]) cube([29.5, 20, 30], center=true);
  translate([10, 31.25, 15]) cube([29.5, 20, 30], center=true);
  translate([34, 15, 15]) cube([30, 30, 30], center=true);
  // Chamfer the large 90 edge along the Z axis.
  translate([34.25, 24.25, 15]) rotate([0, 0, 43]) cube([30, 30, 30], center=true);
  translate([32, 29.75, 15]) rotate([0, 0, 63.5]) cube([30, 30, 30], center=true); } }

// A module for mirroring the Left Servo Bracket to create the Right Servo Bracket.
module RC_Servo_Bracket_Right() {
  mirror([1, 1, 0]) RC_Servo_Bracket_Left(); }

// A module for cutting left mating holes that align with the three slots in the flange.
module RC_Servo_Bracket_Mount_Holes_Left() {
  translate([5.25, 5.625, 28]) cylinder(r=1.65, h=25, $fn=28, center=true);
  translate([5.25, 16.5, 28]) cylinder(r=1.65, h=25, $fn=28, center=true); 
  translate([14.625, 5.625, 28]) cylinder(r=1.65, h=25, $fn=28, center=true); }

// A module for cutting right mating holes that align with the three slots in the flange.
module RC_Servo_Bracket_Mount_Holes_Right() {
  translate([-5.625, -5.25, 28]) cylinder(r=1.65, h=25, $fn=28, center=true);
  translate([-5.625, -14.625, 28]) cylinder(r=1.65, h=25, $fn=28, center=true); 
  translate([-16.5, -5.25, 28]) cylinder(r=1.65, h=25, $fn=28, center=true); }
// ----------------------------------------------------------------------------------------------------

// Render the object.
// Comment or uncomment as needed.
//RC_Servo_Bracket_Left();
//RC_Servo_Bracket_Right();

// Render the object for printing.
// Comment or uncomment as needed.
//translate([0, 0, 28]) rotate([180, 0, 90]) RC_Servo_Bracket_Left();
//translate([0, 0, 28]) rotate([180, 0, 0]) RC_Servo_Bracket_Right();

// ----------------------------------------------------------------------------------------------------
