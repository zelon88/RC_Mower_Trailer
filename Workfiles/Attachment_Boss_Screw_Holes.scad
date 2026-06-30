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

// NAME:  Attachment Boss Screw Holes
// REVISION:  A1
// START DATE:  6/10/2026
// CURRENT VERSION DATE:  6/10/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude Sonnet 4.6.
// DESCRIPTION:
//    A reusable module that generates the 4x4 grid of Attachment Boss screw holes.
//    Used by both the Front and Rear Attachment Boss mounting features on Body_Half.
//    Mirrors in X via the x_dir parameter so the same module serves both sides.
// FILE NAME: Attachment_Boss_Screw_Holes.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

// x_origin: X position of the first hole column (closest to torus center).
// x_dir: 1 for holes extending in +X, -1 for holes extending in -X.
// y_center: Y center of the 4-row hole grid (rows are y_center +/- 9 and +/- 3).
// z: Z position of the hole centerline (holes are center=true along Z).
module Attachment_Boss_Screw_Holes(x_origin, x_dir, y_center, z) {
  for (xi = [0:3]) {
    for (yi = [0:3]) {
      translate([x_origin + x_dir * xi * 5, y_center - 9 + yi * 6, z])
        cylinder($fn=28, r=1.22, h=20, center=true); } } }
// ----------------------------------------------------------------------------------------------------
