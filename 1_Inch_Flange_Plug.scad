
module One_Inch_Flange_Plug() {

  difference() {
  cylinder($fn=28, r=12.7, h=3, center=true);
  // Six mounting holes spaced evenly around flange.
  for(i = [0:5]) {
    angle = i * 60;  // 360/6 = 60 degrees.
    radius = 25.4/2 - 3;  // Holes in middle of flange width.
    translate([radius * cos(angle), radius * sin(angle), -1]) cylinder($fn=20, r=1.25, h=10, center=true); 
    translate([radius * cos(angle), radius * sin(angle), 0.5]) cylinder($fn=28, r=2, h=2, center=true); } 
    // Angled grooves on top.
    for (y_pos = [-90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0, 5, 10, 15, 20, 25, 30, 35, 40, 45]) {
      translate([-26, y_pos, 1.5]) rotate([0, 0,  45]) cube([300, 1.5, 3], center=true);
      translate([ 26, y_pos, 1.5]) rotate([0, 0, -45]) cube([300, 1.5, 3], center=true); } } }


//One_Inch_Flange_Plug();