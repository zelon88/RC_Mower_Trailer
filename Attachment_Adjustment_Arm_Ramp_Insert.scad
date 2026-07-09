
module Attachment_Adjustment_Arm_Ramp_Insert_Left() {
  difference() {
    union() {
      translate([26.25,  5.5, 6.375]) cube([23.15, 3.52, 5.75], center=true);
  }
    // Cut the boss slot for the insert side bosses.
    translate([26.25,  5, 6.375]) rotate([0, 5, 0]) cube([22, 3.02, 3.25], center=true);
    } }
    
module Attachment_Adjustment_Arm_Ramp_Insert_Right() {
  mirror([0, 1, 0]) Attachment_Adjustment_Arm_Ramp_Insert_Left(); }


//Attachment_Adjustment_Arm_Ramp_Insert_Left();
//Attachment_Adjustment_Arm_Ramp_Insert_Right();