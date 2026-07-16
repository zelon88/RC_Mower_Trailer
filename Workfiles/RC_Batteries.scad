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

// NAME:  R/C Batteries
// REVISION:  A1
// START DATE:  7/8/2026
// CURRENT VERSION DATE:  7/8/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    Low-poly representative models of various R/C battery configurations,
//    used for rendering and fit-checking only. Not intended to be 3D printed.
// FILE NAME: RC_Batteries.scad
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

module Large_2s_Lipo_Battery() {
  cube([139, 47, 25], center=true); }

module Small_2s_Lipo_Battery() {
  cube([100, 47, 25], center=true); }

module Large_3s_Lipo_Battery() {
  cube([139, 47, 37], center=true); }

module Small_3s_Lipo_Battery() {
  cube([100, 34, 34], center=true); }

module Six_Cell_NiMH_Battery() {
  cube([140, 48, 25], center=true); }