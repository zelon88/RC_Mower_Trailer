# RC_Mower_Trailer

## WORK IN PROGESS!!!

A set of SCAD models to 3D Print & Manufacture your own tow-behind lawn mower for R/C trucks.

## Features At-A-Glance

* A hybrid assembly consisting of 3D printed & manufactured parts.
* Complete with detailed manufacturing & assembly instructions.
* Dual counter-rotating motors for exceptional torque & smoothness.
* Dual counter-rotating cutting blades for smooth, balanced operation.
* Differential gearbox provides rotational shock damping properties while ensuring both motors send power to both blades.
* Uses standard 540 brushed R/C motors, 1/10th scale R/C servos, standard R/C batteries, & 1.9" or 2.2" R/C wheels.
* Highly modular design with many interchangable parts makes repairs simple & inexpensive.
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

The rotation of the motors is joined via a Center Differential. This linked-rotation configuration allows for the equalization of impacts or over-torque events between both blades & both motors. The rotation of the blades being linked together means one blade acts as a flywheel & intertial damper for the other. It also means faster blade speed recovery after an impact, as each blade has torque from both motors. Finally, when our system impacts heavy debris; not all energy is lost like in separate blade systems. In our system, the impact energy is transferred to the opposite blade, actually increasing it's velocity. This temporary over-speed condition acts as an intertial "capacitor" that stores energy to be distributed back to the slower blade via the center differential.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Differential_Assembly_Rev-A1_7-15-2026_1.png)

The differential itself is a modular 3D printable planetary unit measuring 21mm x 21mm x 21mm. It's assembly consists of 2 Output gears, 4 Planet Gears, & a core block. The assembly is supported by 10x thrust ball bearings, & 2 flanged ball bearings. Great care has been taken in the design to ensure the differential assembly is isolated from shock, over-torque conditions, or unsupported side-loads.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Differential_Assembly_Rev-A1_7-15-2026_2.png)

To compare; in systems with fully separate blade drive systems the energy contained within any blade is only equal to that of the mass of one blade. In our system; each blade contains the full potential energy of both rotating blades. When our system impacts heavy debris our blades keep more of their velocity and stability.

### Steel Reinforced Chassis

Every design element has been carefully selected with heavy consideration towards containing debris, managing vibration, surviving impact, & providing durability.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Half_Rev-A1_7-8-2026_1.png)

The mower chassis is comprised of a steel frame with a thickness between 3.175mm and 6.35mm. Wrapped around this steel frame is an impact resistant plastic body with a thickness between 4mm and 14mm. The average material thickness around the rotating blades is 10mm with additional plastic gussets and steel screws built into the body every 19 degrees around the circumfrence of the blade. 

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Half_Rev-A1_7-8-2026_2.png)

### Captured Blade Carrier Design

The cutting blades are made from 3.625mm thick steel flat bar. The blades rotate in opposite directions to minimize vibration and prevent build-up of gyroscopic forces that could destabilize the mower. The blades are installed via a very long grade 8 bolt which traverses a through hole in the center of the blade. This bolt is then installed into the chassis from the bottom-up through three stages of ball bearings.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Blade_Assembly_Rev-A1_7-8-2026_1.png)

Due to the length of the bolt being greater than the clearance from the blade to the ground; it is impossible for a spinning blade to "fall out" or "swing out" from underneath a running mower.

### Redundant Rollover Protection

The mower features blueprints & instructions for building dual "Rollover Protection Switches" which disable the mower automatically in the event that it tips over. The adjustable switches will prevent the blade motors and blades from spinning while the mower is inverted. The switches self-reset once the mower has been placed upright again.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Rollover_Safety_Assembly_Rev-A1_7-8-2026_1.png)

The switches are incredibly small, at only 30mm x 15mm x 8.5mm each. They feature a modular design with optional input/output terminals on left & right sides. 

When using only one input & one output terminal observed current is similar to a 14 AWG wire. When using both sets of terminals observed current is similar to a 12 AWG wire. Two swiches are included in this mower design, wired in series to provide double fault tolerant rollover protection.

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Rollover_Safety_Assembly_Rev-A1_7-8-2026_2.png)

### Self Leveling Suspension

The mower features independant self-leveling suspension on all 4 wheels & side attachments. The suspension features prominent adjustment screws that enable the operator to quickly & easily adjust cutting height & side attachment height. The geometry of the suspension is designed to be identical between the front, rear, and side suspension arms to simplify the assembly.

The geometry for the suspension is contained in modular "Ramp Inserts" which feature a reversible design. When these inserts are installed into the suspension arms in the "reversed" position, the damping behaviour of the suspension is altered significantly.

In the "**Default**" ramp insert position, the mower will "**Follow The Ground**." In this configuration the wheel will primarily travel and absorb bumps in the downward direction only. The adjusment screws that set height will set the "absolute floor" for ride-height that the suspension will not allow height to go beneath. When one wheel falls into a rut, that wheel will be allowed to gently follow the rut, and recover to it's original position natuarally. This default configuration allows each suspension arm to independently absorb low spots in terrain without the entire body "tilting" or the blades "digging" into the ground. The mower will seem to be "latched" to the ground. This configuration is best suited for relatively smooth lawns.

In the "**Reversed**" ramp insert position, the mower will "**Stay Level**." In this configuration the wheel will travel and absorb bumps in the both the upward and downward directions. The adjusment screws that set height will set the "absolute ceiling" for ride-height that the suspension will not allow height to go above. Due to the spring rate being very low, the result is the suspension will sag somewhere in the middle of it's ride height. This will allow the wheel to travel in both directions, with the screw effectively setting a middle resting position for the suspension. This reversed configuration allows each suspension arm to independently absorb high spots and low spots in extremely uneven terrain, but with with greater risk for the body "tilting" or the blades "digging" into the ground. The mower will seem to be "floating" over the ground. This configuration is best suited for tall grass, uneven terrain, or heavy brush.

The same suspension logic applies to the side attachment suspension assembly. The parts and geometry is all identical, but the "Reversed" is used as the default ramp insert position..

## More Screenshots

### [View All Screenshots](https://github.com/zelon88/RC_Mower_Trailer/tree/main/Screenshots)

![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Assembly_Rev-A1_6-10-2026_1.png)
![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Assembly_Rev-A1_7-4-2026_1.png)
![R/C Mower Trailer](https://github.com/zelon88/RC_Mower_Trailer/blob/main/Screenshots/Body_Assembly_Rev-A1_7-8-2026_1.png)