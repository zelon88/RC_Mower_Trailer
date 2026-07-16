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

// NAME:  Hopper Base
// REVISION:  A1
// START DATE:  7/16/2026
// CURRENT VERSION DATE:  7/16/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    The hollow hopper body that collects grass clippings.
//    Built from an outer and inner shell offset via scale() to produce a uniform wall thickness.
//    Features a mounting flange that mates to the Hopper Bracket, a relief for the Hopper Lift Servo,
//    mounting holes for the Servo Brackets and Rollover Safety Switch, and screw bosses on the back
//    surface that fasten the Hopper Base to the main body.
// FILE NAME: Hopper_Base.scad
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
// MODULES

// A module for creating a low-poly R/C compatible servo.
include <Workfiles/RC_Servo.scad>;
// A module for calling in the Rollover Safety Switch Assembly.
include <Rollover_Safety_Switch.scad>;
// A module for calling in the Left & Right Servo Brackets.
include <Servo_Bracket.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// A module to cut out the relief for the Hopper Lift Servo.
// This relief aligns with the optimal Hopper Lift Servo location.
// Use this module in conjunction with the scale() function to achieve a hollow interior.
module Hopper_Base_Relief() {
  // Define the geometry for the Hopper Lift Servo relief.
  translate([74, 17.75, 111.75]) rotate([90, 90, 180]) cube([70, 35, 37.5], center=false); }

