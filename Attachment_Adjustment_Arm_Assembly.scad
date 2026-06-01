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

// The Ball Joint Receivers for adjustment screws located on the top cover.
translate([0, 0, 3.5]) rotate([0, 0, 90]) translate([75, 32.5, 16.5]) Ball_Joint_Receiver();
// The center hub Bearing Carriers.
translate([0, 75, 20]) Bearing_Carrier_Dual();
// The Attachment Hinge Bosses.
translate([0, 150, 0]) rotate([0, 0, 180]) Attachment_Hinge_Boss();
// The Attachment Adjustment Arm Insert.
translate([-32.5, 75, 43.5]) Attachment_Adjustment_Arm_Insert();
// The Attachment Adjustment Arm.
translate([-58.75, 75, 37.5]) Attachment_Adjustment_Arm();
// The Attachment Adjustment Arm Cover.
translate([-58.75, 75, 41.25]) Attachment_Adjustment_Arm_Cover();