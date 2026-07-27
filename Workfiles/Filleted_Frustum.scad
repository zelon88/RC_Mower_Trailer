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
// REVISION:  A2
// START DATE:  7/26/2026
// CURRENT VERSION DATE:  7/26/2026
// AUTHOR:  Justin Grimes (@zelon88) & Claude Sonnet 5.
// DESCRIPTION:
//    Shared helper producing a frustum (r1 at Z=0, r2 at Z=h) with one end's
//    corner rounded to fillet_r instead of left sharp. Used by the roller bearing
//    and by the yolk/cover race cuts so all three share one fillet radius and one
//    source of truth for the profile math. Works identically for outward tapers
//    (r2>r1, the roller) and inward tapers (r2<r1, the race grooves).
//    fillet_end selects which corner gets rounded: "r2" (default, Z=h) or "r1"
//    (Z=0). Both are derived directly from their own tangent-circle geometry —
//    the r1 case is NOT built by mirroring the r2 case. A mirror() reflection
//    flips the winding/normal direction of every face in the mirrored solid,
//    which is exactly the kind of thing that can make a boolean subtraction (or
//    its preview) render a round-over as a concave notch instead — so each end
//    gets its own from-scratch derivation instead of trusting a reflection.
//    An optional extra_h continues the shape past whichever end is NOT filleted,
//    as a straight constant-radius cylinder, for cutting tools that need to
//    overshoot an outer clipping boundary without moving the fillet off position.
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

  if (fillet_end == "r2") {
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
// ----------------------------------------------------------------------------------------------------