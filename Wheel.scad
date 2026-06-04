
module Wheel() {
difference() {
  // Create a cylinder to represent the tire.
  rotate([90, 0, 0]) cylinder($fn=48, r=46, h=30, center=true);
  // Bore a center hole.
  rotate([90, 0, 0]) cylinder($fn=48, r=2, h=30, center=true);
  // Bore a hole in the sides to represent the a 1.9" rim.
  translate([0, 22, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=24.13, h=30, center=true);
  translate([0, -12, 0]) rotate([90, 0, 0]) cylinder($fn=48, r=24.13, h=30, center=true); } }

//Wheel();