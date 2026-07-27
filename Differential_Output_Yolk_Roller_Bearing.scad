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

// NAME:  Differential Output Yolk Roller Bearing
// REVISION:  A2
// START DATE:  7/21/2026
// CURRENT VERSION DATE:  7/26/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Sonnet 5.
// DESCRIPTION:
//    A frustum-shaped roller bearing for the Differential Output Yolk assembly.
//    Rides in a matching race cut into the ID of the cover drum and partially into
//    the OD of the yolk drum. The frustum profile (r1=0.875, r2=1) orients with
//    r1 at the open end of the assembly (Z=2 race position) and r2 inward.
//    Multiple rollers are distributed around the bearing circumference. The r2
//    (large) end corner is radiused to fillet_r — matches the radius cut into
//    the yolk and cover race grooves so the roller seats without a sharp-edge
//    interference. OAL is unchanged at h=3.375; the fillet is built inward from
//    the existing corner, not added onto the length.
// FILE NAME: Differential_Output_Yolk_Roller_Bearing.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Print multiple rollers and deburr all edges.
// 2. Lightly lubricate rollers before installing into race.
// 3. Seat rollers in yolk race groove before sliding cover over drum.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// Shared frustum-with-radiused-large-end profile — also used by the yolk and cover race cuts.
include <Workfiles/Filleted_Frustum.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Output_Yolk_Roller_Bearing() {
  // Frustum roller — small end (r1=0.875) at Z=0, large end (r2=1) at Z=h.
  // Matches the frustum race cut in the cover ID and yolk OD.
  // r2 corner radiused to fillet_r — must match the yolk/cover race fillet_r.
  fillet_r = 0.15;
  Filleted_Frustum(r1=0.875, r2=1, h=3.375, fillet_r=fillet_r, fn=96); }

// Render the object.
// Comment or uncomment as needed.
//Output_Yolk_Roller_Bearing();

// Render the object for printing.
// Comment or uncomment as needed.
Output_Yolk_Roller_Bearing();
// ----------------------------------------------------------------------------------------------------
