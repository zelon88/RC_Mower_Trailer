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

// NAME:  Bearings
// REVISION:  A1
// START DATE:  7/14/2026
// CURRENT VERSION DATE:  7/14/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    Low-poly representative models of the off-the-shelf bearings used in the Differential Assembly.
//    Includes a standard 5x8x2.5mm bearing, a flanged 5x8x2.5mm bearing, and an F3-6-2.8M thrust bearing.
//    These are reference geometry for rendering only and are not intended to be 3D printed.
// FILE NAME: Bearings.scad
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

// Representative model: standard 5x8x2.5mm bearing (no flange).
module bearing_3x5x2_5() {
  id = 3.0;
  od = 5.0;
  w = 2.5;
  color("LightSteelBlue") {
    difference() {
      cylinder(h=w, r=od/2, $fn=96, center=false);
      translate([0, 0, -0.5]) cylinder(h=w + 1.0, r=id/2, $fn=96); } } }

// Representative model: standard 5x8x2.5mm bearing (no flange).
module bearing_5x8x2_5() {
  id = 5.0;
  od = 8.0;
  w = 2.5;
  color("LightSteelBlue") {
    difference() {
      cylinder(h=w, r=od/2, $fn=96, center=false);
      translate([0, 0, -0.5]) cylinder(h=w + 1.0, r=id/2, $fn=96); } } }

// Representative model: 5x8x2.5mm flanged bearing (e.g. F685 miniature series).
// Inner diameter: 5.0mm. Outer diameter: 8.0mm. Total width: 2.5mm.
// Flange diameter: 9.2mm. Flange thickness: 0.6mm.
module flanged_bearing_5x8x2_5() {
  id = 5.0;
  od = 8.0;
  w = 2.5;
  flange_od = 9.2;
  flange_w = 0.6;

  color("LightSteelBlue") {
    difference() {
      union() {
        // Create the main bearing outer ring body.
        cylinder(h=w - flange_w, r=od/2, $fn=96, center=false);
        // Create the lip layer forming the outer flange edge, built upward on Z.
        translate([0, 0, w - flange_w]) cylinder(h=flange_w, r=flange_od/2, $fn=96, center=false); }
      // Cut the master concentric bore through-hole.
      translate([0, 0, -0.5]) cylinder(h=w + 1.0, r=id/2, $fn=96); } } }

// Representative model: F3-6-2.8M thrust bearing.
module f3_6_2_8m_bearing() {
  washer_h = 0.9;
  cage_h = 1.0;
  color("Silver") {
    difference() {
      cylinder(h=washer_h, r=6.0/2, center=false, $fn=96);
      translate([0, 0, -0.5]) cylinder(h=washer_h + 1.0, r=3.0/2, $fn=96); }
    translate([0, 0, washer_h]) difference() {
      cylinder(h=cage_h, r=5.8/2, center=false, $fn=96);
      translate([0, 0, -0.5]) cylinder(h=cage_h + 1.0, r=3.2/2, $fn=96); }
    translate([0, 0, washer_h + cage_h]) difference() {
      cylinder(h=washer_h, r=6.0/2, center=false, $fn=96);
      translate([0, 0, -0.5]) cylinder(h=washer_h + 1.0, r=3.0/2, $fn=96); } } }