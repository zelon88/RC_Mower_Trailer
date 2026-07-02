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
//    A T-shaped servo mounting bracket resembling a single-leg diner table.
//    Two brackets are required per servo, one per side.
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

module RC_Servo_Bracket() {
  // Servo tab reference dimensions (must match RC_Servo.scad).
  body_w = 20.5; // Y - Servo body width.
  tab_hole_x = 4; // Distance of tab hole center from servo body edge.
  tab_hole_r = 2.1; // Tab hole radius (M4 clearance).

  // Flange (tabletop) dimensions.
  flange_w = 30; // Y - Total flange width (both wings + leg thickness).
  flange_d = 21; // X - Flange depth (front to back).
  flange_t = 3; // Z - Flange thickness.

  // Leg (standoff) dimensions.
  leg_t = 4; // X - Leg thickness.
  leg_w = 10; // Y - Leg width matches servo body width.
  leg_h = 25; // Z - Leg height (clearance for servo body side).

  // Slot dimensions.
  slot_r = 1.65; // Radius of slot end caps (M3 clearance, r=1.65).
  slot_len_flange = 4; // X - Slot travel length in flange wings (shortened to preserve material).
  slot_len_leg = 4; // Z - Slot travel length in leg.
  slot_x_inner = 5; // X center of inner flange slot (was 5, repositioned for material bridge).
  slot_x_outer = 16; // X center of outer flange slot (was 15, repositioned for material bridge).

  // Leg slot Y positions — match servo tab hole spacing.
  leg_slot_y1 = tab_hole_x; // Y=4, inner tab hole.
  leg_slot_y2 = body_w - tab_hole_x; // Y=16.5, outer tab hole.

  difference() {
    union() {
      // Flange plate — centered in Y, sitting on top of leg.
      translate([0, 0, leg_h]) cube([flange_d, flange_w, flange_t], center=false);
      // Leg — centered in Y within the flange, dropping from Z=0 to Z=leg_h.
      translate([(flange_d - leg_t) / 2, (flange_w - leg_w) / 2, 0])
        cube([leg_t, leg_w, leg_h], center=false); }

    // Flange slots — 2 per wing, now running along X (fore-aft adjustment).
    // Left wing slots.
    for (xi = [slot_x_inner, slot_x_outer]) {
      wing_cy = (flange_w - leg_w) / 4;
      translate([xi, wing_cy, leg_h - 0.5])
        hull() {
          translate([-slot_len_flange / 2, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 1);
          translate([ slot_len_flange / 2, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 1); } }
    // Right wing slots.
    for (xi = [slot_x_inner, slot_x_outer]) {
      wing_cy = flange_w - (flange_w - leg_w) / 4;
      translate([xi, wing_cy, leg_h - 0.5])
        hull() {
          translate([-slot_len_flange / 2, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 1);
          translate([ slot_len_flange / 2, 0, 0]) cylinder($fn=20, r=slot_r, h=flange_t + 1); } }

    // Leg slots — 2 slots boring through Y face (wide face), elongated in Z (height adjustment).
    // Servo tab presses against the Y face of the leg; screws accessible from outside in Y.
    // Y positions match servo tab hole centers; slot spans leg_h/2 +/- slot_len_leg/2.
    for (leg_y = [leg_slot_y1, leg_slot_y2]) {
      translate([(flange_d) / 2, (flange_w - leg_w) / 2 + leg_y, leg_h / 2])
        hull() {
          translate([0, 0, -slot_len_leg / 2]) rotate([90, 0, 0])
            cylinder($fn=20, r=slot_r, h=leg_w + 2, center=true);
          translate([0, 0,  slot_len_leg / 2]) rotate([90, 0, 0])
            cylinder($fn=20, r=slot_r, h=leg_w + 2, center=true); } } } }

// Render the object.
// Comment or uncomment as needed.
//RC_Servo_Bracket();

// Render the object for printing.
// Comment or uncomment as needed.
RC_Servo_Bracket();
// ----------------------------------------------------------------------------------------------------
