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
  union() {
    // Create the wide flat plate that mates with both Body Halves & the Center Bracket.
    translate([57.5, 0, 15.25]) cube([40, 121.5, 9], center=true);
    // Create a mating surface for the Center Bracket on the X surface.
    translate([44, 0, 6.5]) cube([14, 121.5, 13], center=true);
    // Create the support braces for the Center Bracket support.
    translate([62.5, 20, 7.5]) cube([30, 2.5, 15], center=true);
    translate([62.5, 11, 7.5]) cube([30, 2.5, 15], center=true);
    translate([62.5, 3.5, 7.5]) cube([30, 2.5, 15], center=true);
    translate([62.5, -20, 7.5]) cube([30, 2.5, 15], center=true);
    translate([62.5, -11, 7.5]) cube([30, 2.5, 15], center=true);
    translate([62.5, -3.5, 7.5]) cube([30, 2.5, 15], center=true); }
  // Chamfer the front edge of the Hopper Bracket.
  translate([82.5, 0, 0]) rotate([0, 45, 0]) cube([25, 125, 25], center=true);
  translate([70, 0, -10]) rotate([0, 65, 0]) cube([25, 125, 25], center=true);
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
  
  // Drill through holes for the Center Bracket. 
  translate([53, 0, 8]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, 7.5, 8]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, -7.5, 8]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, 15, 8]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, -15, 8]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  
  translate([53, 0, 3]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, 7.5, 3]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, -7.5, 3]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, 15, 3]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  translate([53, -15, 3]) rotate([0, 90, 0]) cylinder(r=1.22, h=20, $fn=28, center=true);
  
  } }
  
 //Hopper_Bracket();
