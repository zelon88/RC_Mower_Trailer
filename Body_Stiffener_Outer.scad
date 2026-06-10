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

// NAME:  Body Stiffener Outer
// REVISION:  A1
// START DATE:  6/7/2026
// CURRENT VERSION DATE:  6/10/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    Outer structural stiffener plate for the Body_Skirt assembly.
//    Features rounded outer corners for clearance and aesthetics.
//    Top face has angled lateral grooves converging at the center — left and right
//    halves angle inward at 8deg, meeting at X=0 to form a chevron pattern.
//    Consumed by Body_Skirt.scad as the outer stiffener module.
// FILE NAME: Body_Stiffener_Outer.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Align screw holes with Reinforcement Rail pattern before installing.
// 3. Orient grooved face toward skirt interior during assembly.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Body_Stiffener_Outer() {
  difference() {
    union() {
      // Create the main body of the outer stiffener.
      cube([30, 35, 5], center=true);
      // Create the rounded outer corners.
      translate([ 15, -17.5, 0]) cylinder($fn=28, r=35, h=5, center=true);
      translate([-15, -17.5, 0]) cylinder($fn=28, r=35, h=5, center=true); }
    // Cut out the hole for the Ball Joint Receiver.
    translate([0, -2.5, 0]) cylinder($fn=28, r1=12.85, r2=13.25, h=5, center=true);
    translate([0, -2.5, 1.5]) cylinder($fn=28, r1=12.9, r2=13.75, h=5, center=true);
    // Cut off the back of the rounded corners to create the flat rear edge.
    translate([0, -35, 0]) cube([100, 35, 5], center=true);
    // Reinforcement Rail screw hole recesses.
    translate([ 8,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 8,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 8, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-8, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    // Reinforcement Rail screw holes.
    translate([ 8,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-8, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    // Top Cover screw hole recesses.
    translate([ 16,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 16,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 16, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 24,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 24,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 24, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 32,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 32, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([ 40, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-16, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-24,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-24,  10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-24, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-32,   0, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-32, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    translate([-40, -10, 1.5]) cylinder($fn=28, r=2, h=2, center=true);
    // Top Cover screw holes.
    translate([ 16,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 16,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 24,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 24,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 24, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 32,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 32, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([ 40, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-16, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24,  10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-24, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-32,   0, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-32, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([-40, -10, 0]) cylinder($fn=28, r=1.22, h=10, center=true);
    // Angled lateral grooves on top face — 1.5mm wide x 1.5mm deep.
    // 7 grooves at 5mm spacing (Y=-15 to Y=15), split into left and right halves.
    // Left half rotated +13deg, right half -13deg — chevron pattern converging at X=0.
    // Centers at X=±22 with length 48mm covers the full rounded corner extension (~±46mm).
    // Overlap at center reduced to ~4mm for a clean chevron join without heavy bunching.
    // Cube h=3 centered at Z=2.5 cuts from Z=1.0 to Z=2.5 inside the part (1.5mm depth).
    for (y_pos = [-40, -35, -30, -25, -20, -15, -10, -5, 0, 5, 10, 15]) {
      translate([-26, y_pos, 2.5]) rotate([0, 0,  45]) cube([75, 1.5, 3], center=true);
      translate([ 26, y_pos, 2.5]) rotate([0, 0, -45]) cube([75, 1.5, 3], center=true); } } }

// Render the object.
// Comment or uncomment as needed.
//Body_Stiffener_Outer();

// Render the object for printing.
// Comment or uncomment as needed.
//Body_Stiffener_Outer();
// ----------------------------------------------------------------------------------------------------
