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
// CURRENT VERSION DATE:  6/4/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  
//    One quarter of the attachment assembly. To aide in rendering.
// FILE NAME: Attachment_Adjustment_Arm_Assembly.scad
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
// 4. Countersink screw holes so hardware sits flush.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES
// A module for calling in the Ball Joint Receiver.
include <Ball_Joint_Receiver.scad>;
// A module for calling in the Single Bearing Carrier.
include <Bearing_Carrier_Single.scad>;
// A module for calling in the Dual Bearing Carrier.
include <Bearing_Carrier_Dual.scad>;
// A module for calling in the Attachment Hinge Boss.
include <Attachment_Hinge_Boss.scad>;
// A module for calling in the Attachment Adjustment Arm Insert.
include <Attachment_Adjustment_Arm_Insert.scad>;
// A module for calling in the Attachment Adjustment Arm.
include <Attachment_Adjustment_Arm.scad>;
// A module for calling in the Attachment Adjustment Arm Cover.
include <Attachment_Adjustment_Arm_Cover.scad>;
// A module for calling in the Lower Attachment Arm.
include <Lower_Attachment_Arm.scad>;
// A module for calling in the Wheel.
include <Wheel.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// The Ball Joint Receivers for adjustment screws located on the top cover.
translate([0, 0, 3.5]) rotate([0, 0, 90]) translate([75, 32.5, 16.5]) Ball_Joint_Receiver();
// The center hub Bearing Carriers.
translate([0, 75, 20]) Bearing_Carrier_Dual();
translate([0, 75, 16]) rotate([180, 0, 0]) Bearing_Carrier_Single();
// The Attachment Hinge Bosses.
translate([0, 150, 0]) rotate([0, 0, 180]) Attachment_Hinge_Boss();
// The Attachment Adjustment Arm Insert.
translate([-32.5, 75, 43.5]) Attachment_Adjustment_Arm_Insert();
// The Attachment Adjustment Arm.
translate([-58.75, 75, 38]) Attachment_Adjustment_Arm();
// The Attachment Adjustment Arm Cover.
translate([-58.75, 75, 41.25]) Attachment_Adjustment_Arm_Cover();
// The Lower Attachment Arm.
translate([-78.25, 75, 38]) Lower_Attachment_Arm();
// The rear left wheel.
translate([-127, 105, 30]) Wheel();
// ----------------------------------------------------------------------------------------------------