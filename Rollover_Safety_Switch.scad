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

// NAME:  Rollover Safety Switch
// REVISION:  A1
// START DATE:  7/7/2026
// CURRENT VERSION DATE:  7/7/2026
// AUTHOR:  Justin Grimes (@zelon88)
// DESCRIPTION:
//    A gravity-actuated inline safety switch that cuts motor power when the chassis rolls over.
//    A metal Contact Pin suspended by copper wire rests on a threaded Landing Pad Bolt when upright,
//    completing a circuit between the input and output terminals. When the chassis tilts beyond a
//    preset angle the pin swings off the pad, breaking the circuit and disabling the motors.
//    Sensitivity is adjustable by threading the Landing Pad Bolt in or out.
//    Two switches wired in series provide redundancy. Multiple units can be chained for
//    additional protection. All terminals are duplicated for parallel to enable modular wiring setups.
//    For additional current; wire both inputs to the same supply and both outputs to the same motor.
//    Regularly test, verify, & calibrate this unit carefully to ensure proper operation before use.
//    This file contains all pieces required for assembly, but the only parts to be 3D Printed are;
//      1. The Rollover_Safety_Switch_Body();
//      2. The Rollover_Safety_Switch_Cover();
//      3. All other parts are sourced or fabricated components.
// FILE NAME: Rollover_Safety_Switch.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1.  Deburr all edges to break sharp edges.
// 2.  Cut a metal nail to length and grind the tip flat for the Contact Pin.
// 3.  Cut slots in the Contact Pin for copper wire to be wound and soldered.
// 4.  Add a solder ball to the top, wide flat surface of the Contact Pin to support a spring.
// 3.  Wind only one turn of copper wire per side into each Contact Slot on the Contact Pin.
// 4.  Scuff all metal contact surfaces to remove plating before soldering.
// 5.  Solder the wire turns into the slots to secure and ensure conductivity.
// 6.  Thread the Landing Pad Bolt assembly into the Center Divider nut pocket.
// 7.  Fill the face of the Landing Pad nut with solder and grind a small divot for pin contact.
// 8.  Hang the Contact Pin from the Pin Hooks via its input wire leads.
// 9.  Adjust the Landing Pad Bolt height to set the desired rollover sensitivity.
// 10. Lock the bolt position with the locking nuts.
// 11. Wire input terminals to power source, output terminals to motor controller.
// 12. Chain two units in series to unsure redundant operation.
// 13. Regularly test, verify, & calibrate this unit carefully to ensure proper operation before use.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY
    
