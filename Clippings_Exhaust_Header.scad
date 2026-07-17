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

// NAME:  Clippings Exhaust Header
// REVISION:  A1
// START DATE:  7/4/2026
// CURRENT VERSION DATE:  7/16/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A clippings evacuation header routing grass clippings from the cutting deck to the hopper.
//    Features a bottom flange mating to Body_Half, an 8x rib reinforced straight tube, a first
//    45deg elbow, an extension pipe with an oval intermediate support ring (10x screw holes for
//    body attachment), a second 45deg elbow bringing the pipe to horizontal, a short horizontal
//    pipe section, and a terminal circular flange mating flush with the X face of the hopper.
//    The terminal flange faces world +X. index_angle introduces a small rotation that can be
//    zeroed to achieve exact X-perpendicular alignment if needed.
// FILE NAME: Clippings_Exhaust_Header.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align bottom flange screw holes with Clippings_Flange_Screw_Holes() on Body_Half.
// 3. Fasten bottom flange with M2.5 screws.
// 4. Fasten oval intermediate ring to nearby body structure for pipe support.
// 5. Align terminal circular flange with matching hole in hopper X face and bolt together.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

include <Workfiles/Clippings_Flange_Screw_Holes.scad>
// A module for cutting the 8x screw holes in the terminal X-facing circular flange.
include <Workfiles/Clippings_X_Flange_Screw_Holes.scad>
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Clippings_Flange_Exhaust_Header() {
  // Primary dimensions.
  flange_r    = 18;   // Bottom flange outer radius.
  flange_t    = 2.5;  // Bottom flange thickness.
  flange_id   = 13;   // Bottom flange inner bore radius.
  tube_id     = 13;   // Tube inner radius (all sections).
  tube_od     = 14;   // Tube outer radius — 1mm wall (all sections).
  tube_h      = 35;   // Straight tube height above bottom flange.
  bend_r      = 14;   // Centerline bend radius — same for all elbows.
  bend_angle  = 45;   // First and second elbow bend angle from vertical (degrees).
  index_angle = 6.5;  // Z rotation orienting the first elbow toward the hopper.
                      // Set to 0 for exact world +X terminal flange alignment.
  ext_h       = 15;   // Extension pipe length between first and second elbows.
  pipe_x_h    = 7;    // Short pipe length in world +X direction after second elbow.

  // Rib dimensions.
  rib_base_d = flange_r - tube_od;
  rib_top_d  = 1.5;
  rib_base_w = 2.5;
  rib_top_w  = 1.2;
  rib_h      = 10;

  // Oval intermediate ring dimensions.
  oval_margin = 3;
  oval_t      = 2.5;
  oval_a_out  = tube_od / cos(bend_angle) + oval_margin;
  oval_b_out  = tube_od + oval_margin;
  oval_a_in   = tube_id / cos(bend_angle);
  oval_b_in   = tube_id;

  // Terminal circular flange dimensions (mates with hopper X face).
  x_flange_r  = 18;    // Terminal flange outer radius.
  x_flange_t  = 3;   // Flange plate thickness.

  difference() {
    union() {
      // Bottom flange plate.
      cylinder($fn=96, r=flange_r, h=flange_t, center=false);
      // Straight tube.
      translate([0, 0, flange_t]) cylinder($fn=96, r=tube_od, h=tube_h, center=false);
      // Tapered ribs (8x, between screw holes).
      for (i = [0:7]) {
        rotate([0, 0, i * 45 + 22.5])
        hull() {
          translate([tube_od + rib_base_d/2, 0, flange_t])
            cube([rib_base_d, rib_base_w, 0.01], center=true);
          translate([tube_od + rib_top_d/2, 0, flange_t + rib_h])
            cube([rib_top_d, rib_top_w, 0.01], center=true); } }
      // First 45deg elbow (vertical to 45deg tilt).
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r, 0, 0])
      rotate([0, 0, 180])
      rotate([90, 0, 0])
      rotate_extrude(angle=bend_angle, $fn=96)
        translate([bend_r, 0]) circle(r=tube_od, $fn=48);
      // Extension pipe.
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
      rotate([0, 45, 0])
        cylinder($fn=48, r=tube_od, h=ext_h + 1, center=false);
      // Second 45deg elbow (pipe direction to horizontal = world +X approximately).
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
      rotate([0, 45, 0])
      translate([0, 0, ext_h])
      translate([bend_r, 0, 0])
      rotate([0, 0, 180])
      rotate([90, 0, 0])
      rotate_extrude(angle=bend_angle, $fn=96)
        translate([bend_r, 0]) circle(r=tube_od, $fn=48);
      // Short pipe in world +X direction.
      // In pipe local frame, rotate([0,45,0]) aligns the cylinder axis with
      // local (sin45,0,cos45) = world +X. Terminal face is perpendicular to world +X.
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
      rotate([0, 45, 0])
      translate([bend_r*(1-cos(bend_angle)), 0, ext_h + bend_r*sin(bend_angle)])
      rotate([0, 45, 0])
        cylinder($fn=48, r=tube_od, h=pipe_x_h, center=false);
      // Terminal circular flange — face perpendicular to world +X, mates with hopper X face.
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
      rotate([0, 45, 0])
      translate([bend_r*(1-cos(bend_angle)), 0, ext_h + bend_r*sin(bend_angle)])
      rotate([0, 45, 0])
      translate([0, 0, pipe_x_h])
        cylinder($fn=96, r=x_flange_r, h=x_flange_t, center=false); }

    // Bore through bottom flange and straight tube.
    translate([0, 0, -1]) cylinder($fn=96, r=flange_id, h=flange_t + 2, center=false);
    translate([0, 0, flange_t]) cylinder($fn=96, r=tube_id, h=tube_h + 2, center=false);
    // Bore through first elbow.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([bend_r, 0, 0])
    rotate([0, 0, 180])
    rotate([90, 0, 0])
    rotate_extrude(angle=bend_angle + 1, $fn=96)
      translate([bend_r, 0]) circle(r=tube_id, $fn=48);
    // Bore through extension.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
    rotate([0, 45, 0])
      cylinder($fn=48, r=tube_id, h=ext_h + 2, center=false);
    // Bore through second elbow.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
    rotate([0, 45, 0])
    translate([0, 0, ext_h])
    translate([bend_r, 0, 0])
    rotate([0, 0, 180])
    rotate([90, 0, 0])
    rotate_extrude(angle=bend_angle + 1, $fn=96)
      translate([bend_r, 0]) circle(r=tube_id, $fn=48);
    // Bore through short X pipe and terminal flange.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
    rotate([0, 45, 0])
    translate([bend_r*(1-cos(bend_angle)), 0, ext_h + bend_r*sin(bend_angle)])
    rotate([0, 45, 0])
      cylinder($fn=48, r=tube_id, h=pipe_x_h + x_flange_t + 1, center=false);
    // 8x screw holes through terminal X-facing flange.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
    rotate([0, 45, 0])
    translate([bend_r*(1-cos(bend_angle)), 0, ext_h + bend_r*sin(bend_angle)])
    rotate([0, 45, 0])
    translate([0, 0, pipe_x_h])
      Clippings_X_Flange_Screw_Holes();
    // 8x screw holes through bottom flange.
    translate([0, 0, 7.25]) rotate([0, 180, 0]) Clippings_Flange_Screw_Holes(); } }

// Render the object.
// Comment or uncomment as needed.
//Clippings_Flange_Exhaust_Header();

// Render the object for printing.
// Comment or uncomment as needed.
//Clippings_Flange_Exhaust_Header();
// ----------------------------------------------------------------------------------------------------
