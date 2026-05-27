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

// NAME:  Ball Joint Ball
// REVISION:  A1
// START DATE:  5/26/2026
// CURRENT VERSION DATE:  5/26/2026
// AUTHOR:  Justin Grimes (@zelon88) & Copilot - Claude 4.5.
// DESCRIPTION:  
// A durable, multi-purpose, ball joint or non-marring end-cap for screws.
// FILE NAME: Ball_Joint_Ball.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// PRINTER CONFIGURATION
// [Printing instructions to be added]
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// MANUFACTURING INSTRUCTIONS

// 1. Deburr all edges to break sharp edges.
// 2. Install ball joint ball into cup. Then install hardware. Then install cup.
// 3. Endcap can be shimmed to adjust friction.
// 4. A Bic "Round Stic" pen can be cut to length & used as a spacer.
// 5. If using as a ball joint, a stud can be created by securing the screw with 
//   thread-locker, then cutting off the head of the screw.
// 6. After ball & stud installation; use heat-shrink tubing to create a dust boot.
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Ball_Joint_Ball() {
  // Create a sphere.
  difference() {
    // For a loose joint; make the ball slightly undersize of the receiver.
    // For a snug joint; make the ball the exact size of the receiver.
    // For a semi-permanent joint; make the ball slightly oversize of the receiver.
    // Can also be used as a simple non-marring end-cap.
    sphere(r=4.95, $fn=100);

    // Drill a hole into the flat side of the sphere.
    translate([0, 0, 3]) cylinder($fn=28, r=2.495, h=10, center=true); } }

// Render the object. 
// Comment or uncomment as needed.
Ball_Joint_Ball();
// ----------------------------------------------------------------------------------------------------