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

// NAME:  Body
// REVISION:  A1
// START DATE:  11/22/2021
// CURRENT VERSION DATE:  5/24/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    The main body torus structure for the mower assembly.
// FILE NAME: Body.scad

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// [Manufacturing instructions to be added]

// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

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
    // Cut out for the reinforcement slot.
    translate([0, 0, 20.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 4]) Center_Bracket (); }
  translate([0, 75, -20]) cylinder(r=150, h=20); }

// Top cover for back torus.
difference() {
  translate([0, 75, 16]) cylinder(r=61, h=4, $fn=144);
  // Cut out for the reinforcement slot.
  translate([0, 0, 20.59]) cube([25.6, 300, 3.175], center=true);
  // Cut out for the center bracket.
  translate([0, 0, 4]) Center_Bracket(); }

// Create the front torus.
difference() { 
  difference() {
    translate([0, -75, 0]) Torus(40, 150); 
    translate([0, -75, 0]) Torus(40, 140); 
    // Cut out for the reinforcement slot.
    translate([0, 0, 20.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 4]) Center_Bracket (); }
  translate([0, -75, -20]) cylinder(r=150, h=20); }

// Top cover for front torus.
difference() {
  translate([0, -75, 16]) cylinder(r=61, h=4, $fn=144);
  // Cut out for the reinforcement slot.
  translate([0, 0, 20.59]) cube([25.6, 300, 3.175], center=true);
  // Cut out for the center bracket.
  translate([0, 0, 4]) Center_Bracket(); }

// ----------------------------------------------------------------------------------------------------
