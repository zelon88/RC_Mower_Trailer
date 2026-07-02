include <Workfiles/RC_Servo.scad>;
translate([70.25, 20.25, 97.5]) rotate([90, 90, 180]) RC_Servo();

// A Module to cut out the relief for the Hopper Lift Servo.
// This relief aligns with the optimal Hopper Lift Servo location.
// Use this module in conjunction with the scale() function to achieve a hollow interior.
module Hopper_Base_Relief() {
  // Define the geometry for the Hopper Lift Servo relief.
  translate([74, 20.25, 111.75]) rotate([90, 90, 180]) cube([70, 35, 35], center=false); }

  // A Module to drill out the through holes for the Hopper Flange.
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

// A Module to add the main mounting flange, separately from the rest of the body.
module Hopper_Base_Flange() {
  difference() {
    union() {
      // Create the mating surface for the Hopper Bracket.
      translate([63, 0, 20]) rotate([90, 0, 0]) cylinder(r=7.4, h=24.9, $fn=28, center=true);
      // Create the flange.
      translate([75.5, 0, 21.25]) cube([50, 35, 3], center=true); }
    // Chamfer the edges to preserve airflow for Center Bracket vents.
    translate([46.25, 0, 25]) rotate([0, 45, 0]) cube([10, 50, 10], center=true);
    translate([46.4, 0, 25]) rotate([0, 25, 0]) cube([10, 50, 10], center=true);

    Hopper_Base_Flange_Holes()
    
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
    
// A Module to add the main outer shell of the body, without through holes.
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
      translate([86.45, 25, 69.75]) rotate([0, 0, -6.5]) cube([45, 55, 100], center=true);
    }
    
    // Cut out the relief for the Hopper Lift Servo.
    Hopper_Base_Relief();

    // Cut the box in half diagonally.
    translate([155.5, 0, 65.75]) rotate([0, 30, 0]) cube([75, 115, 110], center=true);
    translate([145, 0, 5]) cube([75, 110, 50], center=true);


} }

// A Module to add the main outer shell of the body, with through holes.
// Use this module in conjunction with the scale() function to achieve a hollow interior.
module Hopper_Base_Outer_Body() {
  difference() {
    Hopper_Base_Outer_Body_No_Holes();
    Hopper_Base_Flange_Holes(); } }

// A Module to add the main inner shell of the body.
// Use this module in conjunction with the scale() function to achieve a hollow interior.
module Hopper_Base_Inner_Body() {
  difference() {
    translate([15, 0, 10]) scale([0.9, 0.9, 0.9]) Hopper_Base_Outer_Body();
    Hopper_Base_Flange_Holes();
} }

module Hopper_Base() {
  Hopper_Base_Flange();
  difference() {
    Hopper_Base_Outer_Body();
    // Cut out the Hopper Lift Servo Relief again.
    Hopper_Base_Relief();
    // Hollow out the inner body.
    Hopper_Base_Inner_Body();
    // Hollow out the middle bottom section of the inside of the hopper to enable screw access.
    translate([88.75, 0, 29.25]) cube([50, 35, 12], center=true);
  }

}


Hopper_Base();