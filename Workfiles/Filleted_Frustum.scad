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

// NAME:  Filleted Frustum
// REVISION:  A5
// START DATE:  7/26/2026
// CURRENT VERSION DATE:  7/27/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Opus 5.
// DESCRIPTION:
//    Two shared helpers for the differential output yolk roller bearing.
//    Filleted_Frustum builds a solid frustum with its end corners broken to
//    fillet_r, and produces the roller itself. fillet_end selects which corners
//    are rounded: "both", or "r2" for the Z=h end alone, or "r1" for the Z=0 end
//    alone. The single ended cases derive their own tangent circle, since the
//    two corners sit at supplementary interior angles and one is not a
//    reflection of the other. The both ended case instead rounds the full
//    symmetric cross section and cuts back to the positive half afterward,
//    which keeps any rounding off the axis.
//    Race_Groove builds the cutting tool for one half of the race that the
//    roller runs in, as an annular profile that blends out to the untouched
//    surface at both ends. The yolk cuts its inner race with it and the cover
//    cuts its outer race with it, so the two halves of the race share one
//    definition and stay in agreement.
// FILE NAME: Filleted_Frustum.scad
// ----------------------------------------------------------------------------------------------------

// ----------------------------------------------------------------------------------------------------
// GEOMETRY

module Filleted_Frustum(r1, r2, h, fillet_r, extra_h=0, fillet_end="r2", fn=96, arc_steps=12) {
  // Taper lean from vertical — sign-agnostic, works whether the wall widens or
  // narrows going up. The two corners have supplementary interior angles
  // (90-theta and 90+theta), which is why each needs its own derivation below
  // rather than one being a simple reflection of the other.
  taper_dx    = r2 - r1;
  taper_len   = sqrt(taper_dx * taper_dx + h * h);
  ux          = taper_dx / taper_len;
  uz          = h / taper_len;
  taper_theta = atan2(taper_dx, h);

  if (fillet_end == "both") {
    // Round the corner at each end. The taper line, the overall height and both end
    // radii are untouched; only the two corners are broken, so a part rounded this way
    // fits anywhere the sharp-cornered version fitted and simply carries a little more
    // clearance at the corners.
    // The profile is built as the full cross section running from -r to +r and is cut
    // back to the positive half only after the rounding is done. Rounding a half profile
    // instead would put two of its corners on the axis, and offset() would round those
    // along with the rest, sinking a dimple into the centre of both end faces.
    // extra_h has no meaning here and is ignored, since neither end is left open.
    rotate_extrude($fn=fn)
      intersection() {
        offset(r=fillet_r, $fn=fn) offset(delta=-fillet_r)
          polygon(points=[[-r1, 0], [r1, 0], [r2, h], [-r2, h]]);
        translate([0, -1])
          square([max(r1, r2) + 1, h + 2]); }
  } else if (fillet_end == "r2") {
    // Fillet at the Z=h/r2 corner. Tangent point back along the tapered wall,
    // and the fillet center directly below the flat-face tangent point by fillet_r.
    corner_phi  = 90 - taper_theta;
    tangent_len = fillet_r / tan(corner_phi / 2);
    tp_wall_x = r2 - tangent_len * ux;
    tp_wall_z = h - tangent_len * uz;
    center_x  = r2 - tangent_len;
    center_z  = h - fillet_r;
    a_start   = atan2(tp_wall_z - center_z, tp_wall_x - center_x);

    rotate_extrude($fn=fn)
      polygon(points = concat(
        [[0, 0], [r1, 0]],
        [for (i = [0 : arc_steps])
          let (a = a_start + (90 - a_start) * i / arc_steps)
            [center_x + fillet_r * cos(a), center_z + fillet_r * sin(a)]],
        (extra_h > 0)
          ? [[r2, h], [r2, h + extra_h], [0, h + extra_h]]
          : [[0, h]]
      ));
  } else {
    // Fillet at the Z=0/r1 corner. Tangent point forward along the tapered
    // wall, and the fillet center directly above the flat-face tangent point
    // by fillet_r (mirror image of the r2 case in role, not in construction).
    corner_phi  = 90 + taper_theta;
    tangent_len = fillet_r / tan(corner_phi / 2);
    tp_wall_x = r1 + tangent_len * ux;
    tp_wall_z = tangent_len * uz;
    center_x  = r1 - tangent_len;
    center_z  = fillet_r;
    a_end     = atan2(tp_wall_z - center_z, tp_wall_x - center_x);

    rotate_extrude($fn=fn)
      polygon(points = concat(
        [[0, 0], [center_x, 0]],
        [for (i = [0 : arc_steps])
          let (a = -90 + (a_end - (-90)) * i / arc_steps)
            [center_x + fillet_r * cos(a), center_z + fillet_r * sin(a)]],
        (extra_h > 0)
          ? [[r2, h], [r2, h + extra_h], [0, h + extra_h]]
          : [[r2, h], [0, h]]
      ));
  }
}

module Race_Groove(base_r, fat_r, thin_r, race_h, ramp_h, run_h, back_r, fillet_r, fn=96) {
  // A cutting tool for one half of a roller race. The frustum's fat end sits at local
  // Z=0 and its thin end at local Z=race_h, so a caller positions the fat end directly.
  // That is the end the rollers are installed through, so it is the end worth anchoring.
  // The profile spans base_r on the surface side to back_r behind it and never reaches
  // the axis. The tool is therefore an annulus and is incapable of removing material
  // from the core of the part no matter how it is positioned or how tall it is made.
  // The straight runs at base_r beyond each ramp exist so that the point where the
  // groove opens onto the untouched surface is a real vertex of the profile. Without
  // them that opening is an intersection edge between two solids rather than a corner,
  // and no rounding applied to the tool can soften it.
  // Both corner senses are rounded, and they require opposite operations. Rounding the
  // tool's convex corners leaves the part a fillet at each groove root, which the
  // roller's own radiused end seats into. Rounding the tool's concave corners leaves
  // the part a round-over at each groove mouth, which is what lets a roller cross the
  // partially uncovered installation notch without catching a lip, and which spreads
  // contact load across a radius rather than an edge.
  // offset() does the rounding rather than derived tangent arcs because every segment
  // of this profile is at least 1mm long against a fillet_r a fraction of that size,
  // which leaves the erode step of each offset pair a wide margin before it could
  // collapse a segment and self-intersect the profile.
  z_bot = -ramp_h - run_h;
  z_top = race_h + ramp_h + run_h;
  rotate_extrude($fn=fn)
    offset(r=-fillet_r) offset(delta=fillet_r)
      offset(r=fillet_r) offset(delta=-fillet_r)
        polygon(points=[
          [base_r, z_bot], [base_r, -ramp_h], [fat_r, 0], [thin_r, race_h],
          [base_r, race_h + ramp_h], [base_r, z_top], [back_r, z_top], [back_r, z_bot] ]); }
// ----------------------------------------------------------------------------------------------------
