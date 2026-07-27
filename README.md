# RC_Mower_Trailer

## WORK IN PROGRESS!!!

A set of SCAD models to 3D Print & Manufacture your own tow-behind lawn mower for R/C trucks.

## Requirements

- Design is about 65% complete. All parts are still subject to change.
- 3D printer with 150mm × 150mm minimum build volume
- Tamiya High-Lift or compatible R/C truck (tow vehicle)
- 540 brushed motors × 2 (standard Silver Can or equivalent)
- 1/10th scale R/C servo × 2 (standard size)
- 1.9" or 2.2" R/C wheels × 4
- Standard R/C battery & ESC (×2, one per motor)
- Steel flat bar — 3.175mm (1/8") thickness for chassis rails & blades
- Standard M2.5, M3, & M5 hardware (screws, nuts, washers, lock washers)
- 10× thrust ball bearings & 2× flanged ball bearings (differential assembly)
- R4 series ball bearings — 1/4" ID × 1/2" OD × 3/16" width (blade carriers)
- Basic hand tools: drill press, files, soldering iron, screwdrivers

## Features At-A-Glance

* A hybrid assembly consisting of 3D printed & manufactured parts.
* Complete with detailed manufacturing & assembly instructions.
* Dual counter-rotating motors for exceptional torque & smoothness.
* Dual counter-rotating cutting blades for smooth, balanced operation.
* Differential gearbox provides rotational shock damping properties while ensuring both motors send power to both blades.
* Uses standard 540 brushed R/C motors, 1/10th scale R/C servos, standard R/C batteries, & 1.9" or 2.2" R/C wheels.
* Highly modular design with many interchangeable parts makes repairs simple & inexpensive.
* Industrial-grade engineering inspired by early 20th century tractors & farm equipment.
* Designed to be manufactured at home using residential-grade tooling & techniques.
* Designed to actually do work. Not a shelf queen. A functional piece of equipment.
* Designed with numerous safety features. See below for more safety information.
* Self-leveling suspension with adjustable ride height.
* Integrated hoppers collect grass clippings and dump them out at the push of a button.

## Features In-Depth

### Counter Rotating Blade Drivetrain

The cutting blades are powered in opposite directions by a pair of "Silver Can" brushed 540 DC electric motors typically found in entry-level R/C vehicles. This motor is inexpensive, reliable, and offers decent performance. The gearbox accepts standard size, standard rotation motors, so most R/C motors will fit.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Center_Bracket_Assembly_Rev-A1_7-15-2026_1.png)

The rotation of the motors is joined via a Center Differential. This linked-rotation configuration allows for the equalization of impacts or over-torque events between both blades & both motors. The rotation of the blades being linked together means one blade acts as a flywheel & inertial damper for the other. It also means faster blade speed recovery after an impact, as each blade has torque from both motors. Finally, when our system impacts heavy debris; not all energy is lost like in separate blade systems. In our system, the impact energy is transferred to the opposite blade, actually increasing its velocity. This temporary over-speed condition acts as an inertial "capacitor" that stores energy to be distributed back to the slower blade via the center differential.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Differential_Assembly_Rev-A1_7-15-2026_1.png)

The differential itself is a modular 3D printable planetary unit measuring 21mm x 21mm x 21mm. Its assembly consists of 2 output gears, 4 planet gears, & a core block. The assembly is supported by 10× thrust ball bearings & 2× flanged ball bearings. Great care has been taken during design to ensure the differential assembly is isolated from shock, over-torque conditions, or unsupported side-loads.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Differential_Assembly_Rev-A1_7-15-2026_2.png)

To compare; in systems with fully separate blade drive systems the energy contained within any blade is only equal to that of the mass of one blade. In our system; each blade contains the full potential energy of both rotating blades. When our system impacts heavy debris our blades keep more of their velocity and stability.

### Inertia Dampened Drivetrain

The drivetrain features dual Inertia Dampers located on either side of the center differential. The inertia dampers are designed to absorb, store, and redistribute kinetic energy from large impacts back into the drivetrain evenly over time. The compact dampers are integrated inside the pulley system which drives the blades. Each damper features quad centering springs which provide 15 degrees of deflection in both clockwise & counter-clockwise directions for 30 degrees of total deflection.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Output_Yolk_Assembly_Rev-A1_7-26-2026_1.png)

Each damper is designed in two main parts; a yolk & a cover. Both the cover & the yolk are open-ended interlocking drums. The drums can rotate independantly clockwise or counter-clockwise from one another via 3x internal ball bearings and a massive 10mm x 3.6mm tapered roller bearing integrated into the body of the two drums. Although the drums can rotate up to 15 degrees off-center from one another, they are pre-loaded to stay centered via 4x internal springs. The internal springs act to keep the drums centered, but will allow separation up to 15 degrees clockwise or counter-clockwise to absorb sudden drastic changes in load.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Output_Yolk_Assembly_Rev-A1_7-26-2026_2.png)

It is important to note that the motors are not protected by the inertial damper. The dampers exist to protect the differential gears from exposure to overwhelming force by spreading that force over a longer duration of time. The motors rotate the cover of the inertial damper, and the center differential is attached to the center yolk. When a blade decelerates due to impacted debris; the motor is also slowed instantly. Because the motor is located outside the protection of the damper, it's acceleration torque actually helps the inertial damper recover sooner. Additionally, the energy stored by the spring in the damper is redirected back into the motor as additional torque during re-acceleration. 

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Output_Yolk_Assembly_Rev-A1_7-26-2026_3.png)

