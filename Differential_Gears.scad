// Assembly Instructions:
// 1. Slide an M3 Compression Washer & a Flanged 5x8mm Bearing onto the the Output Shaft of an Output Gear.
//  1-A. The flange of the bearing should be facing the gear.
//  1-B. The small diameter of the Compression Washer should face towards the bearing.
//  1-C. The large diameter of the Compression Washer should face towards the Output Gear.
// 2. Install one Output Gear into the Differential Housing.
// 3. Slide the Output Gear through bolt through the housing and output gear, but do not install the nut.
// 4. Slide the Core Block over the Output Gear through bolt. 
//  4-A. Take care to install the Core Block in the proper orientation.
// 5. Install the Planet Gears into the housing with two F3-6-2.8M Thrust Bearings per gear, one per side.
//  5-A. Each Planet Gear should have 2 bearings each.
// 6. Install one M3 Compression Washer on the outside face of the outer F3-6-2.8M thrust bearing on each Planet Gear.
//  6-A. The small diameter of the Compression Washer should face towards the Planet Gear.
//  6-B. The large diameter of the Compression Washer should face towards the bearing.
// 7. Test fit each of the 4 Planet Gear Screws through each Planet Gear.
//  7-A. Install equal number of flat washers on each side of each planet screw until there is no more slack in the gears.
//  7-B. Each Planet Gear screws should pass through;
//   7-B - Differential Housing, 
//   7-B - Compression Washer, 
//   7-B - a F3-6-2.8M Thrust Bearing, 
//   7-B - a Planet Gear, 
//   7-B - another F3-6-2.8M Thrust Bearing, 
//   7-B - an equal amount of flat washers on either side of the thrust bearings, 
//   7-B - and finally thread snugly into the Core Block.
//  7-C Apply a tiny amount of liquid thread locker onto the Planet Gear screws prior to final assembly.
// 8. Slide an M3 Compression Washer & a Flanged 5x8mm Bearing onto the the Output Shaft of the remaining Output Gear.
//  8-A. The flange of the bearing should be facing the gear.
//  8-B. The small diameter of the Compression Washer should face towards the bearing.
//  8-C. The large diameter of the Compression Washer should face towards the Output Gear.
// 9. Slide the second Output Gear onto the Output Gear bolt.
// 10. Install the Differential Gear Cover.
//  10-A. The cover rotates to lock into place.
//  10-B. The cover is fully seated & locked into place when all Differential Housing screw holes are fully lined up.
// 11. Install the Differential Housing into the Center Bracket.
// 12. Install the Differential Housing mounting screws.

// Include the specific script requested
include <Workfiles/Gears.scad>;
include <Workfiles/Bearings.scad>;

// --- MANDATORY GEOMETRY CONSTRAINTS ---
// The following variables are a reference to the clearance allowed inside the Differential Housing.

// The maximum hypothetical diameter that all moving parts must stay within.
// Applies strictly to the internal gears.
max_diameter = 21.75;
// The maximum width that all moving parts must stay within.
// Applies strictly to the internal gears.
max_width = 14.50;

// --- BASIC CONSTRAINTS ---
// The following variables are adjustable and from the dimensional requirements of the assembly.
// Changes to these variables will require significant adjustment to integrate.

// The diameter of the Output Shafts, measured in mm.
output_shaft_dia = 5.0;
// The diameter of the Planet Shafts, measured in mm.
planet_shaft_dia = 6.0;
// Extension distance beyond the housing constraints for bearings/casings, measured in mm.
shaft_extension = 5.0; 
// Offset the 5x8 bearings outward or inward along the Output Shafts, measured in mm.
bearing_offset = 5.75; 
// Adjust mesh clearance.
mesh_clearance = 0.45; 

// --- CALCULATED PARAMETERS ---
// The following variables are derived from the dimensional requirements of the assembly.
// Changes to these variables will require significant geometric adjustments to integrate.

