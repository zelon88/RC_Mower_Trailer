

module Blade() {

  difference() {
    // Create the body of the blade.
    cube([135, 19.05, 3.175], center=true);
    // Cut the center hole.
    cylinder($fn=28, r=3.125, h=4, center=true); }
    
}

//Blade();