// A module to drill out the through holes for the Hopper Flange.
module Hopper_Base_Flange_Holes() {
  // Drill through holes for the Hopper.
  translate([53, 0, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([53, 7.5, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([53, -7.5, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([53, 15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([53, -15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([59.5, 15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([59.5, -15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([66.5, 15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([66.5, -15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([73, 0, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([73, 7.5, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([73, -7.5, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([73, 15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([73, -15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true); }

// A module to add the main mounting flange, separately from the rest of the body.
module Hopper_Base_Flange() {
  difference() {
    union() {
      // Create the mating surface for the Hopper Bracket.
      translate([63, 0, 20]) rotate([90, 0, 0]) cylinder(r=7.4, h=24.9, $fn=28, center=true);
      // Create a rigid backbone structure connecting the body of the Hopper to the flange.
      translate([63, 0, 28]) cube([10, 15, 10], center=true);
      // Create the flange.
      translate([75.5, 0, 21.25]) cube([50, 35, 3], center=true); }
    // Chamfer the edges to preserve airflow for Center Bracket vents.
    translate([46.25, 0, 25]) rotate([0, 45, 0]) cube([10, 50, 10], center=true);
    translate([46.4, 0, 25]) rotate([0, 25, 0]) cube([10, 50, 10], center=true);

    Hopper_Base_Flange_Holes();

    // Shallow rear backplate angles.
    translate([59.5, 15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
    translate([59.5, -15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
    translate([66.5, 15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
    translate([66.5, -15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);

    // Wide rear backplate angles.
    translate([73, 0, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
    translate([73, 7.5, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
    translate([73, -7.5, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
    translate([73, 15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true);
    translate([73, -15, 15]) cylinder(r=1.22, h=25, $fn=28, center=true); } }

// A module to add the main outer shell of the body, without through holes.
// This module does not have through holes so they do not get caught in the upcoming scale().
module Hopper_Base_Outer_Body_No_Holes() {
  difference() {
    union() {
      // Create the bottom surface.
      translate([63, 0, 69.75]) cube([15, 25, 100], center=true);
      // Create the side center portion.
      translate([103, 0, 69.75]) cube([75, 110, 100], center=true);
      // Create the side angled portions.
      translate([74.65, -13, 69.75]) rotate([0, 0, 22]) cube([25, 25, 100], center=true);
      translate([86.45, -25, 69.75]) rotate([0, 0, 6.5]) cube([45, 55, 100], center=true);
      translate([74.65, 13, 69.75]) rotate([0, 0, -22]) cube([25, 25, 100], center=true);
      translate([86.45, 25, 69.75]) rotate([0, 0, -6.5]) cube([45, 55, 100], center=true); }
    // Cut out the relief for the Hopper Lift Servo.
    Hopper_Base_Relief();
    // Cut the box in half diagonally.
    translate([155.5, 0, 65.75]) rotate([0, 30, 0]) cube([75, 115, 110], center=true);
    translate([145, 0, 5]) cube([75, 110, 50], center=true); } }

// A module to add the main outer shell of the body, with through holes.
// Use this module in conjunction with the scale() function to achieve a hollow interior.
module Hopper_Base_Outer_Body() {
  difference() {
    Hopper_Base_Outer_Body_No_Holes();
    Hopper_Base_Flange_Holes(); } }

// A module to add the main inner shell of the body.
// Use this module in conjunction with the scale() function to achieve a hollow interior.
module Hopper_Base_Inner_Body() {
  difference() {
    translate([15, 0, 10]) scale([0.9, 0.9, 0.9]) Hopper_Base_Outer_Body();
    Hopper_Base_Flange_Holes(); } }

module Hopper_Base() {
  // Create the mounting flange that mates to the Hopper Bracket.
  Hopper_Base_Flange();
  difference() {
    // Create the body shell of the Hopper Base.
    union() {
      difference() {
        // Cut out outer shell of the Hopper to clean up the outside surfaces.
        Hopper_Base_Outer_Body();
        // Hollow out the inner body.
        Hopper_Base_Inner_Body();
        // Add the mounting holes for the Servo Brackets.
        translate([46, 36, 86.65]) rotate([90, 0, 90]) RC_Servo_Bracket_Mount_Holes_Left();
        translate([46, 36, 68.375]) rotate([180, 270, 0]) RC_Servo_Bracket_Mount_Holes_Right();
        // Add clearance for Servo Bracket hardware on the inside of the Hopper Base.
        translate([84.1, 50.5, 92.3]) rotate([0, 90, 0]) cylinder(r=3, h=5, $fn=28, center=true);
        translate([84.1, 50.5, 62.75]) rotate([0, 90, 0]) cylinder(r=3, h=5, $fn=28, center=true);
        // Add the mounting holes for the Rollover Safety Switch.
        translate([61.75, -47.5, 45]) rotate([0, 90, 180]) Rollover_Safety_Switch_Screw_Holes();
        translate([-61.75, 47.5, 45]) rotate([0, 90, 0]) Rollover_Safety_Switch_Screw_Holes();
        // Hollow out the middle bottom section of the inside of the hopper to enable screw access.
        // Add support material.
        translate([88.75, 0, 29.25]) cube([50, 35, 12], center=true); } }
    // Cut out the middle of the boss.
    translate([62.5, -42.5, 25]) cube([8, 8.5, 5.75], center=true); }

  // Finish the Servo Relief section to fill in missing material.
  difference() {
    // Fill in the Hopper Lift Servo Relief again.
    union() {
      translate([70.5, 15.97609, 110]) cube([11.09, 35, 5], center=false);
      translate([70.5, 15.97609, 35.25]) cube([11.09, 35, 12.5], center=false); }
    // Cut out the Hopper Lift Servo Relief again.
    Hopper_Base_Relief(); }

  // Create the Hopper Base to Main Body screw bosses on the back surface of the Hopper Base.
  // Create the right screw boss.
  difference() {
    union() {
      // Create the sides of the screw boss.
      translate([63.5, -37, 23.75]) cube([8, 2.5, 8], center=true);
      translate([63.5, -48, 23.75]) cube([8, 2.5, 8], center=true);
      // Create the bottom of the screw boss.
      translate([63.5, -42.5, 21]) cube([8, 13.5, 2.5], center=true); }
    // Cut out the middle of the boss.
    translate([62.5, -42.5, 25]) cube([8, 8.5, 5.75], center=true);
    // Chamfer the supports.
    translate([52.5, -42.5, 30.5]) rotate([0, -55, 0]) cube([8, 15, 20.93], center=true);
    // Cut screw holes through standoffs.
    for (i = [0:19]) {
      skirt_angle = i * 18 + 9;
      translate([72 * cos(skirt_angle), -75 + 72 * sin(skirt_angle), 10])
        cylinder($fn=28, r=1.22, h=30); } }
  // Create the left screw boss.
  difference() {
    union() {
      // Create the sides of the screw boss.
      translate([63.5, 37, 23.75]) cube([8, 2.5, 8], center=true);
      translate([63.5, 48, 23.75]) cube([8, 2.5, 8], center=true);
      // Create the bottom of the screw boss.
      translate([63.5, 42.5, 21]) cube([8, 13.5, 2.5], center=true); }
    // Cut out the middle of the boss.
    translate([62.5, 42.5, 25]) cube([8, 8.5, 5.75], center=true);
    // Chamfer the supports.
    translate([52.5, 42.5, 30.5]) rotate([0, -55, 0]) cube([8, 15, 20.93], center=true);
    // Cut screw holes through standoffs.
    for (i = [0:19]) {
      skirt_angle = i * 18 + 9;
      translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), 10])
        cylinder($fn=28, r=1.22, h=30); } } }

// Render the object.
// Comment or uncomment as needed.
Hopper_Base();

// Render the object for printing.
// Comment or uncomment as needed.
//Hopper_Base();

// Comment or uncomment to simulate the Hopper Lift Servo as needed.
//translate([70.25, 20.25, 97.5]) rotate([90, 90, 180]) RC_Servo();
// Comment or uncomment to simulate the Servo Brackets as needed.
//translate([46, 36, 86.65]) rotate([90, 0, 90]) RC_Servo_Bracket_Left();
//translate([46, 36, 68.35]) rotate([180, 270, 0]) RC_Servo_Bracket_Right();
// ----------------------------------------------------------------------------------------------------