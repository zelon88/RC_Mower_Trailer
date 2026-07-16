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

// NAME:  RC Servo
// REVISION:  A1
// START DATE:  6/14/2026
// CURRENT VERSION DATE:  6/14/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A rudimentary parametric model of a standard R/C hobby servo for use in assemblies.
//    Dimensions approximate a standard full-size servo (e.g. Futaba S3003 / equivalent).
//    Not intended for printing — reference/clearance model only.
// FILE NAME: RC_Servo.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// N/A - Reference model only.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS
// N/A - Reference model only.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module RC_Servo_Holes() {
  // Mounting tab holes — call this inside a difference() to cut clearance holes.
  // Matches the body position: tabs overhang tab_w=7.5 on each side.
  tab_w  = 7.5; // Tab width.
  body_l = 40.5; // X - Body length.
  body_w = 20.5; // Y - Body width.
  body_h = 38.5; // Z - Body height below mounting tabs.
  tab_t = 2.5; // Tab thickness.
  tab_hole_r = 2.1; // Tab hole radius.
  tab_hole_x = 4; // Tab hole distance from edge.

  // Left tab holes (one each side in Y).
  translate([-tab_w + tab_hole_x, tab_hole_x, (body_h / 1.25) - tab_t - 1])
    cylinder($fn=28, r=tab_hole_r, h=tab_t + 2, center=false);
  translate([-tab_w + tab_hole_x, body_w - tab_hole_x, (body_h / 1.25) - tab_t - 1])
    cylinder($fn=28, r=tab_hole_r, h=tab_t + 2, center=false);

  // Right tab holes.
  translate([body_l + tab_w - tab_hole_x, tab_hole_x, (body_h / 1.25) - tab_t - 1])
    cylinder($fn=28, r=tab_hole_r, h=tab_t + 2, center=false);
  translate([body_l + tab_w - tab_hole_x, body_w - tab_hole_x, (body_h / 1.25) - tab_t - 1])
    cylinder($fn=28, r=tab_hole_r, h=tab_t + 2, center=false); }

module RC_Servo() {
  // Body dimensions (standard full-size servo, approx Futaba S3003).
  body_l = 40.5; // X - Body length.
  body_w = 20.5; // Y - Body width.
  body_h = 38.5; // Z - Body height below mounting tabs.
  boss_h = 4.5;  // Z - Height of output shaft boss above mounting tab level.

  // Mounting tab dimensions.
  tab_w = 7.5; // X - Tab overhang each side beyond body.
  tab_t = 2.5; // Z - Tab thickness.

  // Output shaft boss.
  boss_r = 7.75; // Radius of cylindrical boss on top.
  shaft_r = 24; // "Radius" of the arc of the output shaft.
  shaft_h = 2.5; // Height of the arm above boss top.
  shaft_w = 6.5; // Width of the arm above boss top.

  // Connector (3-pin, 2.54mm pitch).
  conn_w = 7; // X width of connector block.
  conn_d = 4; // Y depth of connector block.
  conn_h = 4; // Z height of connector block.

  difference() {
    union() {
      // Main body block.
      translate([0, 0, 0]) cube([body_l, body_w, body_h], center=false);

      // Mounting tabs (left and right, flush with top of body).
      translate([-tab_w, 0, (body_h / 1.25) - tab_t])
        cube([body_l + 2 * tab_w, body_w, tab_t], center=false);

      // Output shaft boss on top of tabs.
      translate([body_l / 4, body_w / 2, body_h - tab_t + tab_t])
        cylinder($fn=28, r=boss_r, h=boss_h, center=false);

      // Output shaft spline stub.
      translate([(body_l / 4) - (shaft_w / 2), body_w / 2, body_h - tab_t + tab_t + boss_h])
        cube([shaft_w, shaft_r, shaft_h], center=false);

      // Rear connector block.
      translate([body_l, (body_w - conn_w) / 2, (body_h / 5) - conn_h])
        cube([conn_d, conn_w, conn_h], center=false); }

    // Drill the holes through the mounting tabs.
    RC_Servo_Holes(); } }

// Render the object.
// Comment or uncomment as needed.
//RC_Servo();

// Render the object for printing.
// Comment or uncomment as needed.
//RC_Servo();
// ----------------------------------------------------------------------------------------------------