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

// NAME:  Differential Output Yolk Cover
// REVISION:  A1
// START DATE:  7/20/2026
// CURRENT VERSION DATE:  7/20/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    The rotating cover that mates with the Differential_Output_Yolk drum.
//    Slips over the open face of the drum with 0.2mm radial clearance.
//    Outer radius is 2.5mm larger than the drum OD (r=8.5) giving r=11.0 (22mm OD).
//    Wall thickness is 2.3mm. The closed face carries the central support pin which
//    slides into the triple-stacked 3x5x2.5 bearings in the yolk drum. The pin is
//    added outside the main difference() block to prevent the inner bore subtraction
//    from removing it. Future additions: opposing trapezoid spring perch and 4 screw
//    slots that constrain the cover's rotational travel relative to the drum.
// FILE NAME: Differential_Output_Yolk_Cover.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Flip cover so closed face points down, pin pointing down into drum.
// 3. Slide pin into triple-stacked bearing hub in drum interior.
// 4. Align screw slots with drum cover screws.
// 5. Torque screws to preload springs and constrain axial movement.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Differential_Output_Yolk_Cover() {
  // Drum dimensions — must match Differential_Output_Yolk.scad.
  drum_r  = 8.5;   // Drum outer radius.
  drum_h  = 10;    // Drum height.

  // Cover dimensions.
  clearance     = 0.2;                     // Radial slip fit clearance over drum.
  cover_inner_r = drum_r + clearance;      // 8.7mm — clears drum OD.
  cover_outer_r = drum_r + 2.5;            // 11.0mm — 2.5mm larger than drum OD.
  cover_h       = drum_h;                  // Matches drum height.

  // Central support pin — slides into triple-stacked 3x5x2.5 bearings in the yolk drum.
  // Pin is added outside the main difference() so the inner bore does not subtract it.
  // The cover is flipped for installation; the Z=2 tip becomes the leading entry end.
  pin_r       = 1.5;   // Matches 3x5x2.5 bearing inner race ID.
  pin_h       = 7.5;   // Spans triple stacked bearings (3 x 2.5mm).
  pin_z       = 2;     // Z offset of pin base from cover bottom face.
  chamfer_h   = 0.5;   // Chamfer height on pin entry tip.

  // Cover shell — bore subtraction hollows the interior.
  difference() {
    cylinder($fn=96, r=cover_outer_r, h=cover_h, center=false);
    // Inner bore — open at Z=0 (entry side), leaves 1mm solid cap at Z=9 to Z=10.
    translate([0, 0, -1])
      cylinder($fn=96, r=cover_inner_r, h=cover_h, center=false); }

  // Opposing trapezoid spring perch — outside difference() to prevent bore from removing it.
  // rotate([0,90,0]) maps local Z → world X so the hull extends radially outward.
  // Far cube at local Z=6.3 → far edge at world X=7.3mm (0.2mm inside drum inner wall r=7.5mm).
  translate([0, 0, (cover_h / 2) - 0.5])
    rotate([0, 90, 0])
    hull() {
      cube([cover_h - 1, 1, 2], center=true);
      translate([0, 0, 6.3])
        cube([cover_h - 1, 7, 2], center=true); }

  // Central support pin with chamfered entry tip.
  // Built as cone (lead-in) + cylinder (body) — no subtraction needed.
  // When cover is flipped for installation, Z=pin_z becomes the leading tip.
  translate([0, 0, pin_z]) {
    // Lead-in chamfer — tapers from point at tip to full pin radius at chamfer_h.
    cylinder($fn=48, r1=0, r2=pin_r, h=chamfer_h, center=false);
    // Pin body — full radius from chamfer_h up to cap.
    translate([0, 0, chamfer_h])
      cylinder($fn=48, r=pin_r, h=pin_h - chamfer_h, center=false); } }

// Render the object.
// Comment or uncomment as needed.
//Differential_Output_Yolk_Cover();

// Render the object for printing.
// Comment or uncomment as needed.
Differential_Output_Yolk_Cover();
// ----------------------------------------------------------------------------------------------------
