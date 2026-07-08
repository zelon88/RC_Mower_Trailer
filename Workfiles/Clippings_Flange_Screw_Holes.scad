module Clippings_Flange_Screw_Holes() {
  // Clippings flange screw holes with deep screw recess on bottom (-Z) face.
  for (i = [0:7]) {
    translate([15.25 * cos(i * 45), 15.25 * sin(i * 45), 0]) {
      // Through hole.
      cylinder($fn=28, r=1.22, h=15, center=false);
      // Deep screw recess on bottom (-Z) face.
      translate([0, 0, -5]) cylinder($fn=28, r=2, h=10, center=false); } } }

//Clippings_Flange_Screw_Holes();