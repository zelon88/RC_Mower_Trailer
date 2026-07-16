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
// CURRENT VERSION DATE:  7/14/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A clippings evacuation flange that mates with the landing pad in Body_Half.scad.
//    Features a 3mm flange plate, 8x screw holes, a 20mm straight tube (ID=13mm),
//    8x tapered vertical ribs, a 45deg curved elbow indexed between flange screw holes,
//    a straight extension after the elbow reaching into the rear of the hopper, and
//    a vertical oval mating flange at the pipe exit facing X to bolt to the hopper wall.
//    The extension end is cut flush with the Z axis, creating a horizontal oval opening.
//    Screw holes for the oval flange are added via a separate module.
// FILE NAME: Clippings_Exhaust_Header.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align bottom screw holes with Clippings_Flange_Screw_Holes() on Body_Half.
// 3. Fasten bottom flange with M2.5 screws.
// 4. Align oval flange with matching oval hole in hopper wall and bolt together.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating the Clippings Flange Screw Holes.
include <Workfiles/Clippings_Flange_Screw_Holes.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Clippings_Flange_Exhaust_Header() {
  // Primary dimensions.
  flange_r    = 18;    // Bottom flange outer radius.
  flange_t    = 2.5;  // Bottom flange thickness.
  flange_id   = 13;   // Bottom flange inner bore radius.
  tube_id     = 13;   // Tube inner radius.
  tube_od     = 14;   // Tube outer radius — 1mm wall.
  tube_h      = 40;   // Straight tube height above flange.
  bend_r      = 14;   // Elbow centerline bend radius.
  bend_angle  = 45;   // Elbow bend angle from vertical (degrees).
  index_angle = 7.5;  // Rotation around Z to orient elbow toward hopper.
  ext_h       = 52.75; // Extension pipe length after elbow.

  // Rib dimensions.
  rib_base_d = flange_r - tube_od; // 4mm radial depth at base.
  rib_top_d  = 1.5;
  rib_base_w = 2.5;
  rib_top_w  = 1.2;
  rib_h      = 10;

  // Oval flange dimensions.
  oval_margin  = 3;   // Radial margin beyond pipe wall.
  oval_t       = 2.5; // Oval flange plate thickness.
  // Major semi-axis: pipe at 45deg to wall → tube_od/cos(45deg) = tube_od*sqrt(2).
  oval_a_out   = tube_od / cos(bend_angle) + oval_margin; // ~22.8mm.
  oval_b_out   = tube_od + oval_margin;                    // 17mm.
  oval_a_in    = tube_id / cos(bend_angle);                // ~18.4mm bore.
  oval_b_in    = tube_id;                                  // 13mm bore.

  // Pipe tip position in tube-top-local space (all computed inline to avoid scope issues).
  // X (horizontal) = bend_r*(1-cos(bend_angle)) + ext_h*sin(bend_angle).
  // Z (vertical)   = bend_r*sin(bend_angle)     + ext_h*cos(bend_angle).

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
      // 45deg curved elbow.
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r, 0, 0])
      rotate([0, 0, 180])
      rotate([90, 0, 0])
      rotate_extrude(angle=bend_angle, $fn=96)
        translate([bend_r, 0]) circle(r=tube_od, $fn=48);
      // Straight extension after elbow.
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r*(1-cos(bend_angle)), 0, bend_r*sin(bend_angle)])
      rotate([0, 45, 0])
        cylinder($fn=48, r=tube_od, h=ext_h + tube_od/sin(bend_angle), center=false);
      // Vertical oval mating flange at pipe exit, facing X to bolt to hopper wall.
      // rotate([0,90,0]) rotates from XY plane to YZ plane so the face points in X.
      // After rotation: scale-X becomes Z semi-axis (major, vertical).
      //                 scale-Y becomes Y semi-axis (minor, horizontal).
      rotate([0, 0, index_angle])
      translate([0, 0, flange_t + tube_h])
      translate([bend_r*(1-cos(bend_angle)) + ext_h*sin(bend_angle),
                 0,
                 bend_r*sin(bend_angle) + ext_h*cos(bend_angle)])
      rotate([0, 90, 0])
      difference() {
        scale([oval_a_out, oval_b_out, 1])
          cylinder($fn=96, r=1, h=oval_t, center=true);
        scale([oval_a_in, oval_b_in, 1])
          cylinder($fn=96, r=1, h=oval_t + 1, center=true);
        // 10 screw holes evenly spaced at 36deg intervals on the midpoint ellipse.
        // Mid semi-axes: X=(oval_a_out+oval_a_in)/2=20.6, Y=(oval_b_out+oval_b_in)/2=15.
        // r=1.22 leaves ~0.78-0.98mm clearance to each edge — as centred as possible.
        for (i = [0:9]) {
          translate([(tube_od/cos(bend_angle) + oval_margin + tube_id/cos(bend_angle)) / 2 * cos(i*36),
                     (tube_od + oval_margin + tube_id) / 2 * sin(i*36), 0])
            cylinder($fn=28, r=1.22, h=oval_t + 1, center=true); } } }

    // Bore through bottom flange and straight tube.
    translate([0, 0, -1]) cylinder($fn=96, r=flange_id, h=flange_t + 2, center=false);
    translate([0, 0, flange_t]) cylinder($fn=96, r=tube_id, h=tube_h + 2, center=false);
    // Bore through elbow.
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
      cylinder($fn=48, r=tube_id, h=ext_h + tube_od/sin(bend_angle) + 1, center=false);
    // Cut pipe end with vertical plane at flange centerline X.
    // Pipe is extended past this cut so the end cap is beyond the cut plane,
    // giving a complete oval cross-section on the cut face with no C-shape or stub.
    rotate([0, 0, index_angle])
    translate([0, 0, flange_t + tube_h])
    translate([bend_r*(1-cos(bend_angle)) + ext_h*sin(bend_angle), -200, -200])
      cube([400, 400, 400], center=false);
    // 8x screw holes through bottom flange.
    translate([0, 0, 7.25]) rotate([0, 180, 0]) Clippings_Flange_Screw_Holes(); } }

// Render the object.
// Comment or uncomment as needed.
//Clippings_Flange_Exhaust_Header();

// Render the object for printing.
// Comment or uncomment as needed.
//Clippings_Flange_Exhaust_Header();
// ----------------------------------------------------------------------------------------------------