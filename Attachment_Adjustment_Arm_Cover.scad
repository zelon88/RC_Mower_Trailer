

module Attachment_Adjustment_Arm_Cover() {
  difference() {
    union() {
    // Create the body of the cover.
    translate([18.5, 0, 5]) cube([27.5, 22.5, 2.5], center=true);
    // Create the rounded end of the cover.
    translate([32, 0, 5]) cylinder($fn=48, r=11.25, h=2.5, center=true);

}
    // Cut the slot in the paddle for the Attachment Adjustment Arm Insert body.
    translate([26.25, 0, 5]) cube([22, 7, 5], center=true);
    // Cut the chamfer on the top of the cover.
    translate([0.5, 0, 11]) rotate([0, 29, 0]) cube([20, 25, 10], center=true);
     // Cut the cover holes.
    translate([11.25,  3, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([17.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([23.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([29.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([35.25,  8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([39.5,  4.5, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([40.5,  0, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25,  -3, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([11.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([17.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([23.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([29.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([35.25,  -8.75, 5]) cylinder($fn=28, r=1.22, h=10, center=true);
    translate([39.5,  -4.5, 5]) cylinder($fn=28, r=1.22, h=10, center=true);

} 

}