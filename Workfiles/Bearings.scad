// Representative Model: Standard 5x8x2.5mm Bearing (No Flange)
module bearing_5x8x2_5() {
    id = 5.0;
    od = 8.0;
    w  = 2.5;
    color("LightSteelBlue") {
        difference() {
            cylinder(h=w, r=od/2, center=false);
            translate([0, 0, -0.5])
                cylinder(h=w + 1.0, r=id/2);
        }
    }
}

// Representative Model: 5x8x2.5mm Flanged Bearing (e.g., F685 Miniature series)
// Inner Diameter: 5.0mm | Outer Diameter: 8.0mm | Total Width: 2.5mm
// Flange Diameter: 9.2mm | Flange Thickness: 0.6mm
module flanged_bearing_5x8x2_5() {
    id = 5.0;
    od = 8.0;
    w  = 2.5;
    flange_od = 9.2;
    flange_w  = 0.6;
    
    color("LightSteelBlue") {
        difference() {
            union() {
                // Main bearing outer ring body
                cylinder(h=w - flange_w, r=od/2, center=false);
                
                // Lip layer forming the outer flange edge (built upwards on Z)
                translate([0, 0, w - flange_w])
                    cylinder(h=flange_w, r=flange_od/2, center=false);
            }
            // Master concentric bore through-hole running completely clean
            translate([0, 0, -0.5])
                cylinder(h=w + 1.0, r=id/2);
        }
    }
}


// Representative F3-6-2.8M Thrust Bearing Module
module f3_6_2_8m_bearing() {
    washer_h = 0.9;
    cage_h   = 1.0; 
    color("Silver") {
        difference() {
            cylinder(h=washer_h, r=6.0/2, center=false);
            translate([0, 0, -0.5]) cylinder(h=washer_h + 1.0, r=3.0/2);
        }
        translate([0, 0, washer_h]) difference() {
            cylinder(h=cage_h, r=5.8/2, center=false);
            translate([0, 0, -0.5]) cylinder(h=cage_h + 1.0, r=3.2/2);
        }
        translate([0, 0, washer_h + cage_h]) difference() {
            cylinder(h=washer_h, r=6.0/2, center=false);
            translate([0, 0, -0.5]) cylinder(h=washer_h + 1.0, r=3.0/2);
        }
    }
}
