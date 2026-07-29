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
// REVISION:  B3
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
// GT2 2mm belt pulley geometry, shared with the motor drive pulley.
include <Workfiles/GT2_Pulley.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Differential_Output_Yolk_Cover() {
  // Drum dimensions — must match Differential_Output_Yolk.scad.
  drum_r  = 8.5;   // Drum outer radius.
  drum_h  = 10.5;    // Drum height.

  // Cover dimensions.
  clearance     = 0.2;                     // Radial slip fit clearance over drum.
  cover_inner_r = drum_r + clearance;      // 8.7mm — clears drum OD.
  cover_outer_r = drum_r + 2.5;            // 11.0mm — 2.5mm larger than drum OD.
  outer_face_h  = 0.5;                       // Chamfer/outer hub height — must match yolk's outer_face_h.
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
  slot_r   = 1.72;  // Slot minor radius — yolk boss OD 1.65 plus 0.07 running clearance.
  arc_half = 15;    // ±15deg gives 30deg total travel, centered on neutral position.

  // Belt drive. 38T against a 19T motor pulley on a 120mm GT2 belt gives exactly 2.000:1
  // and asks for a 30.9083mm centre distance, which is 0.0376mm off what the Center
  // Bracket fixes at 30.8707mm — around a tenth of a percent of belt length, and inside
  // what ordinary belt tension absorbs. 38T is not a free choice either: below it the
  // groove roots break into the bearing race beneath, and above 40 the pulley fouls the
  // 540 can, so the pair that lands a stock belt on this bracket is nearly forced.
  belt_teeth = 38;
  belt_w     = 6;                              // Stock GT2 face width. 5mm is not made.
  pulley_r   = GT2_2mm_OD(belt_teeth) / 2;     // 11.84219mm.

  // Belt flanges. The toothed band stands proud of the cover on BOTH sides, so without
  // these the belt is free to walk off in either direction; nothing about the chamfer
  // step registers it. Radius is set by the 540 can, not by the belt: the textbook
  // flange of pulley OD + 1.5mm would foul the can by 0.526mm at the bracket's centre
  // distance. 12.6 keeps 0.216mm off the can and still stands 0.128mm above the belt's
  // back, which is what actually stops the belt climbing out.
  flange_r   = 12.6;
  flange_w   = 0.5;
  flange_ch  = 0.25;                           // Edge break on each flange's outer face.
  belt_clr   = 0.125;                          // Side clearance; belts run slightly wide.
  face_w     = belt_w + belt_clr;              // Toothed face between the flange walls.

  // Axial position of the whole pulley, measured to the outer face of the inboard
  // flange. Everything else on the pulley is derived from it, so clearing the Clippings
  // Exhaust Header is a single edit here rather than four coordinated ones.
  // -2.0125 hangs the pulley past the cover's open end, which is what it takes to bring
  // the belt plane inboard to world Y 21.5 on the damper at Y+30. The motor shaft
  // protrudes only 7.0mm past the bracket upright, so nothing carried on it reaches past
  // world Y 24.5, and the belt plane has to come to the shaft rather than the reverse.
  // The face grows outboard from here, so belt_clr is spent past the shaft tip rather
  // than against the bracket upright. The inboard flange holds its 0.5mm off the plate
  // whatever the face width, and the motor pulley's bore still grips 6.5mm of shaft.
  pulley_z   = -2.0125;
  pulley_h   = flange_w + face_w + flange_w;   // 7.125mm overall.

  // Cover shell.
  // The chamfer at the open end (Z=0) is built via intersection rather than
  // subtracting a centered cone — a subtracted cone only ever widens the bore
  // from the inside and can't reduce the OD, and the previous attempt left the
  // rim feathered to a zero-thickness knife edge instead of a real bevel.
  difference() {
    union() {
    // Belt pulley blank. A raised band rather than growing the whole cover, so the
    // extra diameter is only paid for where teeth are actually cut.
    translate([0, 0, pulley_z + flange_w])
      cylinder($fn=96, r=pulley_r, h=face_w, center=false);
    // Inboard belt flange. With pulley_z negative this now stands past the drum's open
    // end rather than sitting on the chamfer, so the chamfer survives, buried under the
    // toothed band. The edge break is carried on the flange's own outer face.
    translate([0, 0, pulley_z])
      cylinder($fn=96, r1=flange_r - flange_ch, r2=flange_r, h=flange_ch, center=false);
    translate([0, 0, pulley_z + flange_ch])
      cylinder($fn=96, r=flange_r, h=flange_w - flange_ch, center=false);
    // Outboard belt flange.
    translate([0, 0, pulley_z + flange_w + face_w])
      cylinder($fn=96, r=flange_r, h=flange_w - flange_ch, center=false);
    translate([0, 0, pulley_z + pulley_h - flange_ch])
      cylinder($fn=96, r1=flange_r, r2=flange_r - flange_ch, h=flange_ch, center=false);
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
    } }
    // GT2 teeth. Cut after the blank is unioned on, so the grooves are taken out of the
    // raised band rather than out of raw stock that later gets clipped.
    // 38 teeth is boxed in from both sides by the rest of the machine: fewer than 38 and
    // the groove roots break into the bearing race beneath, more than 40 and the pulley
    // fouls the 540 can at the bracket's fixed 30.8707mm centre distance.
    // The cutter is confined to the toothed face and given only enough overshoot to
    // break out cleanly at each end. Run at the module's default it would reach 0.5mm
    // past the face and cut straight through the inboard flange.
    translate([0, 0, pulley_z + flange_w])
      GT2_2mm_Teeth(teeth=belt_teeth, face_w=face_w, overshoot=0.02, fn=96);
    // Inner bore. It has to start below the pulley, not at the drum's own open end:
    // with pulley_z negative the pulley band hangs past that end, and the band is a
    // solid cylinder, so any part of it the bore does not reach would be left filled in
    // and would foul the yolk's outer hub. Top stays put, leaving the 1mm cap.
    translate([0, 0, min(-1, pulley_z - 1)])
      cylinder($fn=96, r=cover_inner_r, h=cover_h - 1 - min(-1, pulley_z - 1), center=false);

    // Roller bearing outer race. A cone sharing one apex on the drum axis with the yolk's
    // inner race, which is what makes the pair a true conical roller bearing. Z=5.9875
    // places the race's start at world Z=4 once the cover is flipped onto the drum, so
    // both halves of the race register against each other along their whole length.
    // The apex sits below the assembly, so the gap widens toward world Z=7.575 and this
    // cover is preloaded by being drawn upward — the direction the clamping screws pull
    // against the yolk's standoff bosses.
    // Cut depth runs 1.1990mm at that end to 1.4029mm at the rib, leaving at least
    // 0.897mm of the 2.3mm cover wall standing outboard of the race.
    // race_h ends the cone at Z=7.52263 in world terms, 0.05mm above the roller's fat
    // end face, and rib_r then steps the bore in to 9.60 to form the locating rib.
    // Without it the roller has nothing fixing its position along its own axis: with all
    // three cones sharing an apex it fits equally well anywhere along that axis, simply
    // sitting at a different radius. Under load it climbs toward its fat end, so the rib
    // goes just beyond that end and catches 0.500mm of the face, about 30% of the face
    // diameter. The rib sits on this part rather than the yolk because nothing has to
    // slide past it here; on the yolk it would have to clear this cover's 8.7mm bore
    // during assembly, which would cap it at roughly half the engagement.
    // Axial load on it is light, under 1% of the radial contact force.
    // Nominal clearance against the roller is zero. Print tolerance is taken up by boss
    // length rather than a designed-in gap, so the cover must be backed off before the
    // rollers will pass through the installation hole.
    // The tool is turned end for end with rotate rather than mirror, because a
    // reflection inverts the profile's winding.
    // ramp_h is longer here than on the yolk's race to hold a similar mouth angle
    // against a cut roughly six times as deep.
    translate([0, 0, 5.9875]) rotate([180, 0, 0])
      Race_Groove(base_r=cover_inner_r, r_start=9.89897, r_end=10.10290, race_h=3.52263, ramp_h=1.5, run_h=1, back_r=cover_inner_r - 1, fillet_r=0.15, rib_r=9.60, rib_h=0.5, fn=96);
    // Roller bearing installation hole through cap, for inserting rollers into the race.
    // Collinear with a seated roller, so it leans 3.037 degrees out from the drum axis
    // exactly as the rollers do. A hole left parallel to the drum axis would jam the
    // roller partway in, because a roller enters along its own leaning axis.
    // It starts at Z=5.9875, level with the race mouth, so a roller runs straight out of
    // the hole and onto the race with no blind ledge to hang up on. Length overshoots the
    // cap face for a clean boolean.
    // Radius is the roller's fat end (0.84375) plus 0.03 clearance.
    rotate([0, 0, 90])
      translate([9.072018, 0, 5.9875])
        rotate([0, -3.03675, 0])
          cylinder($fn=96, r=0.87375, h=6, center=false);
    // Arc slots through the cap at 0 and 180 degrees, mating with the yolk bosses at
    // X=±5.25. Swept cylinders at 1 degree steps rather than a hull of spheres: a sphere
    // hull is a lens in section, so its width falls off toward each cap face and it
    // cannot pass a straight boss. A swept cylinder holds full width through the whole
    // cap thickness, which is what a boss sliding in the slot requires.
    // Full height means the sweep also clears anything at these angles further down the
    // bore, where the cover is hollow anyway, so nothing is lost by running it through.
    for (a = [-arc_half : 1 : arc_half]) {
      rotate([0, 0, a]) translate([r_screw, 0, -1])
        cylinder($fn=96, r=slot_r, h=cover_h + 2, center=false);
      rotate([0, 0, 180 + a]) translate([r_screw, 0, -1])
        cylinder($fn=96, r=slot_r, h=cover_h + 2, center=false); } }

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
        cube([cover_h - 1, 2.5, 2], center=true);
        translate([0, 0, 6.7])
          cube([cover_h - 1, 8.5, 2], center=true); }

    // Upper Spring perch recesses.
    translate([4, 3.575, 3.25]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4, -3.575, 3.25]) rotate([0, 90, 65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    // Lower Spring perch recesses.
    translate([4, 3.575, 7.375]) rotate([0, 90, -65])
      cylinder($fn=96, r=2.02, h=0.325, center=true);
    translate([4, -3.575, 7.375]) rotate([0, 90, 65])
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
