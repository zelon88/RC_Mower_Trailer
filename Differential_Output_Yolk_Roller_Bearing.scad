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

// NAME:  Differential Output Yolk Roller Bearing
// REVISION:  A4
// START DATE:  7/21/2026
// CURRENT VERSION DATE:  7/27/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Opus 5.
// DESCRIPTION:
//    A conical roller for the Differential Output Yolk bearing. Rides between a cone
//    cut into the OD of the yolk drum and a matching cone cut into the ID of the cover
//    drum. All three cones share one apex on the drum axis, which is the condition for
//    pure rolling, so the roller does not scrub along its contact line.
//    The roller seats with its axis leaning 3.037 degrees out from the drum axis and
//    its fat end toward low Z, which is the end the installation hole feeds.
//    The bearing is preloaded rather than clearance fitted. It locates the two drums
//    both radially and axially, so the clamping screws can be run light against a stop
//    and the cover still turns freely instead of binding on screw friction.
// FILE NAME: Differential_Output_Yolk_Roller_Bearing.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Print multiple rollers and deburr all edges.
// 2. Lightly lubricate rollers before installing into race.
// 3. Seat rollers in yolk race groove before sliding cover over drum.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MODULES

// Shared frustum-with-radiused-large-end profile — also used by the yolk and cover race cuts.
include <Workfiles/Filleted_Frustum.scad>;
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Output_Yolk_Roller_Bearing() {
  // Conical roller, thin end (r=0.82745) at Z=0 and fat end (r=0.84375) at Z=h.
  // These radii are not chosen — they are whatever exactly fills the gap between the
  // yolk and cover race cones, which is what makes the bearing a true conical roller
  // bearing rather than a conical roller in a mismatched race. The roller cone shares
  // its apex with both races, so contact is pure rolling along the whole contact line.
  // Nominal clearance is zero. The bearing is preloaded: the screws clamping the two
  // drums draw the cover down the cone until the rollers take up, so print tolerance
  // is absorbed by axial screw position rather than by a designed-in gap. Any clearance
  // built in here would instead become dead travel, at roughly 17mm of axial motion
  // per 1mm of radial take-up.
  // Total taper is only 0.0163mm across the length. A correct conical roller at this
  // pitch diameter is necessarily near cylindrical, because the races must sweep about
  // eight times the roller's own taper and the yolk drum wall cannot give up that much.
  // Both end corners are broken to fillet_r to match the race groove roots, so the
  // roller crosses the partially uncovered installation opening without catching a lip.
  fillet_r = 0.15;
  Filleted_Frustum(r1=0.82745, r2=0.84375, h=3.375, fillet_r=fillet_r, fillet_end="both", fn=96); }

// Render the object.
// Comment or uncomment as needed.
//Output_Yolk_Roller_Bearing();

// Render the object for printing.
// Comment or uncomment as needed.
Output_Yolk_Roller_Bearing();
// ----------------------------------------------------------------------------------------------------
