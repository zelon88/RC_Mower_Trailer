// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating torus' to aide in crafting the body.
include <Workfiles/Torus.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for calling in half of the Body.
include <Body_Half.scad>
// A module for creating torus' to aide in crafting the body.
include <Workfiles/Torus.scad>;
// ----------------------------------------------------------------------------------------------------

module Hopper_Bracket() {
difference() {
  // Create the body of the Hopper Bracket.
  translate([57.5, 0, 15.25]) cube([40, 121.5, 9], center=true);
  // Cut out a relief for the Center Bracket.
  Center_Bracket();
  // Cut out a mating surface for the Hopper.
  translate([63, 0, 20]) rotate([90, 0, 0]) cylinder(r=7.5, h=25, $fn=28, center=true);
  // Cut a slot at the bottom of the hopper mating surface to allow debris to escape.
  translate([63, 0, 15]) cube([5, 22.5, 10], center=true);
  // Cut out the mating surface for the Hopper Flange.
  translate([32, -40, 15]) cylinder(r1=20.75, r2=17.25, h=5, $fn=48, center=false);
  // Cut out the Body Halves.
  Body_Half ();
  rotate([0, 0, 180]) Body_Half ();
  // Cut out a mating surface for the toruses.
  translate([0, 75, 0]) Torus(40, 150);
  translate([0, -75, 0]) Torus(40, 150);
  // Cut out for the top cover of the body.
  translate([0, 75, 10]) cylinder(r1=59, r2=59.25, h=12.5, $fn=144);
  translate([0, -75, 10]) cylinder(r1=59, r2=59.25, h=12.5, $fn=144);
  // Cut out recesses for the Skirt screw bosses.
  for (i = [0:19]) {
    skirt_angle = i * 18 + 9;
    translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), 0])
      cylinder($fn=28, r=3, h=15); } 
  for (i = [0:19]) {
    skirt_angle = i * 18 + 9;
    translate([-72 * cos(skirt_angle), -75 + -72 * sin(skirt_angle), 0])
      cylinder($fn=28, r=3, h=15); } 
  // Cut screw holes for Skirt standoffs.
  for (i = [0:19]) {
    skirt_angle = i * 18 + 9;
    translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), -1])
      cylinder($fn=28, r=1.22, h=25); }
  for (i = [0:19]) {
    skirt_angle = i * 18 + 9;
    translate([-72 * cos(skirt_angle), -75 + -72 * sin(skirt_angle), -1])
      cylinder($fn=28, r=1.22, h=25); }
  // Drill through holes for the Hopper.
  translate([53, 0, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, 7.5, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, -7.5, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, 15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, -15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);

  translate([59.5, 15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([59.5, -15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);  
  
  translate([66.5, 15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([66.5, -15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);  
  
  translate([73, 0, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([73, 7.5, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([73, -7.5, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([73, 15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([73, -15, 10]) cylinder(r=1.22, h=20, $fn=28, center=true);
      
  
  } }
  
  //Hopper_Bracket();
