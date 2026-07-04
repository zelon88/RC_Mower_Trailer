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

// NAME:  Body Skirt
// REVISION:  A1
// START DATE:  6/7/2026
// CURRENT VERSION DATE:  6/7/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A detachable side skirt for the main body.
//    Attaches from below via screws that pass up through the main body.
// FILE NAME: Body_Skirt.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Thread boss screws up through Body_Half skirt holes from below.
// 3. Fasten skirt to torus with nuts from above.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Body_Skirt() {
  // Create the side skirt.
  difference() {
    translate([0, 75, -5]) cylinder($fn=48, r=75, h=10, center=true);
    // Cut out the center of the side skirt.
    translate([0, 75, -5]) cylinder($fn=48, r=70, h=10, center=true);
    // Cut screw holes.
    for (i = [0:19]) {
      skirt_angle = i * 18 + 9;
      translate([72 * cos(skirt_angle), 75 + 72 * sin(skirt_angle), -10])
        cylinder($fn=28, r=1.22, h=30); } } }

// Render the object.
// Comment or uncomment as needed.
//Body_Skirt();

// Render the object for printing.
// Comment or uncomment as needed.
Body_Skirt();
// ----------------------------------------------------------------------------------------------------
