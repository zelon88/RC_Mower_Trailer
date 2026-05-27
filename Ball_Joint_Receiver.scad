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

// NAME:  Ball Joint Receiver
// REVISION:  A1
// START DATE:  5/26/2026
// CURRENT VERSION DATE:  5/27/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:  
//    A cylindrical cup ball joint receiver that houses a 10mm ball joint.
//    Features a flange with mounting holes and integrated endcap.
// FILE NAME: Ball_Joint_Receiver.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Install ball joint ball into cup. Then install hardware. Then install cup.
// 3. Endcap can be shimmed to adjust friction.
// 4. A Bic "Round Stic" pen can be cut to length & used as a spacer.
// 5. If using as a ball joint, a stud can be created by securing the screw with 
//   thread-locker, then cutting off the head of the screw.
// 6. After ball & stud installation; use heat-shrink tubing to create a dust boot.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// Bearing dimensions (metric conversions).
bearing_shaft_id = 8.5;      // 8.5mm ID.
body_od = 13;      // 13mm OD.
bearing_width = 10;   // 10mm width.

// Flange dimensions.
flange_od = 25.4;       // 1" OD.
flange_thickness = 3;   // 3mm thick.
cup_depth = 14;          // Cup depth to hold bearing.

module Ball_Joint_Receiver () { 

  // Cup body with integrated caps.
  difference() {
    union() {
      // Main cylindrical cup.
      cylinder($fn=96, r=body_od/2 + 1, h=cup_depth);
      // Integrated cap at top.
      translate([0, 0, cup_depth]) cylinder($fn=96, r=body_od/2 + 1, h=flange_thickness); }
    // Hollow interior for bearing.
    translate([0, 0, flange_thickness + cup_depth / 2]) sphere($fn=96, r=bearing_width/2);
    // Center hole through top cap for bearing ID clearance.
    translate([0, 0, cup_depth - 1.5]) cylinder($fn=96, r1=bearing_shaft_id/2, r2=bearing_shaft_id/2 + 2.5, h=flange_thickness + 1.5); 
    // Center hole through bottom half of body for bearing ID clearance.
    cylinder($fn=96, r=body_od/2 - 1, h=flange_thickness + cup_depth / 2); }

  // Tapered reinforcement ribs (6x, between screw holes).
  // Each rib spans from the top of the flange to the top of the integrated cap.
  // Wide and deep at the base (full flange width), narrow at the top (cup wall only).
  cup_r_outer    = body_od/2 + 1;           // Outer radius of cup body (7.5 mm).
  rib_base_depth = flange_od/2 - cup_r_outer;  // Radial depth at base (~5.2 mm, flange edge to cup wall).
  rib_top_depth  = 2;                          // Radial depth at top (mm).
  rib_base_width = 3.5;                        // Tangential width at base (mm).
  rib_top_width  = 1.5;                        // Tangential width at top (mm).

  for (i = [0:5]) {
    rib_angle = i * 60 + 30;                   // Midway between each pair of screw holes.
    difference() {
      rotate([0, 0, rib_angle]) hull() {
        // Wide base sitting on top of the flange.
        translate([cup_r_outer + rib_base_depth/2, 0, flange_thickness]) cube([rib_base_depth, rib_base_width, 0.01], center=true);
        // Narrow tab at the very top of the part (top of integrated cap).
        translate([cup_r_outer + rib_top_depth/2, 0, cup_depth + flange_thickness]) cube([rib_top_depth, rib_top_width, 0.01], center=true); }
      // Center hole through bottom half of body for bearing ID clearance.
      translate([0, 0, 0]) cylinder($fn=96, r=body_od/2 - 1, h=flange_thickness + cup_depth / 2); } }

  // Flange.
  difference() {
      // Main flange plate.
      translate([0, 0, 0]) cylinder($fn=96, r=flange_od/2, h=flange_thickness);
      // Six mounting holes spaced evenly around flange.
      for(i = [0:5]) {
          angle = i * 60;  // 360/6 = 60 degrees.
          radius = flange_od/2 - 3;  // Holes in middle of flange width.
          translate([radius * cos(angle), radius * sin(angle), -1]) cylinder($fn=20, r=1.25, h=flange_thickness + 2); } 
      // Center hole through bottom half of body for bearing ID clearance.
      translate([0, 0, 0]) cylinder($fn=96, r=body_od/2 - 1, h=flange_thickness + cup_depth / 2); } 

  // Add a lip for attaching a boot.
  difference() {
    union() {
      translate([0, 0, flange_thickness  + cup_depth - 2]) cylinder($fn=96, r1=body_od/2 + 1, r2=body_od/2 + 3.15, h=2.15);
      translate([0, 0, flange_thickness  + cup_depth]) cylinder($fn=96, r1=body_od/2 + 3.25, r2=body_od/2 + 3.35, h=0.25); }
    translate([0, 0, flange_thickness  + cup_depth - 2]) cylinder($fn=96, r1=body_od/2, r2=body_od/2 + 0.3, h=2.4); } }

module Ball_Joint_Receiver_Cap() {

  difference() {
    // Create the bottom surface of the cap.
    cylinder($fn=96, r=body_od/2 - 1, h=flange_thickness + cup_depth / 2);
    // Cut out the sphere on top.
    translate([0, 0, flange_thickness + cup_depth / 2]) sphere($fn=96, r=bearing_width/2);
    // Cut out a lubrication pocket.
    translate([0, 0, flange_thickness + cup_depth / 2 - (bearing_width/2)]) cylinder($fn=96, r1=1.25, r2=2, h=0.5); } 
  // Add a resting pad in the center of the lubrication pocket.
  // This feature can be sanded or filed smooth to adjust the friction of the joint.
  // Also this can be drilled out and used with a small screw for adjustable tension.
  translate([0, 0, flange_thickness + cup_depth / 2 - (bearing_width/2)]) cylinder($fn=96, r1=0.6, r2=0.5, h=0.2); }

// Render the object. 
// Comment or uncomment as needed.
//Ball_Joint_Receiver();
//Ball_Joint_Receiver_Cap();

// Render the object for printing.
Ball_Joint_Receiver();
translate([30, 0, 0]) Ball_Joint_Receiver_Cap();
// ----------------------------------------------------------------------------------------------------