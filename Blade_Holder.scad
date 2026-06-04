

module Blade_Holder() {
  difference() {
    union() {
    // Create the body of the holder.
    cube([30, 28, 6.5], center=true);
    // Create the hex on the bottom that fits around a welded nut on the end of the axle.
    // The blade axle is a threaded rod with a nut welded on one end.
    // The Blade Holder is installed onto the blade first.
    // The blade with holder is then installed onto the welded nut.
    // Then the entire Blade Axle Assembly is installed into the BOTTOM of the chassis.
    // By installing the axle through the bottom, it becomes almost impossible for the
    //   blade or axle assembly to fly apart. If anything comes loose, gravity will pull it down
    //   into the dirt, and the axle being one piece will prevent parts from flying away.
    translate ([0, 0, -5]) cylinder($fn=6, r=9.5, h=5, center=true);
}
    // Cut out the body of the blade.
    cube([145, 19.05, 3.175], center=true);
    // Cut the center hole.
    cylinder($fn=28, r=3.125, h=10, center=true);
    // Cut the center hole slightly larger on top.
    translate([0, 0, 2]) cylinder($fn=28, r=7.5, h=3, center=true);
    // Cut the hole for the nut. 
    // Nut is 1/4" ANSI, which works out to 11.1125mm.
    // OpenSCAD measures low poly cylinders across the flats.
    // So to fit a 1/4" standard nut, we need a radius of 6.41mm.
    translate ([0, 0, -5]) cylinder($fn=6, r=6.41, h=5, center=true);

}



}
//Blade_Holder();