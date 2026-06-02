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
// CURRENT VERSION DATE:  5/28/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A standoff hinge boss that mates with the Attachment mounting pad on the main frame torus.
//    Features a 3mm flange with 10 through-holes matching the pad screw pattern, a rectangular
//    standoff post, and a horizontal cylindrical boss bored for a 5mm hinge pin.
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
// GEOMETRY

module Attachment_Hinge_Boss() {

  // Flange dimensions (match mounting pad top face exactly).
  flange_width     = 15;     // X - matches pad cube X dimension.
  flange_height    = 25;     // Y - matches pad cube Y dimension.
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
  cx = 63; cy = 75; cz = 20;

  difference() {
    union() {
      // 3mm flange plate, matching pad face footprint.
      translate([cx, cy, cz + flange_thickness/2])
        cube([flange_width, flange_height, flange_thickness], center=true);
      // Rectangular standoff post rising from flange center.
      translate([cx, cy, cz + flange_thickness + post_height/2])
        cube([post_width, post_depth, post_height], center=true);
      // Horizontal hinge pin boss on top of post, oriented along Y axis.
      translate([cx, cy, cz + flange_thickness + post_height])
        rotate([90, 0, 0]) cylinder($fn=48, r=boss_od/2, h=boss_length, center=true); }

    // Matching through-holes (10x) mirroring the mounting pad screw pattern.
    translate([58, 84, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([58, 78, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([58, 72, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([58, 66, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([63, 84, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([68, 84, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([68, 78, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([68, 72, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([68, 66, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);
    translate([63, 66, cz - 0.5]) cylinder($fn=28, r=1.22, h=flange_thickness + 1);

    // Hinge pin bore through the boss, centered along Y axis.
    translate([cx, cy, cz + flange_thickness + post_height])
      rotate([90, 0, 0]) cylinder($fn=48, r=pin_id/2, h=boss_length + 2, center=true); }
}

// Render the object.
// Comment or uncomment as needed.
//Attachment_Hinge_Boss();
// ----------------------------------------------------------------------------------------------------
