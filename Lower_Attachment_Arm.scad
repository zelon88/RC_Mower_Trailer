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

// NAME:  Lower Attachment Arm
// REVISION:  A1
// START DATE:  6/30/2026
// CURRENT VERSION DATE:  6/30/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A rigid link connecting the Attachment Adjustment Arm flange to the wheel or side attachment.
//    Features an angled section and a perimeter-bolted flange with a 3x4 through-hole pattern.
// FILE NAME: Lower_Attachment_Arm.scad
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
    translate([0, 13, -6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 13, 0]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 13, 6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -13, -6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -13, 0]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -13, 6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 6.5, -6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 0, -6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -6.5, -6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 6.5, 6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, 0, 6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true);
    translate([0, -6.5, 6.25]) rotate([0, 90, 0]) cylinder($fn=28, r=1.22, h=4, center=true); } }

// Render the object.
// Comment or uncomment as needed.
//Lower_Attachment_Arm();

// Render the object for printing.
// Comment or uncomment as needed.
//Lower_Attachment_Arm();
// ----------------------------------------------------------------------------------------------------