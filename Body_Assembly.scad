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

// NAME:  Body Assembly
// REVISION:  A1
// START DATE:  11/22/2021
// CURRENT VERSION DATE:  5/25/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    The main body assembly for the mower assembly.
//    Made from two halves and screwed together around a central gearbox.
//    This part is two 150mm x 150mm parts, the largest my printer can hold.
// FILE NAME: Body_Assembly.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Make studs by installing extra long screws and cutting off the heads.
// 3. Use studs, washers, lock-washers & locknuts for torus-to-torus bolts.
// 4. Countersink torus-to-torus through-holes so hardware sits flush.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// A module for creating torus' to aide in crafting the body.
include <Workfiles/Torus.scad>;
// A module for creating the Center Bracket for crafting mating surfaces.
include <Center_Bracket.scad>;
// A module for calling in both halves of the body & positioning them.
include <Body_Half.scad>
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// The two halves of the body, with mating surfaces touching each other.
rotate([0, 0, 0]) Body_Half ();
rotate([0, 0, 180]) Body_Half ();
// ----------------------------------------------------------------------------------------------------