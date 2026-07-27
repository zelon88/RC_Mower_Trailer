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

// NAME:  Differential Output Yolk
// REVISION:  A7
// START DATE:  7/28/2026
// CURRENT VERSION DATE:  7/28/2026
// AUTHOR:  Justin Grimes (@zelon88).
// DESCRIPTION:
//    The complete Differential Yolk Assembly.
// FILE NAME: Differential_Output_Yolk_Assembly.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS
// [Manufacturing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating bearings.
include <Workfiles/Bearings.scad>;
// A module for creating the Output Yolk.
include <Differential_Output_Yolk.scad>;
// A module for creating the Output Yolk Cover.
include <Differential_Output_Yolk_Cover.scad>;
// Shared roller and race profiles, held in common with the cover so both halves agree.
include <Workfiles/Filleted_Frustum.scad>;
// The roller that rides in the race, for the assembly reference at the bottom of this file.
// Imported with use rather than include because that file renders itself when loaded, and
// include would execute that render and leave a stray roller sitting at the origin.
use <Differential_Output_Yolk_Roller_Bearing.scad>;
// ----------------------------------------------------------------------------------------------------


// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Differential_Output_Yolk_Assembly() {
  // Create the Differential Output Yolk.
  Differential_Output_Yolk();
  // Create the triple stacked 5x8 bearings that support independant rotation of the cover.
  translate([0, 0, 0])bearing_3x5x2_5();
  translate([0, 0, 2.5])bearing_3x5x2_5();
  translate([0, 0, 5]) bearing_3x5x2_5();
  // Outer bearing that mounts into the Center Bracket.
  translate([0, 0, 14.5]) rotate([0, 180, 0]) flanged_bearing_5x8x2_5();
  translate([0, 0, 14.5]) bearing_5x8x2_5();

  // USE THIS FOR DIMENSIONAL REFERENCE!!!
  // Add the Output Yolk Cover.
  translate([0, 0, 9.9875]) rotate([0, 180, 0]) Differential_Output_Yolk_Cover();

  // Add the roller bearings seated in the race.
  // Pitch radius 9.1625 is the midpoint between the two race surfaces taken at the roller's
  // own mid height, so the roller carries roughly 0.05mm of radial clearance on each side.
  // Z=7.475 puts the roller's small end at the top of the race and its large end at Z=4.1,
  // which centers the 3.375mm roller in the 3.575mm race with 0.1mm of axial float at each end.
  // Each roller is turned large end down so its radiused end faces the fat end of the race at
  // Z=4, which is the end both the yolk notch and the cover installation hole open onto.
  // The seated axis actually leans about 1.2 degrees, because the inner race rises 0.05mm
  // across the race while the outer race falls 0.20mm. These are drawn upright at the mean
  // pitch radius instead, which stays inside the roller's clearance at both ends and keeps
  // the reference readable. Raise roller_qty to check crowding; 28 is where they touch.
  roller_qty = 14;
  for (i = [0 : roller_qty - 1])
    rotate([0, 0, i * 360 / roller_qty]) translate([9.1625, 0, 7.475]) rotate([180, 0, 0])
      Output_Yolk_Roller_Bearing();

  // THIS IS FOR VISUAL REFERENCE ONLY!!!
  // DO NOT USE THIS AS AN ASSEMBLY DIAGRAM!!!
  // DO NOT USE THIS FOR DIMENSIONAL REFERENCE!!!
  // Check alignment of the internal damper parts by layering the Output Yolk and Output Cover over each other with open ends facing the same direction.
  //translate([0, 0, 0]) rotate([0, 0, 180]) Differential_Output_Yolk_Cover();
}

// Render the assembly.
//Differential_Output_Yolk_Assembly();