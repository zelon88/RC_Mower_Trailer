include <Center_Bracket.scad>;

// Define a module for creating torus' to aide in crafting the body.
module Torus(R1,R2) { 
  RA=R1 /2;
  RB=R2 /2 - R1/2 ;
  rotate_extrude(convexity = 10, $fn = 144) translate([RB, 0, 0]) circle(r = RA, $fn = 144); }

// Create the back torus.
difference() { 
  difference() {
    translate([0, 75, 0]) Torus(40, 150); 
    translate([0, 75, 0]) Torus(40, 140); 
    // Cut out for the center bracket.
    translate([0, 0, 2]) Center_Bracket (); }
  translate([0, 75, -20]) cylinder(r=150, h=20); }

// Top cover for back torus.
difference() {
  translate([0, 75, 18]) cylinder(r=62, h=3, $fn=144);
  // Cut out for the reinforcement slot.
  translate([0, 0, 16.59]) cube([25.6, 100, 3.175], center=true);
  // Cut out for the center bracket.
  translate([0, 0, 2]) Center_Bracket(); }

// Create the front torus.
difference() { 
  difference() {
    translate([0, -75, 0]) Torus(40, 150); 
    translate([0, -75, 0]) Torus(40, 140); 
    // Cut out for the center bracket.
    translate([0, 0, 2]) Center_Bracket (); }
  translate([0, -75, -20]) cylinder(r=150, h=20); }

// Top cover for front torus.
difference() {
  translate([0, -75, 18]) cylinder(r=62, h=3, $fn=144);
  // Cut out for the reinforcement slot.
  translate([0, 0, 16.59]) cube([25.6, 1000, 3.175], center=true);
  // Cut out for the center bracket.
  translate([0, 0, 2]) Center_Bracket(); }