Everything about our blade drive system is designed to control, absorb, store, & distribute kinetic energy in the most stable & efficient way possible.

### Steel Reinforced Chassis

Every design element has been carefully selected with heavy consideration towards containing debris, managing vibration, surviving impact, & providing durability.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Half_Rev-A1_7-8-2026_1.png)

The mower chassis is comprised of a steel frame with a thickness between 3.175mm and 6.35mm. Wrapped around this steel frame is an impact resistant plastic body with a thickness between 4mm and 14mm. The average material thickness around the rotating blades is 10mm with additional plastic gussets and steel screws built into the body every 19 degrees around the circumference of the blade.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Half_Rev-A1_7-8-2026_2.png)

### Captured Blade Carrier Design

The cutting blades are made from 3.625mm thick steel flat bar. The blades rotate in opposite directions to minimize vibration and prevent build-up of gyroscopic forces that could destabilize the mower. The blades are installed via a very long grade 8 bolt which traverses a through hole in the center of the blade. This bolt is then installed into the chassis from the bottom-up through three stages of ball bearings.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Blade_Assembly_Rev-A1_7-8-2026_1.png)

Due to the length of the bolt being greater than the clearance from the blade to the ground; it is impossible for a spinning blade to "fall out" or "swing out" from underneath a running mower.

### Redundant Rollover Protection

The mower features blueprints & instructions for building dual Rollover Protection Switches which disable the mower automatically in the event that it tips over. The adjustable switches will prevent the blade motors and blades from spinning while the mower is inverted. The switches self-reset once the mower has been placed upright again.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Rollover_Safety_Assembly_Rev-A1_7-8-2026_1.png)

The switches are incredibly small, at only 30mm × 15mm × 8.5mm each. They feature a modular design with optional input/output terminals on left & right sides.

When using only one input & one output terminal, observed current is similar to a 14 AWG wire. When using both sets of terminals, observed current is similar to a 12 AWG wire. Two switches are included in this mower design, wired in series to provide double fault tolerant rollover protection.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Rollover_Safety_Assembly_Rev-A1_7-8-2026_2.png)

### Multi-Mode Self-Leveling Suspension

The mower features independent self-leveling suspension on all 4 wheels & side attachments. The suspension features prominent adjustment screws that enable the operator to quickly & easily adjust cutting height & side attachment height. The geometry of the suspension is designed to be identical between front, rear, and side suspension arms to simplify assembly & field repair.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Attachment_Arm_Assembly_Rev-A1_7-15-2026_3.png)

The geometry for the suspension is contained in modular "Ramp Inserts" which feature a reversible design. When these inserts are installed into the suspension arms in the "reversed" position, the damping behaviour of the suspension is altered significantly.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Attachment_Arm_Assembly_Rev-A1_7-15-2026_1.png)
![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Attachment_Arm_Assembly_Rev-A1_7-15-2026_2.png)

In the "**Default**" ramp insert position, the mower will "**Follow The Ground**." In this configuration the wheel will primarily travel and absorb bumps in the downward direction only. The adjustment screws that set height will set the "absolute floor" for ride-height that the suspension will not allow height to go beneath. When one wheel falls into a rut, that wheel will be allowed to gently follow the rut, and recover to its original position naturally. The default configuration allows each suspension arm to independently absorb low spots in terrain without the entire body "tilting" or the blades "digging" into the ground. The mower will seem to be "latched" to the ground. This configuration is best suited for relatively smooth lawns.

In the "**Reversed**" ramp insert position, the mower will "**Stay Level**." In this configuration the wheel will travel and absorb bumps in both the upward and downward directions. The adjustment screws that set height will set the "absolute ceiling" for ride-height that the suspension will not allow height to go above. Due to the spring rate being very low, the result is the suspension will sag somewhere in the middle of its ride height. This will allow the wheel to travel and absorb bumps in both the upward & downward directions. The adjustment screw effectively sets a middle resting position for the suspension. The reversed configuration allows each suspension arm to independently absorb high spots and low spots in extremely uneven terrain, but with greater risk for the body "tilting" or the blades "digging" into the ground. The mower will seem to be "floating" over the ground. This configuration is best suited for tall grass, uneven terrain, or heavy brush.

The same suspension logic applies to the side attachment suspension assembly. The parts and geometry are all identical, but the "Reversed" position is used as the default ramp insert configuration.

Damping is achieved via friction dampers integrated into the Attachment Adjustment Arm Crossheads. The crossheads bear the load of the suspension from the suspension arm to the adjustment screw. They feature grease pockets, grease galleries, calculated surface area & carefully crafted geometry to optimize load handling & damping characteristics in an especially reliable & cost effective way.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Attachment_Arm_Crosshead_Rev-A1_7-15-2026_1.png)

## More Screenshots

### [View All Screenshots](https://github.com/zelon88/RC_Mower_Trailer/tree/main/Screenshots)

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Assembly_Rev-A1_7-4-2026_1.png)
![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Assembly_Rev-A1_7-8-2026_1.png)
![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Assembly_Rev-A1_7-18-2026_1.png)
