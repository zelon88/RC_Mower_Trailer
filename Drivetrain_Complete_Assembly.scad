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

// NAME:  Drivetrain Complete Assembly
// REVISION:  A1
// START DATE:  7/28/2026
// CURRENT VERSION DATE:  7/28/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Opus 5.
// DESCRIPTION:
//    Every rotating part of the blade drive in one place: the center differential and its
//    housing, both inertia dampers, both motor pulleys and both belts. Nothing here is a
//    part in its own right, and nothing is printed from this file.
//    It exists to be rendered without the chassis, the body halves or the clippings
//    ducting, all of which cost far more to compute than the drivetrain does and none of
//    which say anything about whether the drivetrain agrees with itself. Reach for the
//    Body Half Assembly when the question is clearance against the machine; reach for
//    this when the question is whether the drive lines up.
//    Every coordinate below is world space, shared with the Center Bracket, so a part
//    that lands correctly here lands correctly there.
// FILE NAME: Drivetrain_Complete_Assembly.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// Nothing here is printed, so there is no print render below to lay parts out on a plate.
// Print from the individual part files.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// ASSEMBLY INSTRUCTIONS

// 1. Build the center differential per the Differential Gears manufacturing instructions.
// 2. Close it with the Differential Housing Cap and mount the housing in the Center Bracket.
// 3. Build both inertia dampers per the Differential Output Yolk instructions, including
//    preloading the conical roller bearings against their standoff bosses.
// 4. Slide a damper onto each differential output shaft; the hex boss seats in any of its
//    six orientations.
// 5. Fit a motor pulley to each armature shaft, flat to flat, before the motors go in.
// 6. Fit the motors, then the belts. Check each belt sits square between its flanges.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for calling in the Center Differential Gears.
include <Differential_Gears.scad>;
// A module for calling in the Center Differential Housing.
include <Differential_Housing.scad>;
// A module for calling in the Center Differential Housing Cap.
include <Differential_Housing_Cap.scad>;
// A module for calling in the Differential Output Yolk Assembly.
include <Differential_Output_Yolk_Assembly.scad>;
// The three files below render themselves when loaded, so they are imported with use
// rather than include. Under include their render blocks execute here as well, and the
// drivetrain gains a spare damper, a spare pulley and a spare belt piled at the origin.
// Being at the origin, they sit 53mm below everything else and are easy to miss.
// A module for calling in the Differential Motor Pulley.
use <Differential_Motor_Pulley.scad>;
// A module for calling in the Differential Drive Belt.
use <Differential_Drive_Belt.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Drivetrain_Complete_Assembly() {
  // The Center Differential Housing.
  Differential_Housing();
  // The Center Differential Housing Cap.
  Differential_Housing_Cap();
  // The Center Differential Gears.
  translate([0, 0, 53])
    Differential_Assembly();

  // The Differential Output Yolk Assemblies, one either side of the differential.
  // Each turns its local Z onto the world Y axis, so both dampers share the axis the
  // differential output shafts run on.
  translate([0, -30, 53]) rotate([-90, 0, 0])
    Differential_Output_Yolk_Assembly();
  translate([0, 30, 53]) rotate([90, 0, 0])
    Differential_Output_Yolk_Assembly();

  // The Motor Pulleys, on the armature shafts where they leave the Center Bracket.
  // X=+-28 and Z=40 come straight from the bracket's motor bores; Y=+-18 is its upright's
  // outer face, and the pulley stands 0.5mm off it before its toothed face begins.
  translate([28, -18, 40]) rotate([90, 0, 0])
    Differential_Motor_Pulley();
  translate([-28, 18, 40]) rotate([-90, 0, 0])
    Differential_Motor_Pulley();

  // The Drive Belts.
  // The first rotation angle chooses which plane the belt lies in, and so which side of
  // the machine it belongs to; the second aims it within that plane. atan2(13, 28) is the
  // bearing from a damper to its motor, 28 across and 13 down in the bracket, so the belt
  // follows the bracket rather than a number copied off it.
  // Y is offset half of the 0.125mm side clearance so each belt sits centred in its
  // 6.125mm face rather than hard against a flange.
  translate([0, 18.5625, 53]) rotate([-90, 180 - atan2(13, 28), 0])
    Differential_Drive_Belt();
  translate([0, -18.5625, 53]) rotate([90, atan2(13, 28), 0])
    Differential_Drive_Belt(); }
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// RENDERING

// Render the object.
// Comment or uncomment as needed.
Drivetrain_Complete_Assembly();
// ----------------------------------------------------------------------------------------------------
