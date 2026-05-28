// ----------------------------------------------------------------------------------------------------
// PROJECT INFORMATION

// NAME:  R/C Mower Trailer
// REVISION:  A1
// START DATE:  8/20/2021
// CURRENT VERSION DATE:  5/28/2026
// LICENSE:  GPLv3
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  A tow-behind lawn mowing attachment for retrofit onto low-speed R/C vehicles.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PART INFORMATION

// NAME:  Body Assembly
// REVISION:  A1
// START DATE:  11/22/2021
// CURRENT VERSION DATE:  5/28/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    Half of the main body assembly for the mower assembly. To aide in rendering.
//    Made from two halves and screwed together around a central gearbox.
//    This part is two 150mm x 150mm parts, the largest my printer can hold.
// FILE NAME: Body_Half_Assembly.scad
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

// A module for calling in the Center Bracket.
include <Center_Bracket.scad>;
// A module for calling in the Center Bracket Support.
include <Center_Bracket_Support.scad>;
// A module for calling in half of the Body.
include <Body_Half.scad>
// A module for calling in the Ball Joint Ball.
include <Ball_Joint_Ball.scad>;
// A module for calling in the Ball Joint Receiver.
include <Ball_Joint_Receiver.scad>;
// A module for calling in the Single Bearing Carrier.
include <Bearing_Carrier_Single.scad>;
// A module for calling in the Dual Bearing Carrier.
include <Bearing_Carrier_Dual.scad>;
// A module for calling in the Attachment Hinge Boss.
include <Attachment_Hinge_Boss.scad>;
// A module for creating low-poly 540 DC Brushed Electric Motors.
include <Workfiles/Motors.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// The center bracket that houses the motors & gearbox.
Center_Bracket();
// The Dual Electric Motors.
Motors();
// The Center Bracket Support.
rotate([0, 0, 180]) Center_Bracket_Support();
// The Body that houses the adjustment screws & blade bearings.
rotate([0, 0, 0]) Body_Half ();
// The Ball Joint Receivers for adjustment screws located on the top cover.
translate([0, 0, 3.5]) rotate([0, 0, 90]) translate([75, 32.5, 16.5]) Ball_Joint_Receiver();
translate([0, 0, 3.5]) rotate([0, 0, 90]) translate([75, -32.5, 16.5]) Ball_Joint_Receiver();
// The center hub Bearing Carriers.
translate([0, 75, 20]) Bearing_Carrier_Dual();
// The Attachment Hinge Bosses.
Attachment_Hinge_Boss();
translate([0, 150, 0]) rotate([0, 0, 180]) Attachment_Hinge_Boss();
// ----------------------------------------------------------------------------------------------------