
module Lower_Attachment_Arm() {
  difference() {
    union() {
      // Create the body of the Lower Attachment Arm that attaches to the flange.
      translate([-21, 0, 0]) cube([42, 20, 8], center=true);
      // Create the angled section of the Lower Attachment Arm.
      translate([-46.26, 0, -5.93]) rotate([0, -45, 0]) cube([20, 20, 8], center=true);
      // Create the flange on the end that attaches to the Attachment Adjustment Arm.
      translate([0, 0, 0]) cube([3, 32.5, 17.5], center=true); }
    // Cut lower adjustment arm flange perimeter through-holes.
    translate([0,  13, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 13, 0]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 13, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -13, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -13, 0]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -13, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 6.5, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 0, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -6.5, -6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 6.5, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 0, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -6.5, 6.25]) rotate([0,90,0]) cylinder($fn=28, r=1.22, h=4, center=true); } }

//Lower_Attachment_Arm();