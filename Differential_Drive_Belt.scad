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

// NAME:  Differential Drive Belt
// REVISION:  A1
// START DATE:  7/28/2026
// CURRENT VERSION DATE:  7/28/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Opus 5.
// DESCRIPTION:
//    A purchased GT2 closed loop belt, 6mm wide, modelled only so the drive can be seen
//    and checked in the assembly. Nothing here is printed.
//    It is drawn at the Center Bracket's actual centre distance of 30.8707mm rather than
//    at the distance the belt would prefer, because that is where it physically sits.
//    The belt's own teeth are not modelled. They would have to be indexed against both
//    pulleys' grooves to mean anything, and a plain band shows the routing and the
//    clearances just as well.
//    Sizing: at C=30.8707 a 38T/19T pair asks for 119.928mm of belt, so a stock 120mm
//    closed loop sits 0.036mm off and the ratio is exactly 2.000:1. See the note in the
//    geometry section about the 20T alternative, which is not as good a fit.
// FILE NAME: Differential_Drive_Belt.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// Not printed. Purchased: GT2 2mm pitch, 120mm closed loop (60 teeth), 6mm wide.
// Two per mower, one per damper.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Fit the belt over both pulleys before the motor is finally torqued to the bracket.
// 2. Check it sits square across both faces; the flanges will show up any misalignment.
// 3. Tension is set by the belt itself here. There is no adjuster, and none is needed at
//    0.036mm of slack, but do confirm the belt is not riding on a flange before running.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// GT2 2mm belt pulley geometry, shared with both pulleys so the radii cannot disagree.
include <Workfiles/GT2_Pulley.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// Pitch length of an open belt run, exact rather than the usual series approximation.
// phi is the angle from the centre line to the tangent point on either pulley.
function Belt_Pitch_Length(r1, r2, c) =
  let (phi = acos((r1 - r2) / c))
    2 * c * sin(phi) + r1 * (360 - 2 * phi) * PI / 180 + r2 * (2 * phi) * PI / 180;

module Differential_Drive_Belt(teeth1=38, teeth2=19, c=30.8707, belt_w=6, tooth_h=0.75, back_t=0.63) {
  // Radii are taken at the pulley OD, which is where the belt's land rides, and the
  // section is placed either side of it: the teeth sink tooth_h down into the grooves
  // and only back_t of backing stands proud. Drawing the full 1.38mm section outward
  // from the OD instead would put the belt's back 0.75mm too high, which on the motor
  // pulley leaves its flange looking 0.12mm proud of the belt when it is really 0.87.
  // The tooth region overlapping the pulley grooves in the render is engagement.
  r1 = GT2_2mm_OD(teeth1) / 2 - tooth_h;
  r2 = GT2_2mm_OD(teeth2) / 2 - tooth_h;
  belt_t = tooth_h + back_t;

  // The hull of two circles is bounded by those circles and their external tangents,
  // which is exactly the path a belt takes. Taking the difference of two such hulls,
  // one grown by the belt thickness, gives the band without tracing any tangent by hand.
  linear_extrude(height=belt_w)
    difference() {
      hull() {
        circle($fn=192, r=r1 + belt_t);
        translate([c, 0]) circle($fn=192, r=r2 + belt_t); }
      hull() {
        circle($fn=192, r=r1);
        translate([c, 0]) circle($fn=192, r=r2); } } }
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// RENDERING

// Render the object.
// Comment or uncomment as needed.
Differential_Drive_Belt();
// ----------------------------------------------------------------------------------------------------
