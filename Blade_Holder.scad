// ----------------------------------------------------------------------------------------------------
// PROJECT INFORMATION

// NAME:  R/C Mower Trailer
// REVISION:  A1
// START DATE:  8/20/2021
// CURRENT VERSION DATE:  9/8/2021
// LICENSE:  GPLv3
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:  A tow-behind lawn mowing attachment for retrofit onto low-speed R/C vehicles.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PART INFORMATION

// NAME:  Blade Holder
// REVISION:  A1
// START DATE:  6/7/2026
// CURRENT VERSION DATE:  6/7/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A holder that clamps the cutting blade onto the blade axle assembly.
//    Features a hex socket that mates with a welded nut on the threaded rod axle.
//    The blade axle is installed from the bottom of the chassis so that gravity
//    prevents the assembly from coming apart during operation.
// FILE NAME: Blade_Holder.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Install blade onto Blade Holder first.
// 3. Install Blade Holder onto welded nut on axle end.
// 4. Install entire Blade Axle Assembly into the BOTTOM of the chassis.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

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
      translate([0, 0, -5]) cylinder($fn=6, r=9.5, h=5, center=true); }
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
    translate([0, 0, -5]) cylinder($fn=6, r=6.41, h=5, center=true); } }

// Render the object.
// Comment or uncomment as needed.
//Blade_Holder();

// Render the object for printing.
// Comment or uncomment as needed.
//Blade_Holder();
// ----------------------------------------------------------------------------------------------------
