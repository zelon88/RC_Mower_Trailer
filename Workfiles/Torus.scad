// Define a module for creating torus' to aide in crafting the body.
module Torus(R1,R2) { 
  RA=R1 /2;
  RB=R2 /2 - R1/2 ;
  rotate_extrude(convexity = 10, $fn = 144) translate([RB, 0, 0]) circle(r = RA, $fn = 144); }