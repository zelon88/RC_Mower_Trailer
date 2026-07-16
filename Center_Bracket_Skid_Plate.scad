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

// NAME:  Center Bracket Skid Plate
// REVISION:  A1
// START DATE:  7/16/2026
// CURRENT VERSION DATE:  7/16/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A protective skid plate that mounts to the bottom of the Center Bracket.
//    Features relief cutouts for the Body Skirts, support braces for the Center Bracket Support,
//    and a chamfered front edge that clears the Hopper Bracket.
// FILE NAME: Center_Bracket_Skid_Plate.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS
// [Manufacturing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Center_Bracket_Skid_Plate() {
  difference() {
    // Create the body of the Center Bracket Skid Plate.
    translate([25, 0, -1.5]) cube([50, 40, 3], center=true);
    translate([58, 0, -10]) rotate([0, 65, 0]) cube([25, 125, 100], center=true);
    // Cut out circles for the Body Skirts.
    translate([0, 75, -5]) cylinder($fn=48, r=75, h=10, center=true);
    translate([0, -75, -5]) cylinder($fn=48, r=75, h=10, center=true);
    // Drill through holes for mounting screws.
    translate([24.75, 0, -5]) cylinder(r=1.22, h=20, $fn=28, center=true);
    translate([39.75, 7.5, -5]) cylinder(r=1.22, h=20, $fn=28, center=true);
    translate([39.75, -7.5, -5]) cylinder(r=1.22, h=20, $fn=28, center=true); }

  difference() {
    union() {
      // Create the support braces for the Center Bracket support.
      translate([32.5, 11, -8.75]) cube([65, 2.5, 17.5], center=true);
      translate([32.5, 3.5, -8.75]) cube([65, 2.5, 17.5], center=true);
      translate([32.5, -11, -8.75]) cube([65, 2.5, 17.5], center=true);
      translate([32.5, -3.5, -8.75]) cube([65, 2.5, 17.5], center=true); }

    // Cut out circles for the Body Skirts.
    translate([0, 75, -5]) cylinder($fn=48, r=75, h=10, center=true);
    translate([0, -75, -5]) cylinder($fn=48, r=75, h=10, center=true);

    // Chamfer the front edge of the Hopper Bracket.
    translate([70, 0, -10]) rotate([0, 65, 0]) cube([25, 50, 100], center=true);
    translate([75, 0, -11]) rotate([0, 72, 0]) cube([25, 50, 120], center=true);
    translate([20, 0, -22.5]) rotate([0, 0, 0]) cube([50, 150, 25], center=true); } }

// Render the object.
// Comment or uncomment as needed.
Center_Bracket_Skid_Plate();

// Render the object for printing.
// Comment or uncomment as needed.
//Center_Bracket_Skid_Plate();
// ----------------------------------------------------------------------------------------------------