// The number of teeth on each Output Gear.
side_teeth = 16;
// The number of teeth on each Planet Gear.
planet_teeth = 12;
// The space between each tooth, measured in mm.
mm_per_tooth = 3.0;
// The total number of Planet Gears.
num_planets = 4;
// The width of the flats cut into the Output Shafts, measured in mm.
flat_width = 2.50;
// Expanded addendum calculation to let the tooth shapes grow longer
addendum = (mm_per_tooth / 3.14159265) * 1.5;
// The diameter of the Output Gears, measured in mm.
side_pd   = (side_teeth * mm_per_tooth) / 3.14159265;   // ~15.28mm
// The diameter of the Planet Gears, measured in mm..
planet_pd = (planet_teeth * mm_per_tooth) / 3.14159265; // ~11.46mm
// The face width of the gear teeth, measured in mm.
gear_h = 3.0;
// Calculate scaling factor for tapering teeth toward the apex.
side_outer_r = side_pd / 2;
side_inner_r = side_outer_r - gear_h;
side_scale   = side_inner_r / side_outer_r;
planet_outer_r = planet_pd / 2;
planet_inner_r = planet_outer_r - gear_h;
planet_scale   = planet_inner_r / planet_outer_r;
// The distance from origin including clearance padding.
side_distance   = (planet_pd / 2) + mesh_clearance; 
planet_distance = (side_pd / 2) + mesh_clearance;   
// Dynamic calculation ensuring the shaft fills the main housing boundary and adds the extension specified above.
total_shaft_len = ((max_width / 2) - side_distance) + shaft_extension;
// Cap the flat size at 99% of theOutput Shaft width to prevent the flat width from exceeding the shaft diameter.
safe_flat_width = min(flat_width, output_shaft_dia * 0.99);
// MATHEMATICAL COMPASS OFFSET: Symmetrically tracks cutting depth to guarantee flat footprint matches flat_width cleanly
flat_cut_offset = sqrt(pow(output_shaft_dia / 2, 2) - pow(safe_flat_width / 2, 2));
// Set the rendering resolution for the entire assembly.
$fn = 128; 

// ====================================================================
// MODULES
// ====================================================================


// Central alignment core block taking up internal space
module cross_block_core() {
    color("DarkGray") {
        difference() {
            // Main solid bounding cube derived from exact face metrics
            cube([6.58, 6.36, 6.58], center=true);
            
            // 1. Through-hole along Y-Axis (Hardcoded explicit matrix)
            rotate([0, 90, 0])
                cylinder(h=10, r=1.43, center=true);
                
            // 2. Through-hole along X-Axis (Hardcoded explicit matrix)
            rotate([90, 0, 0])
                cylinder(h=10, r=1.43, center=true);
                
            // 3. Through-hole along Z-Axis (Concentric hole for vertical planet pair)
            translate([0, 0, 0]) cylinder(h=10, r=1.43, center=true);


            
            // 1. Through-hole along Y-Axis (Hardcoded explicit matrix)
            translate([4, 0, 0]) rotate([0, 90, 0])
                cylinder(h=2, r=3.02, center=true);
            translate([-4, 0, 0]) rotate([0, 90, 0])
                cylinder(h=2, r=3.02, center=true);
                
            // 2. Through-hole along X-Axis (Hardcoded explicit matrix)
            translate([0, 4, 0]) rotate([90, 0, 0])
                cylinder(h=2, r=3.02, center=true);
            translate([0, -4, 0]) rotate([90, 0, 0])
                cylinder(h=2, r=3.02, center=true);

            // 3. Through-hole along Z-Axis (Concentric hole for vertical planet pair)
            translate([0, 0, 4]) cylinder(h=2, r=3.02, center=true);
            translate([0, 0, -4]) cylinder(h=2, r=3.02, center=true);
        }
    }
}

// Base Bevel Generator: Large diameter at Z=0, tapering to small diameter at Z=gear_h
module side_gear_with_shaft() {
    difference() {
        union() {
            difference() {
                union() {
                    // Main tapered cone body
                    cylinder(h=gear_h, r1=side_outer_r - 0.6, r2=side_inner_r - 0.6, center=false);
                    
                    // Decoupled Extended Output Shaft projecting through core and extra 10mm extension
                    translate([0, 0, -total_shaft_len])
                        cylinder(h=total_shaft_len, r=output_shaft_dia/2, center=false);
                }
                
                // Symmetrical flat cutting blocks using safe calculated offset distance
                translate([flat_cut_offset + (output_shaft_dia / 2), 0, -total_shaft_len / 2])
                    cube([output_shaft_dia, output_shaft_dia * 2, total_shaft_len + 2], center=true);
                    
                translate([-(flat_cut_offset + (output_shaft_dia / 2)), 0, -total_shaft_len / 2])
                    cube([output_shaft_dia, output_shaft_dia * 2, total_shaft_len + 2], center=true);
            }
            
            // Tapered Bevel Teeth
            intersection() {
                cylinder(h=gear_h, r1=side_outer_r + addendum, r2=side_inner_r + (addendum * side_scale), center=false);
                
                linear_extrude(height=gear_h, twist=0, scale=side_scale)
                    projection(cut = true) 
                        translate([0, 0, -0.5])
                            gear(number_of_teeth=side_teeth, mm_per_tooth=mm_per_tooth, thickness=2, center=true);
            }
        }
        
        // Final master cylindrical bore cutout (r=1.5)
        translate([0, 0, -(total_shaft_len + gear_h)])
            cylinder(h=(total_shaft_len + gear_h) * 2, r=1.5);
            
        // Shallower recess cut into narrow inside face (Z=gear_h plane) for Y-axis thrust bearing
        // Decreased to 0.8mm deep to add strength back to the gear hub
        translate([0, 0, gear_h - 0.8])
            cylinder(h=1.0, r=6.1/2, center=false);
    }
}

