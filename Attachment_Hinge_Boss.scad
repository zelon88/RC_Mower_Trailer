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

// NAME:  Attachment Hinge Boss
// REVISION:  A1
// START DATE:  5/27/2026
// CURRENT VERSION DATE:  6/14/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A standoff hinge boss that mates with the Attachment mounting pad on the main frame torus.
//    Features a 3mm flange with 10 through-holes matching the pad screw pattern, a rectangular
//    standoff post, and a horizontal cylindrical boss bored for a 5mm hinge pin.
//    The flange corners are chamfered along Z to clear interference with nuts on top of the
//    Body_Skirt boss standoffs.
//    Resembles a "hinge pin with a standoff flange".
// FILE NAME: Attachment_Hinge_Boss.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align flange to mounting pad face (top face of pad at Z=20).
// 3. Fasten with M2.5 screws through matching 10x through-holes.
// 4. Press or slide 5mm hinge pin through boss bore.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for mating the attachment boss screw holes.
include <Workfiles/Attachment_Boss_Screw_Holes.scad>
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Attachment_Hinge_Boss() {
  // Flange dimensions (match mounting pad top face exactly).
  flange_width     = 15;     // X - matches pad cube X dimension.
  flange_height    = 22.5;   // Y - matches pad cube Y dimension.
  flange_thickness = 3;      // Z - 3mm thick as specified.

  // Rectangular standoff post dimensions.
  // Sized to fit within the interior of the screw hole pattern.
  post_width       = 5;      // X - fits between x=58 and x=68 hole columns.
  post_depth       = 10;     // Y - fits between y=66 and y=84 hole rows.
  post_height      = 15;     // Z - height of post above flange.

  // Horizontal hinge pin boss dimensions.
  boss_od          = 10;     // Outer diameter of cylindrical boss.
  pin_id           = 5.1;    // Inner bore diameter (5mm pin + 0.2mm clearance).
  boss_length      = 20;     // Total Y span of cylindrical boss.

  // Anchor: mates to top face of mounting pad (Z=20), centered at (63, 75).
  cx = 62; cy = 75; cz = 20;

  difference() {
    union() {
      // 3mm flange plate, matching pad face footprint.
      translate([cx, cy, cz + flange_thickness / 2])
        cube([flange_width, flange_height, flange_thickness], center=true);
      // Rectangular standoff post rising from flange center.
      translate([cx, cy, cz + flange_thickness + post_height / 2])
        cube([post_width, post_depth, post_height], center=true);
      // Horizontal hinge pin boss on top of post, oriented along Y axis.
      translate([cx, cy, cz + flange_thickness + post_height])
        rotate([90, 0, 0]) cylinder($fn=48, r=boss_od / 2, h=boss_length, center=true); }
    // Drill the screw holes into the flange.
    Attachment_Boss_Screw_Holes(52, 1, 75, 20);
    // First chamfer of the 4 vertical corners of the flange.
    translate([cx + 7.5, cy + 11.25, cz + flange_thickness / 2])
      rotate([0, 0, 22.5]) cube([2, 6.5, flange_thickness + 0.5], center=true);
    translate([cx + 7.5, cy - 11.25, cz + flange_thickness / 2])
      rotate([0, 0, -22.5]) cube([2, 6.5, flange_thickness + 0.5], center=true);
    translate([cx - 7.5, cy + 11.25, cz + flange_thickness / 2])
      rotate([0, 0, -22.5]) cube([2, 6.5, flange_thickness + 0.5], center=true);
    translate([cx - 7.5, cy - 11.25, cz + flange_thickness / 2])
      rotate([0, 0, 22.5]) cube([2, 6.5, flange_thickness + 0.5], center=true);
    // Second chamfer of the 4 vertical corners of the flange.
    translate([cx + 7.5, cy + 11.25, cz + flange_thickness / 2])
      rotate([0, 0, 45]) cube([2.5, 6.5, flange_thickness + 0.5], center=true);
    translate([cx + 7.5, cy - 11.25, cz + flange_thickness / 2])
      rotate([0, 0, -45]) cube([2.5, 6.5, flange_thickness + 0.5], center=true);
    translate([cx - 7.5, cy + 11.25, cz + flange_thickness / 2])
      rotate([0, 0, -45]) cube([2.5, 6.5, flange_thickness + 0.5], center=true);
    translate([cx - 7.5, cy - 11.25, cz + flange_thickness / 2])
      rotate([0, 0, 45]) cube([2.5, 6.5, flange_thickness + 0.5], center=true);
    // Third chamfer of the 4 vertical corners of the flange.
    translate([cx + 7.5, cy + 11.25, cz + flange_thickness / 2])
      rotate([0, 0, 65]) cube([2, 6.5, flange_thickness + 0.5], center=true);
    translate([cx + 7.5, cy - 11.25, cz + flange_thickness / 2])
      rotate([0, 0, -65]) cube([2, 6.5, flange_thickness + 0.5], center=true);
    translate([cx - 7.5, cy + 11.25, cz + flange_thickness / 2])
      rotate([0, 0, -65]) cube([2, 6.5, flange_thickness + 0.5], center=true);
    translate([cx - 7.5, cy - 11.25, cz + flange_thickness / 2])
      rotate([0, 0, 65]) cube([2, 6.5, flange_thickness + 0.5], center=true);

    // Hinge pin bore through the boss, centered along Y axis.
    translate([cx, cy, cz + flange_thickness + post_height])
      rotate([90, 0, 0]) cylinder($fn=48, r=pin_id / 2, h=boss_length + 2, center=true); } }

// Render the object.
// Comment or uncomment as needed.
Attachment_Hinge_Boss();

// Render the object for printing.
// Comment or uncomment as needed.
//Attachment_Hinge_Boss();
// ----------------------------------------------------------------------------------------------------