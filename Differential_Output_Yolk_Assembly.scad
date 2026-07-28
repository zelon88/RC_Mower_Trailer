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
  // Render the object.
  // Comment or uncomment as needed.
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
  // Each roller leans 3.037 degrees out from the drum axis, in the plane containing that
  // axis. That lean is not a styling choice: it is what puts the roller's own cone apex
  // on the drum axis alongside the two race apexes, which is the condition for the roller
  // to roll rather than scrub. The rollers are consequently no longer surfaces of
  // revolution about the drum axis, so each one is placed individually rather than being
  // swept around it.
  // With the apex below, the gap between the race cones is widest at the top, so the
  // roller sits fat end up and needs no end for end flip: the module already runs thin at
  // its Z=0 and fat at its Z=h.
  // Placement is about the roller's own midpoint at r=9.16685, Z=5.7875, the midpoint of
  // the pitch line running from r=9.07745 at the thin end to r=9.25625 at the fat end.
  // Seated this way the roller exactly fills the gap at every station along its length,
  // since nominal clearance is zero for preload.
  roller_qty = 30;
  for (i = [0 : roller_qty - 1])
    rotate([0, 0, i * 360 / roller_qty])
      translate([9.16685, 0, 5.7875])
        rotate([0, 3.03675, 0])
          translate([0, 0, -3.375 / 2])
            Output_Yolk_Roller_Bearing();

  // THIS IS FOR VISUAL REFERENCE ONLY!!!
  // DO NOT USE THIS AS AN ASSEMBLY DIAGRAM!!!
  // DO NOT USE THIS FOR DIMENSIONAL REFERENCE!!!
  // Check alignment of the internal damper parts by layering the Output Yolk and Output Cover over each other with open ends facing the same direction.
  //translate([0, 0, 0]) rotate([0, 0, 180]) Differential_Output_Yolk_Cover();

  // Render the object for printing.
  // Comment or uncomment as needed.
  //Differential_Output_Yolk();
}

// Render the assembly.
//Differential_Output_Yolk_Assembly();