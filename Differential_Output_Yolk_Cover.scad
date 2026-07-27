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
// REVISION:  A6
// START DATE:  7/20/2026
// CURRENT VERSION DATE:  7/27/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Opus 5.
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
// MODULES

// A module for creating bearings.
include <Workfiles/Bearings.scad>;
// Shared roller and race profiles, held in common with the yolk so both halves agree.
include <Workfiles/Filleted_Frustum.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Differential_Output_Yolk_Cover() {
  // Drum dimensions — must match Differential_Output_Yolk.scad.
  drum_r  = 8.5;   // Drum outer radius.
  drum_h  = 9;    // Drum height.

  // Cover dimensions.
  clearance     = 0.2;                     // Radial slip fit clearance over drum.
  cover_inner_r = drum_r + clearance;      // 8.7mm — clears drum OD.
  cover_outer_r = drum_r + 2.5;            // 11.0mm — 2.5mm larger than drum OD.
  outer_face_h  = 2;                       // Chamfer/outer hub height — must match yolk's outer_face_h.
  cover_h       = drum_h + outer_face_h;   // 12mm — matches yolk total height (drum + outer hub).

  // Central support pin — slides into triple-stacked 3x5x2.5 bearings in the yolk drum.
  // Pin is added outside the main difference() so the inner bore does not subtract it.
  // The cover is flipped for installation; the Z=2 tip becomes the leading entry end.
  pin_r       = 1.5;   // Matches 3x5x2.5 bearing inner race ID.
  pin_h       = cover_h - 1;  // Reaches cap inner face — bore stops at Z=cover_h-1=9.
  pin_z       = 0;     // Pin starts at open face — engages bearing hub immediately on assembly.
  chamfer_h   = 0.5;   // Chamfer height on pin entry tip.
  shoulder_r = pin_r + 0.375;
  shoulder_h = 0.1;

  // Arc slot parameters — matched to yolk cover screw positions.
  r_screw  = 5.25;  // Radial position — matches yolk screws at X=±5.25, Y=0.
  slot_r   = 1.22;  // Slot minor radius — project standard clearance hole.
  arc_half = 15;    // ±15deg gives 30deg total travel, centered on neutral position.

  // Cover shell.
  // The chamfer at the open end (Z=0) is built via intersection rather than
  // subtracting a centered cone — a subtracted cone only ever widens the bore
  // from the inside and can't reduce the OD, and the previous attempt left the
  // rim feathered to a zero-thickness knife edge instead of a real bevel.
  difference() {
    intersection() {
      // Raw stock — defines the true OD everywhere.
      cylinder($fn=96, r=cover_outer_r, h=cover_h, center=false);
      union() {
        // Full OD for everything above the chamfer zone.
        translate([0, 0, outer_face_h])
          cylinder($fn=96, r=cover_outer_r + 1, h=cover_h, center=false);
        // Chamfer at open end of cover drum — mirrors yolk outer hub chamfer.
        // OD tapers from cover_outer_r-outer_face_h at Z=0 (open tip) up to the
        // full cover_outer_r by Z=outer_face_h — reduced at the free end, full
        // diameter toward the main body, matching the yolk's taper direction.
        cylinder($fn=96, r1=cover_outer_r - outer_face_h, r2=cover_outer_r, h=outer_face_h, center=false);
      }
    }
    // Inner bore — open at Z=0 (entry side), leaves 1mm solid cap at Z=cover_h-1 to Z=cover_h.
    translate([0, 0, -1])
      cylinder($fn=96, r=cover_inner_r, h=cover_h, center=false);

    // Roller bearing outer race, the outer half of the race the yolk cuts the inner
    // half of. The frustum's fat end sits at Z=5.9875, which places it at world Z=4.0
    // once the cover is flipped onto the drum, coincident with the yolk's fat end so
    // the two halves of the race register against each other and the roller sits square.
    // That is also the end the installation hole feeds, and the end the yolk's notch
    // opens onto, so a roller dropped down the hole lands in the widest section.
    // Cut depth is 1.55mm at the fat end against 1.35mm at the thin end, leaving at
    // least 0.75mm of the 2.3mm cover wall standing outboard of the race.
    // The tool is turned end for end with rotate rather than mirror, because a
    // reflection inverts the profile's winding.
    // ramp_h is longer here than on the yolk's race to hold a similar mouth angle
    // against a cut roughly four times as deep.
    translate([0, 0, 5.9875]) rotate([180, 0, 0])
      Race_Groove(base_r=cover_inner_r, fat_r=cover_inner_r + 1.55, thin_r=cover_inner_r + 1.35, race_h=3.575, ramp_h=1.5, run_h=1, back_r=cover_inner_r - 1, fillet_r=0.15, fn=96);
    // Roller bearing installation hole through cap — for inserting rollers into race.
    // Hole radius = (roller_r2*2 + 0.05) / 2 = 1.025mm — just clears large end of roller.
    // Height is set so the hole bottoms out level with the race mouth at Z=5.9875,
    // leaving no blind ledge for a roller to hang up on partway down. Holding the
    // center fixed means the height gains twice the depth added at the bottom, and
    // the surplus simply overshoots the cap face for a clean boolean.
    rotate([0, 0, 90])
      translate([9.225, 0, cover_h - 2.25])
        cylinder($fn=96, r=1.025, h=5.525, center=true);
    // Arc slot through cap at 180° — mates with yolk screw at X=-5.25, Y=0.
    // hull() of spheres at 2deg intervals traces the arc. Single sphere row at cap Z=9.5.
    hull() {
      for (a = [-arc_half : 2 : arc_half]) {
        rotate([0, 0, 180 + a]) translate([r_screw, 0, cover_h - 0.5])
          sphere(r=slot_r, $fn=28); } }
    // Trapezoid slot also cuts through cap at 0° — continuous path with trapezoid cut below.
    hull() {
      for (a = [-arc_half : 2 : arc_half]) {
        rotate([0, 0, a]) translate([r_screw, 0, cover_h - 0.5])
          sphere(r=slot_r, $fn=28); } } }

  // Opposing trapezoid spring perch — outside main difference() to prevent bore removal.
  // Wrapped in its own difference() to trim corners using yolk drum inner geometry.
  // The hull far cube corners reach r≈8.09mm (X=7.3, Y=±3.5), which protrudes into
  // the yolk drum wall (inner r=7.5mm). Cookie cutter centered at Z=0 with center=true
  // spans the full trapezoid height (Z=0 to Z=9), removing the step from the previous
  // partial-coverage translate.
  difference() {
    translate([0, 0, (cover_h / 2) + 0.5])
      rotate([0, 90, 0])
      hull() {
        cube([cover_h - 1, 1, 2], center=true);
        translate([0, 0, 6.7])
          cube([cover_h - 1, 7, 2], center=true); }

    // Upper Spring perch recesses.
    translate([4.5, 2.825, 3.25]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4.5, -2.825, 3.25]) rotate([0, 90, 65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    // Lower Spring perch recesses.
    translate([4.5, 2.825, 7.375]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4.5, -2.825, 7.375]) rotate([0, 90, 65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);

    // Cookie cutter — centered at Z=0 with center=true spans full cover height.
    // Outer corners of wide cube reach r≈8.09mm (X=7.7, Y=±3.5) — cookie cutter
    // at drum_inner_r - 0.1 = 7.4mm trims them cleanly, matching yolk corner treatment.
    difference() {
      cube([400, 400, cover_h * 3], center=true);
      cylinder($fn=96, r=drum_r - 1 - 0.1, h=cover_h * 3 + 2, center=true); }
    // Relief on narrow (inner) face — clears pin (r=1.5mm) and bearing hub wall.
    // Bearing OD=5mm (r=2.5mm) + ~1mm hub wall = hub outer r≈3.5mm. Relief at 3.6mm.
    // translate([0,0,-1]) with center=false spans Z=-1 to Z=11 — covers full trapezoid height.
    translate([0, 0, -1])
      cylinder($fn=48, r=3.375, h=cover_h + 1, center=false);
    // Arc slot through trapezoid and cap at 0° — 1deg step cylinders create continuous curved slot.
    // Cylinders at r=slot_r overlap at every step (chord=0.09mm < slot_r=1.22mm).
    // Full height h=cover_h+1 cuts through trapezoid AND cap in one pass.
    for (a = [-arc_half : 1 : arc_half]) {
      rotate([0, 0, a]) translate([r_screw, 0, -1])
        cylinder($fn=28, r=slot_r, h=cover_h + 1, center=false); } }

  // Central support pin with chamfered entry tip.
  // pin_z=0 so the pin starts at the open face and engages the bearing hub immediately.
  // Built as cone (lead-in) + cylinder (body) — no subtraction needed.
  translate([0, 0, pin_z]) {
    // Lead-in chamfer — tapers from point at tip to full pin radius at chamfer_h.
    cylinder($fn=48, r1=0, r2=pin_r, h=chamfer_h, center=false);
    // Pin body — full radius from chamfer_h up to cap.
    translate([0, 0, chamfer_h])
      cylinder($fn=48, r=pin_r, h=pin_h - chamfer_h, center=false);
    // Small shoulder for spacing the Cover away from the edge of the Output Yolk.
    translate([0, 0, pin_z - (-pin_h + shoulder_h)])
      cylinder($fn=48, r=shoulder_r, h=shoulder_h, center=false); } }

// Render the object.
// Comment or uncomment as needed.
//Differential_Output_Yolk_Cover();

// Render the object for printing.
// Comment or uncomment as needed.
//Differential_Output_Yolk_Cover();
// ----------------------------------------------------------------------------------------------------
