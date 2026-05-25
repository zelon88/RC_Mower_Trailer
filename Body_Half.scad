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

// NAME:  Body Half
// REVISION:  A1
// START DATE:  11/22/2021
// CURRENT VERSION DATE:  5/25/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    The main body torus structure for the mower assembly.
//    This part is 150mm x 150mm, the largest my printer can hold.
// FILE NAME: Body_Half.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Make studs by installing extra long screws and cutting off the heads.
// 3. Use studs, washers, lock-washers & locknuts for torus-to-torus bolts.
// 4. Countersink torus-to-torus through-holes so hardware sits flush.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating torus' to aide in crafting the body.
include <Workfiles/Torus.scad>;
// A module for creating the Center Bracket for crafting mating surfaces.
include <Center_Bracket.scad>;

module Body_Half() { 
  // Create the back torus.
  difference() { 
    difference() {
      translate([0, 75, 0]) Torus(40, 150); 
      translate([0, 75, 0]) Torus(40, 140); 
      // Cut out for the reinforcement slot.
      translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
      // Cut out for the center bracket.
      translate([0, 0, 0]) Center_Bracket (); 
      // Mounting holes for Center_Bracket.
      translate([20, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([8.75, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([0, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([-8.75, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([-20, 14, 13]) cylinder($fn=28, r=1.22, h=15); 
      // Through hole for planetary shaft.
      translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); 
      // Torus screw holes.
    translate([13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true); }
    translate([0, 75, -20]) cylinder(r=150, h=20); }

  // Top cover for back torus.
  difference() {
    translate([0, 75, 16]) cylinder(r1=62, r2=57, h=4, $fn=144);
    // Cut out for the reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 0]) Center_Bracket();
    // Mounting holes for Center_Bracket.
    translate([20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([0, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2); }

  // Create the back torus outside mating surface.
  difference() {
    translate([0, 10, 10]) cube([75, 20, 20], center=true); 
    // Cut out for the torus.
    translate([0, 75, 0]) Torus(40, 140); 
    // Cut out for the reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 0]) Center_Bracket (); 
    // Mounting holes for Center_Bracket.
    translate([20, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([0, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-20, 14, 10]) cylinder($fn=28, r=1.22, h=15); 
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true);
    // Torus screw holes.
    translate([13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true); }

  // Create the back torus inside mating surface.
  difference() {
    translate([0, 12, 16]) cube([75, 15, 7], center=true); 
    // Cut out for the reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 0]) Center_Bracket (); 
    // Mounting holes for Center_Bracket.
    translate([20, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([0, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-20, 14, 10]) cylinder($fn=28, r=1.22, h=15); 
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); 
    // Torus screw holes.
    translate([13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true);
    translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=20, r=1.22, h=40, center=true); } }

// Render the object. 
// Comment or uncomment as needed.
//Body_Half();
// ----------------------------------------------------------------------------------------------------