module Rollover_Safety_Switch_Screw_Holes() {
  // Mounting screw holes — shared by body, standoffs, and center divider.
  translate([12.5, 5.5, 0]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([-12.5, 5.5, 0]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([0, 5.5, 0]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([0, -5.5, 0]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([12.5, -5.5, 0]) cylinder(r=1.22, h=25, $fn=28, center=true);
  translate([-12.5, -5.5, 0]) cylinder(r=1.22, h=25, $fn=28, center=true); }

module Rollover_Safety_Switch_Outer_Body() {
  difference() {
    // Create the body of the Rollover Safety Switch.
    cube([30, 15, 7.5], center=true);
    // Hollow out the inside of the body.
    translate([0, 0, 1.75]) cube([28, 12.5, 10], center=true);
    // Chamfer the 4 vertical corner edges along Z axis. Body corners at (±15, ±7.5).
    translate([15, 7.5, 0]) rotate([0, 0, 45]) cube([1.5, 1.5, 8.5], center=true);
    translate([15, -7.5, 0]) rotate([0, 0, 45]) cube([1.5, 1.5, 8.5], center=true);
    translate([-15, 7.5, 0]) rotate([0, 0, 45]) cube([1.5, 1.5, 8.5], center=true);
    translate([-15, -7.5, 0]) rotate([0, 0, 45]) cube([1.5, 1.5, 8.5], center=true);

    translate([15.5, 7, 0]) rotate([0, 0, -65]) cube([1.5, 1.5, 8.5], center=true);
    translate([15.5, -7, 0]) rotate([0, 0, 65]) cube([1.5, 1.5, 8.5], center=true);
    translate([-15.5, 7, 0]) rotate([0, 0, 65]) cube([1.5, 1.5, 8.5], center=true);
    translate([-15.5, -7, 0]) rotate([0, 0, -65]) cube([1.5, 1.5, 8.5], center=true);

    translate([14.5, 8, 0]) rotate([0, 0, -25]) cube([1.5, 1.5, 8.5], center=true);
    translate([14.5, -8, 0]) rotate([0, 0, 25]) cube([1.5, 1.5, 8.5], center=true);
    translate([-14.5, 8, 0]) rotate([0, 0, 25]) cube([1.5, 1.5, 8.5], center=true);
    translate([-14.5, -8, 0]) rotate([0, 0, -25]) cube([1.5, 1.5, 8.5], center=true);
    
    // Drill out the screw holes.
    Rollover_Safety_Switch_Screw_Holes(); } }

module Rollover_Safety_Switch_Screw_Standoffs() {
  difference() {
    union() {
      // Create the screw standoffs inside the body.
      translate([12.5, 5.5, 0]) cylinder(r=2, h=7.5, $fn=28, center=true);
      translate([-12.5, 5.5, 0]) cylinder(r=2, h=7.5, $fn=28, center=true);
      translate([0, 5.5, 0]) cylinder(r=2, h=7.5, $fn=28, center=true);
      translate([0, -5.5, 0]) cylinder(r=2, h=7.5, $fn=28, center=true);
      translate([12.5, -5.5, 0]) cylinder(r=2, h=7.5, $fn=28, center=true);
      translate([-12.5, -5.5, 0]) cylinder(r=2, h=7.5, $fn=28, center=true); }
    // Drill out the screw holes.
    Rollover_Safety_Switch_Screw_Holes(); } }

// The Contact Pin is made from a metal nail cut and ground to shape.
// The Contact Pin rests at X=-10 when upright and engaged.
// The Contact Pin rests at X=-13 when inverted and disengaged.
// The Contact Pin only completes a circuit between terminals when upright.
// The Contact Pin loses contact with the Landing Pad when partially inverted.
module Rollover_Safety_Switch_Contact_Pin() {
  difference() {
    union() {
      // Create the top hat shape of the Contact Pin.
      translate([-10, 0, 0]) rotate([0, 90, 0]) cylinder(r=2, h=1.25, $fn=28, center=true);
      // Create the center body portion of the Contact Pin.
      translate([-7, 0, 0]) rotate([0, 90, 0]) cylinder(r=1.25, h=5, $fn=28, center=true);
      // Create the pointed tip of the Contact Pin.
      translate([-2.5, 0, 0]) rotate([0, 90, 0]) cylinder(r1=1.25, r2=0.1, h=3, $fn=28, center=true); }
    // Grind the nose off the nail to create a larger contact patch on the X face.
    translate([0, 0, 0]) rotate([0, 90, 0]) cylinder(r=2, h=3, $fn=28, center=true);
    // Create the lower Contact Slot — wind several turns of copper wire here.
    translate([-4.5, 0, 0]) rotate([0, 90, 0]) cylinder(r=2, h=0.5, $fn=28, center=true);
    // Create the upper Contact Slot — wind several turns of copper wire here.
    translate([-8.5, 0, 0]) rotate([0, 90, 0]) cylinder(r=2, h=0.5, $fn=28, center=true); }
  // Fill in the small diameter section of the Contact Slot.
  translate([-7, 0, 0]) rotate([0, 90, 0]) cylinder(r=1, h=7, $fn=28, center=true); }

module Rollover_Safety_Switch_Pin_Hook() {
  // A single wire hook that suspends the Contact Pin inside the body.
  difference() {
    union() {
      // Create the body of the hook that attaches to the top screw bosses.
      cube([1.25, 1.25, 4.67], center=true);
      // Create a flanged edge so that wire can be wound around.
      translate([-0.5, 0, 0]) cube([0.5, 1.75, 6], center=true); }
     // Cut out the slots so the wire can be run through to the destination.
    translate([-0.5, 0.82, 1.75]) rotate([0, 0, 10]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.5, -0.82, 1.75]) rotate([0, 0, -10]) cube([0.6, 0.5, 1.65], center=true);    
    translate([-0.5, 0.82, -1.75]) rotate([0, 0, 10]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.5, -0.82, -1.75]) rotate([0, 0, -10]) cube([0.6, 0.5, 1.65], center=true);
    
    translate([-0.5, 0.805, 1.75]) rotate([0, 0, 20]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.5, -0.805, 1.75]) rotate([0, 0, -20]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.5, 0.805, -1.75]) rotate([0, 0, 20]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.5, -0.805, -1.75]) rotate([0, 0, -20]) cube([0.6, 0.5, 1.65], center=true);

