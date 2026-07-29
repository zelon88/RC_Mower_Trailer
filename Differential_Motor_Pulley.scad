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

// NAME:  Differential Motor Pulley
// REVISION:  A2
// START DATE:  7/27/2026
// CURRENT VERSION DATE:  7/27/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Opus 5.
// DESCRIPTION:
//    The 19 tooth GT2 drive pulley on the 540 motor armature shaft. Runs against the 38
//    tooth pulley cut into the Differential Output Yolk Cover on a 120mm belt, giving
//    exactly 2.000:1 and asking a 30.9083mm centre distance against the 30.8707mm the
//    Center Bracket fixes. That 0.0376mm is a tenth of a percent of belt length and
//    disappears into ordinary belt tension.
//    Its size is not a free choice. The cover pulley cannot go below 38 teeth without
//    its groove roots breaking into the bearing race beneath, and cannot go above 40
//    without fouling the 540 can, so the pairing that lands nearest 2:1 on a stock belt
//    length picks this part's tooth count for it.
//    The pulley is 7.125mm long: a 6.125mm toothed face with a flange either side,
//    mirroring the cover pulley. It sits 0.5mm clear of the motor's front face and
//    overhangs the end of the armature shaft by 0.625mm, still gripping 6.5mm of the
//    7.0mm available. The face carries 0.125mm of side clearance on a 6mm belt.
//    Unlike the cover's flanges, which the 540 can pinches down to barely clearing the
//    belt's back, these have room to stand a full 1.5mm over the pulley OD.
// FILE NAME: Differential_Motor_Pulley.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// Print on end, bore vertical, so the tooth flanks are laid down as walls rather than as
// stacked layer edges. No supports. Two per mower.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr the bore and clear the first layer's elephant foot from the hub face.
// 2. Test the bore on the flatted armature shaft. It should slide on without force,
//    and the flat should stop it turning before the screw is anywhere near it.
// 3. Run the M2.5 set screw in dry; the tapered hole forms its own thread. Do not tap.
//    It should tighten onto the shaft flat, not stop short and go solid in the taper.
// 4. Slide the pulley on inboard flange first. Its outboard flange will stand 0.5mm
//    past the end of the shaft; that is intended, not a sign of it being too far on.
// 5. Align the face with the cover pulley by eye along the belt run, then tighten.
// 6. Fit the belt last and check it sits square across both faces before tensioning.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// GT2 2mm belt pulley geometry, shared with the driven pulley on the damper cover.
include <Workfiles/GT2_Pulley.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Differential_Motor_Pulley() {
  teeth     = 19;
  face_w    = 6.125;     // Matches the cover pulley's face, belt plus 0.125 clearance.
  flange_w  = 0.5;       // Matches the cover pulley's flanges.
  flange_ch = 0.25;      // Edge break on each flange's outer face.
  pulley_r  = GT2_2mm_OD(teeth) / 2;
  // The cover's flanges are pinched to 12.6 by the 540 can and stand only 0.128 over the
  // belt's back. Nothing crowds this one, so it gets the full OD + 1.5 and stands 0.870
  // over the back, which is the retention the pair should have had all along.
  flange_r  = pulley_r + 1.5;
  pulley_h  = flange_w + face_w + flange_w;
  bore_r    = 1.65;      // 3.175mm armature shaft plus a slip fit.
  flat_d    = 0.45;      // Depth of the D flat, leaving the flat face 1.20 from the axis.
  screw_r   = 1.22;      // Sets the tapered hole; a tad under M2.5 major at the outer end.
  screw_z   = 1.5;       // Set screw axis height above the inboard flange's outer face.
  // Angle of a land, midway between two grooves. Grooves fall at -90 + 360i/teeth, so
  // the lands sit half a pitch off that; this picks whichever lands nearest 0 degrees.
  // Derived rather than stated because it moves whenever the tooth count does, and a
  // stale value would quietly drop the set screw into a groove root instead.
  land_a    = -90 + (180 / teeth) + (360 / teeth) * round((90 * teeth - 180) / 360);

  difference() {
    union() {
      // Toothed band.
      translate([0, 0, flange_w])
        cylinder($fn=96, r=pulley_r, h=face_w, center=false);
      // Inboard flange. Its outer face is the end that goes on first, and it sits 0.5mm
      // clear of the motor's front face rather than against it.
      cylinder($fn=96, r1=flange_r - flange_ch, r2=flange_r, h=flange_ch, center=false);
      translate([0, 0, flange_ch])
        cylinder($fn=96, r=flange_r, h=flange_w - flange_ch, center=false);
      // Outboard flange. This one overhangs the end of the armature shaft by 0.625mm,
      // which costs nothing: the bore still grips 6.5mm of shaft behind it.
      translate([0, 0, flange_w + face_w])
        cylinder($fn=96, r=flange_r, h=flange_w - flange_ch, center=false);
      translate([0, 0, pulley_h - flange_ch])
        cylinder($fn=96, r1=flange_r, r2=flange_r - flange_ch, h=flange_ch, center=false); }
    // Armature shaft bore, through, with a flat on the set screw side to mate the flat
    // on the motor's shaft. The flat is what actually transmits torque here; the screw
    // only stops the pulley walking off. That matters because a belt pulley pulls
    // harder than the pinion this arrangement is usually seen on, and screw friction
    // alone into a printed bore would not have been the thing to trust with it.
    rotate([0, 0, land_a])
      intersection() {
        translate([0, 0, -1])
          cylinder($fn=96, r=bore_r, h=pulley_h + 2, center=false);
        translate([-bore_r - 1, -bore_r - 1, -2])
          cube([2 * bore_r + 1 - flat_d, 2 * bore_r + 2, pulley_h + 4], center=false); }
    // Belt grooves, over the toothed face only. The cutter is given just enough overshoot
    // to break out cleanly; at the module's default it would cut through both flanges.
    translate([0, 0, flange_w])
      GT2_2mm_Teeth(teeth=teeth, face_w=face_w, overshoot=0.02, fn=96);
    // Set screw, on the land midway between two grooves rather than in a groove root.
    // It cannot be kept clear of the grooves at any size: with 19 teeth the land is only
    // 4.127 degrees wide, 0.42mm of arc at the OD, and nothing threaded fits inside that.
    // Centring it on the land shares a shallow intrusion between the two neighbouring
    // grooves instead of gutting one, and it is the flat above that carries the torque,
    // so what the screw takes out of the teeth costs little.
    // The hole is a shallow cone, narrow at the bore and opening toward the outer
    // surface, so a thread forming screw bites harder the deeper it goes: engagement
    // runs 43% of thread depth where it enters to 68% where it meets the bore.
    // h is the pulley DIAMETER on purpose, which makes the taper gentle enough that the
    // small end still clears an M2.5 core. The screw therefore passes right through and
    // lands on the shaft flat instead of bottoming in the taper. That is the point of it:
    // the set screw axis sits only 0.5mm into the toothed face, so a screw wedging in a
    // taper would spread the bore and push that patch of tooth surface out under the
    // belt. Tightening onto the shaft puts the load into steel and leaves the face flat.
    rotate([0, 0, land_a])
      translate([0, 0, screw_z])
        rotate([0, 90, 0])
          cylinder($fn=28, r1=screw_r - (0.1825 / screw_r), r2=screw_r, h=GT2_2mm_OD(teeth), center=false); } }
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// RENDERING

// Render the object.
// Comment or uncomment as needed.
//Differential_Motor_Pulley();

// Render the object for printing.
// Comment or uncomment as needed.
//Differential_Motor_Pulley();
// ----------------------------------------------------------------------------------------------------
