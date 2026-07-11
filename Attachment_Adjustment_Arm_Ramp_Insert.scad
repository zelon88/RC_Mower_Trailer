
module Attachment_Adjustment_Arm_Ramp_Insert_Left() {
  difference() {
    union() {
      // The body of the ramp slot.
      translate([26.25,  5.5, 6.375]) cube([23.15, 3.52, 5.75], center=true); }
    // Cut the boss slot for the insert side bosses.
    translate([26.25,  5.05, 6.375]) rotate([0, 5, 0]) cube([22, 3.02, 3.5], center=true);
    
} 
      // The spring perches.
      translate([36.95,  4.9, 5.45]) rotate([0, 95, 0]) cylinder($fn=48, r=1.5, h=0.25);
      //translate([0, -6.75, 0]) rotate([90, 0, 0]) cylinder($fn=48, r1=1.5, r2=1.25, h=0.25);
      // The spring perch chamfer caps.
      //translate([0, -6.75, 0]) rotate([90, 0, 0]) cylinder($fn=48, r1=1.5, r2=1.25, h=0.25);
      //translate([0, -6.75, 0]) rotate([90, 0, 0]) cylinder($fn=48, r1=1.5, r2=1.25, h=0.25);
}
    
module Attachment_Adjustment_Arm_Ramp_Insert_Right() {
  mirror([0, 1, 0]) Attachment_Adjustment_Arm_Ramp_Insert_Left(); }


//Attachment_Adjustment_Arm_Ramp_Insert_Left();
//Attachment_Adjustment_Arm_Ramp_Insert_Right();