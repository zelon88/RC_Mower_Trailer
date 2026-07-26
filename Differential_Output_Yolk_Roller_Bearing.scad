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
// REVISION:  A1
// START DATE:  7/21/2026
// CURRENT VERSION DATE:  7/21/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A frustum-shaped roller bearing for the Differential Output Yolk assembly.
//    Rides in a matching race cut into the ID of the cover drum and partially into
//    the OD of the yolk drum. The frustum profile (r1=0.875, r2=1) orients with
//    r1 at the open end of the assembly (Z=2 race position) and r2 inward.
//    Multiple rollers are distributed around the bearing circumference.
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
// GEOMETRY

module Output_Yolk_Roller_Bearing() {
  // Frustum roller — small end (r1=0.875) at Z=0, large end (r2=1) at Z=h.
  // Matches the frustum race cut in the cover ID and yolk OD.
  cylinder($fn=96, r1=0.875, r2=1, h=3.375, center=false); }

// Render the object.
// Comment or uncomment as needed.
//Output_Yolk_Roller_Bearing();

// Render the object for printing.
// Comment or uncomment as needed.
Output_Yolk_Roller_Bearing();
// ----------------------------------------------------------------------------------------------------
