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
// CURRENT VERSION DATE:  6/7/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
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
// 5. Install skirt screws from below through Body_Skirt and torus outer rim.
// 6. Install nuts on top of torus outer rim standoffs.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating torus' to aide in crafting the body.
include <Workfiles/Torus.scad>;
// A module for mating a 1" flange with 6 screw holes & 6mm through hole.
include <Workfiles/1_Inch_Flange_6mm_Hole.scad>
// A module for mating a 1" flange with 6 screw holes & no through hole.
include <Workfiles/1_Inch_Flange_No_Hole.scad>
// A module for creating the Center Bracket for crafting mating surfaces.
include <Center_Bracket.scad>;
// A module for creating the Body Stiffeners for crafting mating surfaces.
include <Body_Stiffeners.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Body_Half() { 
  // Create the torus.
  difference() { 
    difference() {
      translate([0, 75, 0]) Torus(40, 150); 
      translate([0, 75, 0]) Torus(40, 140); 
      // Cut out for the reinforcement slots.
      translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
      rotate([0, 0, 90]) translate([75, 0, 13.415]) cube([25.6, 150, 3.175], center=true);
      // Cut out for the center bracket.
      translate([0, 0, 0]) Center_Bracket (); 
      // Mounting holes for the center bracket.
      translate([20, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([8.75, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([0, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([-8.75, 14, 13]) cylinder($fn=28, r=1.22, h=15);
      translate([-20, 14, 13]) cylinder($fn=28, r=1.22, h=15); 
      // Through hole for planetary shaft.
      translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); 
      // Torus screw holes.
      translate([13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
      translate([23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
      translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
      translate([-13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
      translate([-23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
      translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true); }
      translate([0, 75, -20]) cylinder(r=150, h=20); 
      // Front Attachment Boss screw holes.
      translate([53, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([53, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([53, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([53, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([58, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([58, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([58, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([58, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([63, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([63, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([63, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([63, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      // Rear Attachment Boss screw holes.
      translate([-53, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-53, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-53, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-53, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-58, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-58, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-58, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-58, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-63, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-63, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-63, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-63, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      translate([-68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
      // Side Attachment Boss screw holes.
      translate([10, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([5, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([0, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([-5, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([-10, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([10, 137, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([-10, 137, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([10, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([5, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([0, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([-5, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      translate([-10, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
      // Skirt boss through-holes (20x) through torus outer rim wall.
      // r=72 = midpoint of skirt ring (r=70-75). Screws install from below, nuts on top.
      // 18deg spacing, offset 9deg to clear attachment boss (0/180deg) & rail slots (90/270deg).
      // h=22 spans from below skirt face (Z=-1) to above standoff tops (Z=21).
      for (i = [0:19]) {
        skirt_angle = i * 18 + 9;
        translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), -1])
          cylinder($fn=28, r=1.22, h=22); }     // Body Stiffener landing pads.
      translate([0, 40, 22.25]) rotate([0, 0, 180]) Body_Stiffener_Inner();
      translate([0, 110, 22.25]) Body_Stiffener_Outer(); }

  // Create the top cover for the torus.
  difference() {
    union() {
      // Main body of top cover.
      translate([0, 75, 16]) cylinder(r1=62, r2=57, h=4, $fn=144);
      // Create lower reinforcement.
      rotate([0, 0, 90]) translate([75, 0, 15.25]) cube([25.6, 140, 1.175], center=true); }
    // Cut out for the reinforcement slots.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    rotate([0, 0, 90]) translate([75, 0, 13.415]) cube([25.6, 150, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 0]) Center_Bracket();
    // Mounting holes for the center bracket.
    translate([20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([0, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-8.75, 14, 14]) cylinder($fn=28, r=1.22, h=9.2);
    translate([-20, 14, 14]) cylinder($fn=28, r=1.22, h=9.2); 
    // Front Attachment Boss screw holes.
    translate([53, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([53, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([53, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([53, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    // Rear Attachment Boss screw holes.
    translate([-53, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-53, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-53, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-53, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    // Side Attachment Boss screw holes.
    translate([10, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([5, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-5, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-10, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([10, 137, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-10, 137, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([10, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([5, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-5, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-10, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    // Center bracket support screw holes.
    translate([0, 50, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 40, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 30, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    // Inner Body Stiffener screw holes.
    translate([8, 50, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([8, 40, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([8, 30, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-8, 50, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-8, 40, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-8, 30, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    // Outer Body Stiffener screw holes.
    translate([40, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([32, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([32, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([24, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([24, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([24, 120, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([16, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([16, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([16, 120, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([8, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([8, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([8, 120, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([8, 135, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 120, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 135, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-40, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-32, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-32, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-24, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-24, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-24, 120, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-16, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-16, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-16, 120, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-8, 100, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-8, 110, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-8, 120, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-8, 135, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    // 1" flange mounting holes.
    rotate([0, 0, 90]) translate([75, 32.5, 15]) One_Inch_Flange_No_Hole();
    translate([0, 75, 15]) One_Inch_Flange_6mm_Hole();
    rotate([0, 0, 90]) translate([75, -32.5, 15]) One_Inch_Flange_No_Hole();
    // 1" flange landing pads.
    translate([32.5, 75, 20.4]) cylinder($fn=28, r1=12.75, r2=12.85, h=1, center=true);
    translate([0, 75, 20.4]) cylinder($fn=28, r1=12.75, r2=12.85, h=1, center=true);
    translate([-32.5, 75, 20.4]) cylinder($fn=28, r1=12.75, r2=12.85, h=1, center=true); 
    // Body Stiffener landing pads.
    translate([0, 40, 22.25]) rotate([0, 0, 180]) Body_Stiffener_Inner();
    translate([0, 110, 22.25]) Body_Stiffener_Outer(); }

  // Create the torus outside mating surface.
  difference() {
    translate([0, 10, 10]) cube([75, 20, 20], center=true); 
    // Cut out for the torus.
    translate([0, 75, 0]) Torus(40, 140); 
    // Cut out for the reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 0]) Center_Bracket (); 
    // Mounting holes for the center bracket.
    translate([20, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([0, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-20, 14, 10]) cylinder($fn=28, r=1.22, h=15); 
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true);
    // Torus screw holes.
    translate([13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true); }

  // Create the torus inside mating surface.
  difference() {
    translate([0, 12, 16]) cube([75, 15, 7], center=true); 
    // Cut out for the reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 0]) Center_Bracket (); 
    // Mounting holes for the center bracket.
    translate([20, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([0, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-20, 14, 10]) cylinder($fn=28, r=1.22, h=15); 
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true); 
    // Torus screw holes.
    translate([13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true); }

  // Create the mounting pad for the front attachment boss.
  difference() {
    translate([63, 75, 10]) cube([15, 28, 20], center=true);
    // Cut out the torus.
    translate([0, 75, 0]) Torus(40, 140);
    // Cut out for the reinforcement slot.
    rotate([0, 0, 90]) translate([75, 0, 13.415]) cube([25.6, 150, 3.175], center=true);
    // Cut screw holes for Skirt standoffs.
    for (i = [0:19]) {
      skirt_angle = i * 18 + 9;
      translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), -1])
        cylinder($fn=28, r=1.5, h=14); }
    // Front Attachment Boss screw holes.
    translate([53, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([53, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([53, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([53, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([58, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([63, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true); }

  // Create the mounting pad for the rear attachment boss.
  difference() {
    translate([-63, 75, 10]) cube([15, 28, 20], center=true);
    // Cut out the torus.
    translate([0, 75, 0]) Torus(40, 140);
    // Cut out for the reinforcement slot.
    rotate([0, 0, 90]) translate([75, 0, 13.415]) cube([25.6, 150, 3.175], center=true);
    // Cut screw holes for Skirt standoffs.
    for (i = [0:19]) {
      skirt_angle = i * 18 + 9;
      translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), -1])
        cylinder($fn=28, r=1.33, h=14); }
    // Rear Attachment Boss screw holes.
    translate([-53, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-53, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-53, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-53, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-58, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-63, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true); }

  // Create the mounting pad for the side attachment boss.
  difference() {
    translate([0, 137.5, 10]) cube([28, 15, 20], center=true);
    // Cut out the torus.
    translate([0, 75, 0]) Torus(40, 140);
    // Cut out for the reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    // Cut screw holes for Skirt standoffs.
    for (i = [0:19]) {
      skirt_angle = i * 18 + 9;
      translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), -1])
        cylinder($fn=28, r=1.5, h=14); }
    // Side Attachment Boss screw holes.
    translate([10, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([5, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-5, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-10, 132, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([10, 137, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-10, 137, 10]) cylinder($fn=28, r=1.22, h=15, center=false);  
    translate([10, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([5, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([0, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-5, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false);
    translate([-10, 142, 10]) cylinder($fn=28, r=1.22, h=15, center=false); }
    
  // Skirt attachment standoffs on torus outer rim (20x).
  // Small cylinders provide a flat nut seat above the curved torus surface.
  // Screws install from below through Body_Skirt; nuts seat on top of standoffs.
  // Same angular positions as skirt through-holes (18deg, offset 9deg).
  difference() {
    union() {
      for (i = [0:19]) {
        skirt_angle = i * 18 + 9;
        translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), 0])
          cylinder($fn=28, r=3, h=15); } }
    // Cut screw holes through standoffs.
    for (i = [0:19]) {
      skirt_angle = i * 18 + 9;
      translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), -1])
        cylinder($fn=28, r=1.22, h=22); }
    // Cut out for the reinforcement slot.
    rotate([0, 0, 90]) translate([75, 0, 13.415]) cube([30, 150, 3.175], center=true);
    // Create the torus outside mating surface.
    // Cut out for the torus.
    translate([0, 75, 0]) Torus(40, 140); 
    // Cut out for the reinforcement slot.
    translate([0, 0, 16.59]) cube([25.6, 300, 3.175], center=true);
    // Cut out for the center bracket.
    translate([0, 0, 0]) Center_Bracket (); 
    // Mounting holes for the center bracket.
    translate([20, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([0, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-8.75, 14, 10]) cylinder($fn=28, r=1.22, h=15);
    translate([-20, 14, 10]) cylinder($fn=28, r=1.22, h=15);    
    // Front Attachment Boss Screw Holes.
    translate([68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    // Rear Attachment Boss Screw Holes.
    translate([-68, 84, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 78, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 72, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    translate([-68, 66, 10]) cylinder($fn=28, r=1.22, h=20, center=true);
    // Through hole for planetary shaft.
    translate([0, 0, 0]) rotate([0, 0, 0]) cylinder($fn=64, r=3.03, h=100, center=true);
    // Torus screw holes.
    translate([13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-13.25, 0, 4]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-23.25, 0, 7]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true);
    translate([-33.25, 0, 8]) rotate([90, 0, 0]) cylinder($fn=28, r=1.22, h=40, center=true); } }

// Render the object. 
// Comment or uncomment as needed.
//Body_Half();
// ----------------------------------------------------------------------------------------------------
