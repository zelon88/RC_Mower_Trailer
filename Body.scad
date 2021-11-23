// Define a module for creating torus' to aide in crafting the body.
module Torus(R1,R2) { 
  RA=R1 /2;
  RB=R2 /2 - R1/2 ;
  rotate_extrude(convexity = 10, $fn = 144) translate([RB, 0, 0]) circle(r = RA, $fn = 144); }

// Create the back torus.
difference() { 
  difference() {
    translate([0, 75, 0]) Torus(40, 150); 
    translate([0, 75, 0]) Torus(40, 140); }
  translate([0, 75, -20]) cylinder(r=150, h=20); }

// Create the front torus.
difference() { 
  difference() {
    translate([0, -75, 0]) Torus(40, 150); 
    translate([0, -75, 0]) Torus(40, 140); }
  translate([0, 
    -75, -20]) cylinder(r=150, h=20); }

// Create the center bracket.
translate([0, 0, 10]) cube([100, 35, 20], center=true);
    
translate([0, 13.5, 40]) cube([100, 8, 50], center=true);
translate([0, -13.5, 40]) cube([100, 8, 50], center=true);