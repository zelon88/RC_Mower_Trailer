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

// NAME:  Clippings X Flange Screw Holes
// REVISION:  A1
// START DATE:  7/16/2026
// CURRENT VERSION DATE:  7/16/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    Two reusable modules for the terminal X-facing flange of Clippings_Exhaust_Header:
//
//    Clippings_X_Flange_Screw_Holes() — cuts the 8-hole screw pattern into the flange itself.
//    Call inside a difference() using the same transform chain as the terminal flange.
//    Holes at r=16 on the midpoint circle. Recesses on -Z (pipe-facing) side for tool access.
//
//    Clippings_X_Flange_Mating_Cut() — cuts the full flange mating surface into the hopper wall.
//    Contains the complete transform chain from the header module origin to the flange face.
//    Drop into the hopper difference() block with the same translate/rotate as the header:
//      translate([-32, 40, 19.75]) rotate([0, 0, 180]) Clippings_X_Flange_Mating_Cut();
//    Values are hardcoded from Clippings_Exhaust_Header — update both files if dimensions change.
//    Cuts: flange pocket (r=22, d=2.5mm), through bore (r=13), 8x screw holes (r=1.22).
// FILE NAME: Clippings_X_Flange_Screw_Holes.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Clippings_X_Flange_Screw_Holes() {
  // 8x screw holes with deep recess on -Z (pipe-facing) face.
  // Must match x_flange_r and tube_id in Clippings_Exhaust_Header.scad.
  for (i = [0:7]) {
    translate([16 * cos(i * 45), 16 * sin(i * 45), 0]) {
      // Through hole.
      cylinder($fn=28, r=1.22, h=10, center=false);
      // Deep screw recess on -Z face for installation access from pipe side.
      translate([0, 0, -5]) cylinder($fn=28, r=2, h=5, center=false); } } }

module Clippings_X_Flange_Mating_Cut() {
  // Cuts the full flange mating surface into the hopper wall.
  // Replicates the exact transform chain from Clippings_Exhaust_Header to the flange face.
  // Hardcoded from: index_angle=3.75, bend_r=14, bend_angle=45, flange_t=2.5,
  //                 tube_h=40, ext_h=20, pipe_x_h=5.
  // Derived: bend_r*(1-cos45)=4.1, bend_r*sin45=9.9, flange_t+tube_h=42.5.
  // Update these values if any primary dimensions change in the header module.
  rotate([0, 0, 7.5])
  translate([0, 0, 42.5])
  translate([4.1, 0, 9.9])
  rotate([0, 45, 0])
  translate([4.1, 0, 29.9])
  rotate([0, 45, 0])
  translate([0, 0, 5]) {
    // Flange pocket — seats the flange plate flush with the hopper wall exterior.
    cylinder($fn=96, r=18, h=2.5, center=false);
    // Through bore — clears the pipe through the hopper wall.
    cylinder($fn=96, r=13, h=50, center=false);
    // 8x screw holes through hopper wall — matching the flange hole pattern.
    for (i = [0:7]) {
      translate([16 * cos(i * 45), 16 * sin(i * 45), 0])
        cylinder($fn=28, r=1.22, h=20, center=false); } } }
// ----------------------------------------------------------------------------------------------------