module planet_bevel_gear() {
    difference() {
        union() {
            difference() {
                cylinder(h=gear_h, r1=planet_outer_r - 0.6, r2=planet_inner_r - 0.6, center=false);
                translate([0, 0, -1])
                    cylinder(h=gear_h + 2, r=planet_shaft_dia/2);
            }
            intersection() {
                cylinder(h=gear_h, r1=planet_outer_r + addendum, r2=planet_inner_r + (addendum * planet_scale), center=false);
                linear_extrude(height=gear_h, twist=0, scale=planet_scale)
                    projection(cut = true) 
                        translate([0, 0, -0.5])
                            gear(number_of_teeth=planet_teeth, mm_per_tooth=mm_per_tooth, thickness=2, center=true);
            }
        }
        translate([0, 0, -2])
            cylinder(h=gear_h + 4, r=1.5);
            
        translate([0, 0, -0.1])
            cylinder(h=1.1, r=6.1/2); 
        translate([0, 0, gear_h - 1.0])
            cylinder(h=1.1, r=6.1/2);
    }
}

module Differential_Assembly() {
    // 1. Core Manifold Block (Locks center vacancy)
    cross_block_core();

    // 2. Right Side Gear (Positioned along +Y, pointing toward center)
    translate([0, side_distance, 0])
        rotate([90, 0, 0]) // Hardcoded explicit matrix
            side_gear_with_shaft();

    // 2B. Right Output Bearing (Standard unflanged version, adjusted along +Y)
    translate([0, side_distance + bearing_offset, 0])
        rotate([90, 0, 0]) // Hardcoded explicit matrix
            flanged_bearing_5x8x2_5();
            
    // Right Inner Thrust Bearing (Seated 2.0mm inside the block face along Y)
    translate([0, 2, 0])
        rotate([0, 90, 90]) // Hardcoded explicit matrix
            f3_6_2_8m_bearing();

    // 3. Left Side Gear (Positioned along -Y, pointing toward center)
    translate([0, -side_distance, 0])
        rotate([-90, 0, 0]) // Hardcoded explicit matrix
            side_gear_with_shaft();

    // 3B. Left Output Bearing (Standard unflanged version, adjusted along -Y)
    translate([0, -(side_distance + bearing_offset), 0])
        rotate([-90, 0, 0]) // Hardcoded explicit matrix
            flanged_bearing_5x8x2_5();
            
    // Left Inner Thrust Bearing (Seated 2.0mm inside the block face along Y)
    translate([0, -2, 0])
        rotate([0, 90, -90]) // Hardcoded explicit matrix
            f3_6_2_8m_bearing();

    // 4. 4x Cross-Planet Bevel Gears & Bearing Stacks (Arranged in the X-Z plane)
    for (i = [0 : num_planets - 1]) {
        angle = i * (360 / num_planets);
        rotate([0, angle, 0]) {
            
            translate([0, 0, planet_distance])
                rotate([180, 0, 0]) // Hardcoded explicit matrix
                    planet_bevel_gear();
            
            translate([0, 0, planet_distance - gear_h - 2.8 + 1.0]) 
                f3_6_2_8m_bearing();
                
            translate([0, 0, planet_distance - 1.0]) 
                f3_6_2_8m_bearing();
        }
    }
}

// ====================================================================
// --- MAIN ASSEMBLY ---
// ====================================================================

// Render the object for printing.
// Comment or uncomment as needed.
// The Bevel Gears.
//translate([19.5, 4, 0]) rotate([0, 0, 12.5]) planet_bevel_gear();
//translate([-19.5, 4, 0]) rotate([0, 0, -12.5]) planet_bevel_gear();
//translate([7.5, 7.5, 0]) planet_bevel_gear();
//translate([-7.5, 7.5, 0]) planet_bevel_gear();
// The Output Gears.
//translate([10, -7.5, gear_h]) rotate([0, 180, 0]) side_gear_with_shaft();
//translate([-10, -7.5, gear_h]) rotate([0, 180, 0]) side_gear_with_shaft();
// The Core Block.
//translate([0, 0, 6.58 / 2]) rotate([0, 0, 45]) cross_block_core();


// Render the object.
// Comment or uncomment as needed.
Differential_Assembly();