    translate([-0.63, 0.78, 1.75]) rotate([0, 0, 35]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.63, -0.78, 1.75]) rotate([0, 0, -35]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.63, 0.78, -1.75]) rotate([0, 0, 35]) cube([0.6, 0.5, 1.65], center=true);
    translate([-0.63, -0.78, -1.75]) rotate([0, 0, -35]) cube([0.6, 0.5, 1.65], center=true); } }

module Rollover_Safety_Switch_Pin_Hooks() {
  // Two hooks — one on each side — suspend the Contact Pin by its input wire leads.
  translate([-10.75, 4, 0]) rotate([0, 0, 135]) Rollover_Safety_Switch_Pin_Hook();
  translate([-10.75, -4, 0]) rotate([0, 0, -135]) Rollover_Safety_Switch_Pin_Hook(); }

// The Terminals are where power enters and exits the Rollover Safety Switch.
// There is one input and one output terminal on each side of the Switch body.
// Only one input and one output terminal need to be connected for the switch to function.
// The extra terminal set ensures the design is parallel, redundant, and modular.
// The terminals on the top carry power in from a power source.
// The terminals on the bottom carry power out to a Rollover Protected Device.
// For additional reliability, chain multiple Rollover Safety Switches in series.
module Rollover_Safety_Switch_Terminals() {
  union() {
    // Create the top right terminal body.
    translate([-4.65, 8.5, 0]) rotate([0, 90, 90]) cylinder(r=1.25, h=5, $fn=28, center=true);
    // Create the top right terminal head.
    translate([-4.65, 5.5, 0]) rotate([0, 90, 90]) cylinder(r=2.35, h=1.25, $fn=28, center=true);
    // Create the top left terminal body.
    translate([-4.65, -8.5, 0]) rotate([0, 90, 90]) cylinder(r=1.25, h=5, $fn=28, center=true);
    // Create the top left terminal head.
    translate([-4.65, -5.5, 0]) rotate([0, 90, 90]) cylinder(r=2.35, h=1.25, $fn=28, center=true);
    // Create the bottom right terminal body.
    translate([8, 8.5, 0]) rotate([0, 90, 90]) cylinder(r=1.25, h=5, $fn=28, center=true);
    // Create the bottom right terminal head.
    translate([8, 5.5, 0]) rotate([0, 90, 90]) cylinder(r=2.35, h=1.25, $fn=28, center=true);
    // Create the bottom left terminal body.
    translate([8, -8.5, 0]) rotate([0, 90, 90]) cylinder(r=1.25, h=5, $fn=28, center=true);
    // Create the bottom left terminal head.
    translate([8, -5.5, 0]) rotate([0, 90, 90]) cylinder(r=2.35, h=1.25, $fn=28, center=true); } }
    
// The Contact Pin Centering Spring.
// If needed, this module can produce a spring which can be installed between the top of the body and the top of the Contact Pin to provide additional downward pressure.
// A very light spring is reccomended.
module Rollover_Safety_Switch_Spring() {
  translate([-15, 0, 0]) rotate([0, 90, 0]) linear_extrude(height=5, twist=3600, slices=150, convexity=10) translate([2, 0, 0]) circle(r=0.15, $fn = 48); }

