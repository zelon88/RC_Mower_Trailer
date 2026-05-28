module Motors() {
// These cylinders represent standard 540 brushed DC electric motors with a length of 55mm.
translate([-28, 12, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=55);
translate([28, 45.5, 40]) rotate([90, 0, 0]) cylinder($fn=128, r=18.055, h=55); }