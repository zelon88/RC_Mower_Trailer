// 1" flange mounting holes.
module 1_Inch_Flange_No_Hole() {
  // Six mounting holes spaced evenly around flange.
  for(i = [0:5]) {
    angle = i * 60;  // 360/6 = 60 degrees.
    radius = 25.4/2 - 3;  // Holes in middle of flange width.
    translate([radius * cos(angle), radius * sin(angle), -1]) cylinder($fn=20, r=1.25, h=10); } }