// The Contact Pin Centering Spring Perch, located on the inside top surface of the Outer Body.
module Rollover_Safety_Switch_Spring_Perch() {
  translate([-13, 0, 0]) rotate([0, 90, 0]) cylinder(r=1.6, h=2.15, $fn=28, center=true); }

module Rollover_Safety_Switch_Center_Divider() {
  difference() {
    union() {
      // Create the wall closest to the Contact Pin.
      translate([-1.5, 0, 0]) cube([1.25, 15, 7.5], center=true);
      // Create side walls next to the pin to keep it from swinging too far.
      translate([-2.5, 3.675, 0]) rotate([0, 0, 16]) cube([1.4, 0.5, 7.5], center=true);
      translate([-2.5, -3.675, 0]) rotate([0, 0, -16]) cube([1.4, 0.5, 7.5], center=true);
      // Create the center wall.
      translate([1.5, 0, 0]) cube([1.25, 15, 7.5], center=true);
      // Create the wall closest to the Landing Pad Bolt.
      translate([4.5, 0, 0]) cube([1.25, 15, 7.5], center=true);
      // Create a raised floor in the Landing Pad Bolt mounting nut section.
      translate([3, 0, -1.25]) cube([3, 15, 5], center=true); }
    // Trim the ends of the sidewalls flat to enhance terminal clearance.
    translate([-3.7325, 0, 0]) cube([1.25, 15, 7.5], center=true);
    // Cut a mating slot for the Landing Pad Bolt mounting nut.
    translate([3, 0, 0]) rotate([0, 90, 0]) cylinder(r=2.93, h=1.6, $fn=6, center=true);
    // Cut a through hole for the Contact Pin nose to protrude through when upright.
    translate([-1.5, 0, 0]) rotate([0, 90, 0]) cylinder(r1=3.5, r2=3, h=1.5, $fn=28, center=true);
    // Cut a through hole in both center walls for the Landing Pad Bolt.
    translate([1.5, 0, 0]) rotate([0, 90, 0]) cylinder(r=1.1, h=10, $fn=28, center=true);
    // Drill out the screw holes.
    Rollover_Safety_Switch_Screw_Holes(); } }

