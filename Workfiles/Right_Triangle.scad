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

// NAME:  Right Triangle
// REVISION:  A1
// START DATE:  5/25/2026
// CURRENT VERSION DATE:  5/25/2026
// AUTHOR:  Adapted from the openscad/MCAD project by Justin Grimes (@zelon88).
// DESCRIPTION:
//    A utility module for creating right triangles, used to help craft the Center Bracket Support.
//    Adapted from the openscad/MCAD library. See the source link below.
// FILE NAME: Right_Triangle.scad
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

// A module for creating right triangles.
// https://github.com/openscad/MCAD/blob/master/triangles.scad
module triangle(o_len, a_len, depth, center=false) {
  centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
  translate(centroid) linear_extrude(height=depth) {
    polygon(points=[[0, 0], [a_len, 0], [0, o_len]], paths=[[0, 1, 2]]); } }