// M2.5 bolt or screw with the head cut off to become a threaded rod.
// Has one M2.5 nut installed freely spinning on the thread for mounting.
// Has one M2.5 nut installed with locking hardware for position locking.
// Has one M2.5 nut soldered to the end to serve as the Landing Pad.
// Scuff all metal contact surfaces to remove plating before soldering.
// Thread the Landing Pad nut on last; fill end with solder and grind a contact divot.
module Rollover_Safety_Switch_Landing_Pad_Bolt() {
  union() {
    // Create the body of the Landing Pad Bolt.
    translate([5, 0, 0]) rotate([0, 90, 0]) cylinder(r=1, h=10, $fn=28, center=true);
    // Create the Landing Pad nut — soldered and ground to form the contact surface.
    translate([0, 0, 0]) rotate([0, 90, 0]) cylinder(r=2.89, h=1.6, $fn=6, center=true);
    // Create the mounting nut.
    translate([3, 0, 0]) rotate([0, 90, 0]) cylinder(r=2.89, h=1.6, $fn=6, center=true);
    // Create the locking nut pair.
    translate([6, 0, 0]) rotate([0, 90, 0]) cylinder(r=2.89, h=1.6, $fn=6, center=true);
    translate([8, 0, 0]) rotate([0, 90, 0]) cylinder(r=2.89, h=1.6, $fn=6, center=true);
    // Create the Landing Pad to output leads — right side.
    translate([7, 0, 0]) rotate([0, 90, 0]) cylinder(r=2.75, h=0.2, $fn=28, center=true);
    translate([7.8, 4.35, 0]) rotate([90, 0, -25]) cylinder(r=0.5, h=4, $fn=28, center=true);
    // Create the Landing Pad to output leads — left side.
    translate([7.8, -4.35, 0]) rotate([-90, 0, 25]) cylinder(r=0.5, h=4, $fn=28, center=true);
    // Create the Contact Pin input leads — right side.
    translate([-9, 2, 2]) rotate([-45, 55, 65]) cylinder(r=0.5, h=4.5, $fn=28, center=true);
    translate([-9, 2, -2]) rotate([45, -55, 65]) cylinder(r=0.5, h=4.5, $fn=28, center=true);
    translate([-7, 2, 1.5]) rotate([-45, 65, 110]) cylinder(r=0.5, h=8, $fn=28, center=true);
    translate([-7, 2, -1.5]) rotate([45, -65, 110]) cylinder(r=0.5, h=8, $fn=28, center=true);
    translate([-7, 5, 1.5]) rotate([45, 65, -110]) cylinder(r=0.5, h=7, $fn=28, center=true);
    translate([-7, 5, -1.5]) rotate([-45, -65, -110]) cylinder(r=0.5, h=7, $fn=28, center=true);
    // Create the Contact Pin input leads — left side.
    translate([-9, -2, 2]) rotate([45, 55, -65]) cylinder(r=0.5, h=4.5, $fn=28, center=true);
    translate([-9, -2, -2]) rotate([-45, -55, -65]) cylinder(r=0.5, h=4.5, $fn=28, center=true);
    translate([-7, -2, 1.5]) rotate([45, 65, -110]) cylinder(r=0.5, h=8, $fn=28, center=true);
    translate([-7, -2, -1.5]) rotate([-45, -65, -110]) cylinder(r=0.5, h=8, $fn=28, center=true);
    translate([-7, -5, 1.5]) rotate([-45, 65, 110]) cylinder(r=0.5, h=7, $fn=28, center=true);
    translate([-7, -5, -1.5]) rotate([45, -65, 110]) cylinder(r=0.5, h=7, $fn=28, center=true); } }

// A module to render the entire Rollover Safety Switch Assembly.
// Contains printed & fabricated parts located in their proper places after assembly.
module Rollover_Safety_Switch_Assembly() {
  union() {
    Rollover_Safety_Switch_Body();
    Rollover_Safety_Switch_Contact_Pin();
    Rollover_Safety_Switch_Landing_Pad_Bolt();
    Rollover_Safety_Switch_Terminals();
    Rollover_Safety_Switch_Spring();
    Rollover_Safety_Switch_Cover(); } }

// A module to render the entire Rollover Safety Switch Assembly without the cover.
// Contains printed & fabricated parts located in their proper places after assembly.
// This one removes the cover to enable seeing inside.
module Rollover_Safety_Switch_Assembly_Without_Cover() {
  union() {
    Rollover_Safety_Switch_Body();
    Rollover_Safety_Switch_Contact_Pin();
    Rollover_Safety_Switch_Landing_Pad_Bolt();
    Rollover_Safety_Switch_Terminals();
    Rollover_Safety_Switch_Spring();
    Rollover_Safety_Switch_Cover(); } }

// A module to create the Rollover Safety Switch Cover.
module Rollover_Safety_Switch_Cover() {
  difference() {
    // Create the body of the Rollover Safety Switch Cover.
    translate([0, 0, 3.75]) cube([30, 15, 1.25], center=true);
    // Drill out the screw holes.
    Rollover_Safety_Switch_Screw_Holes();
    // Cut out a recess for the Outer Body.
    Rollover_Safety_Switch_Outer_Body();
    // Cut out recesses for the Center Dividers.
    Rollover_Safety_Switch_Center_Divider();
    // Clean up the Center Divider closest to the Contact Pin.
    translate([-1.5, 0, 0]) cube([1.25, 15, 7.5], center=true);
    // Chamfer the 4 vertical corner edges along Z axis. Cover corners at (±15, ±7.5).
    translate([15, 7.5, 3.75]) rotate([0, 0, 45]) cube([1.5, 1.5, 2.25], center=true);
    translate([15, -7.5, 3.75]) rotate([0, 0, 45]) cube([1.5, 1.5, 2.25], center=true);
    translate([-15, 7.5, 3.75]) rotate([0, 0, 45]) cube([1.5, 1.5, 2.25], center=true);
    translate([-15, -7.5, 3.75]) rotate([0, 0, 45]) cube([1.5, 1.5, 2.25], center=true);

    translate([15.5, 7, 3.75]) rotate([0, 0, -65]) cube([1.5, 1.5, 2.25], center=true);
    translate([15.5, -7, 3.75]) rotate([0, 0, 65]) cube([1.5, 1.5, 2.25], center=true);
    translate([-15.5, 7, 3.75]) rotate([0, 0, 65]) cube([1.5, 1.5, 2.25], center=true);
    translate([-15.5, -7, 3.75]) rotate([0, 0, -65]) cube([1.5, 1.5, 2.25], center=true);

    translate([14.5, 8, 3.75]) rotate([0, 0, -25]) cube([1.5, 1.5, 2.25], center=true);
    translate([14.5, -8, 3.75]) rotate([0, 0, 25]) cube([1.5, 1.5, 2.25], center=true);
    translate([-14.5, 8, 3.75]) rotate([0, 0, 25]) cube([1.5, 1.5, 2.25], center=true);
    translate([-14.5, -8, 3.75]) rotate([0, 0, -25]) cube([1.5, 1.5, 2.25], center=true);
    // Upward arrow cut into the outside (top) face of the cover at Z=4.375 — 0.5mm deep.
    // Points in -X direction to indicate correct installation orientation.
    // Stem: 2mm wide x 4mm tall. Head: 6mm wide x 4mm tall. Total arrow height: 8mm.
    translate([1, 0, 3.875]) linear_extrude(height=0.6)
      polygon(points=[[3, 1], [3, -1], [-1, -1], [-1, -3], [-5, 0], [-1, 3], [-1, 1]]); } }

module Rollover_Safety_Switch_Body() {
  union() {
    difference() {
      Rollover_Safety_Switch_Outer_Body();
      Rollover_Safety_Switch_Terminals(); }
    Rollover_Safety_Switch_Screw_Standoffs();
    Rollover_Safety_Switch_Pin_Hooks();
    Rollover_Safety_Switch_Center_Divider();
    Rollover_Safety_Switch_Spring_Perch(); } }

// A module to render the entire Rollover Safety Switch Assembly.
// Contains printed & fabricated parts located in their proper places after assembly.
module Rollover_Safety_Switch_Assembly() {
  union() {
    Rollover_Safety_Switch_Body();
    Rollover_Safety_Switch_Contact_Pin();
    Rollover_Safety_Switch_Landing_Pad_Bolt();
    Rollover_Safety_Switch_Terminals();
    Rollover_Safety_Switch_Spring();
    Rollover_Safety_Switch_Cover(); } }

// A module to render the entire Rollover Safety Switch Assembly without the cover.
// Contains printed & fabricated parts located in their proper places after assembly.
// This one removes the cover to enable seeing inside.
module Rollover_Safety_Switch_Assembly_Without_Cover() {
  union() {
    Rollover_Safety_Switch_Body();
    Rollover_Safety_Switch_Contact_Pin();
    Rollover_Safety_Switch_Landing_Pad_Bolt();
    Rollover_Safety_Switch_Terminals();
    Rollover_Safety_Switch_Spring(); } }

// ----------------------------------------------------------------------------------------------------

// Render the object.
// Comment or uncomment as needed.
//Rollover_Safety_Switch_Assembly();
//Rollover_Safety_Switch_Assembly_Without_Cover();

// Render the object for printing.
// Comment or uncomment as needed.
//Rollover_Safety_Switch_Body();
//Rollover_Safety_Switch_Cover();
// ----------------------------------------------------------------------------------------------------
