# R/C Mower Trailer — Bill of Materials

**Status: design phase.** Counts here are taken from the SCAD sources, not from a build.
Anything marked ⚠ has not been verified against a physical assembly and anything marked
❓ could not be counted from the files available. This gets rebuilt properly during the
manufacturing engineering pass, when print orientation and hardware lengths are settled.

Quantities are **per mower** unless stated otherwise.

---

## 1. Drivetrain

Fully counted from source. This is the part of the machine that is dimensionally closed —
every item below is driven by a specific feature in a specific file.

### 1.1 Center Differential — printed

| Qty | Part | File |
|---|---|---|
| 1 | Differential Housing | `Differential_Housing.scad` |
| 1 | Differential Housing Cap | `Differential_Housing_Cap.scad` |
| 1 | Core Block | `Differential_Gears.scad` → `cross_block_core()` |
| 2 | Output Gear (16T bevel, with shaft) | `Differential_Gears.scad` → `side_gear_with_shaft()` |
| 4 | Planet Gear (12T bevel) | `Differential_Gears.scad` → `planet_bevel_gear()` |

### 1.2 Center Differential — hardware

| Qty | Item | Notes |
|---|---|---|
| 10 | F3-6-2.8M thrust bearing | 8 on the planets (2 each), 2 inboard on the output gears |
| 2 | 5×8×2.5mm **flanged** ball bearing | One per output shaft, flange toward the gear |
| 2 | M2.5 wave compression washer | One per output shaft |
| 4 | M2.5 conical compression washer | One per planet, small dia toward the gear |
| 4 | M2.5 planet gear screw | Threads into the core block; use thread locker |
| 1 | M2.5 output gear through bolt ⚠ | Length not yet fixed — spans both output gears |
| — | M2.5 flat washers | **Shimmed at assembly.** Equal count each side of each planet, added until gear slack is gone. Buy generously. |
| 4 | M2.5 screw, housing to cap | Holes at X=±8 and Z=45/61 in both parts |

### 1.3 Inertia Dampers — printed (**×2 dampers**)

| Qty (each) | Qty (total) | Part | File |
|---|---|---|---|
| 1 | 2 | Output Yolk | `Differential_Output_Yolk.scad` |
| 1 | 2 | Output Yolk Cover | `Differential_Output_Yolk_Cover.scad` |
| 30 | **60** | Conical Roller Bearing | `Differential_Output_Yolk_Roller_Bearing.scad` |

The roller count is set by `roller_qty` in the yolk's assembly block. 30 gives 0.232mm of
gap between rollers on the 9.16685mm pitch radius. Print spares — they are 1.7mm across
and will be lost.

### 1.4 Inertia Dampers — hardware (**×2 dampers**)

| Qty (each) | Qty (total) | Item | Notes |
|---|---|---|---|
| 3 | 6 | 3×5×2.5mm ball bearing | Stacked at Z=0, 2.5, 5 on the yolk pin |
| 1 | 2 | 5×8×2.5mm **flanged** ball bearing | At Z=14.5 |
| 1 | 2 | 5×8×2.5mm ball bearing | At Z=14.5 |
| 2 | 4 | M1.6 screw ⚠ | Through the standoff bosses at X=±5.25. Length not yet fixed — the boss is 9.5625mm and the head recesses into the yolk. |
| 2 | 4 | M1.6 lock nut | Lands on the boss end, not on the cover cap |
| 4 | 8 | Compression spring ⚠ | "Clicky pen" springs, 2 per trapezoid face. Free length and rate not yet specified. |

### 1.5 Belt Drive

| Qty | Item | Notes |
|---|---|---|
| 2 | Motor Pulley, 19T | Printed — `Differential_Motor_Pulley.scad` |
| 2 | M2.5 set screw ⚠ | Forms its own thread in the tapered hole. ~4mm long; not yet fixed. |
| 2 | GT2 belt, **120mm** (60T), 6mm wide, closed loop | Fibreglass corded |
| — | Driven pulley, 38T | **Not a separate part** — cut into the Output Yolk Cover |

Ratio is exactly 2.000:1. Centre distance is fixed by the Center Bracket at 30.8707mm;
a 120mm belt wants 30.9083mm, so it runs 0.0376mm slack with no adjuster anywhere. Do not
substitute a 122mm belt — that wants 31.4786mm and will be visibly loose.

### 1.6 Motors

| Qty | Item | Notes |
|---|---|---|
| 2 | 540 brushed motor, "Silver Can" or equivalent | 3.175mm armature shaft **with a flat**. The pulley bore is a D and relies on it. |
| 2 | Brushed ESC ⚠ | Rating not yet specified |

---

## 2. Chassis and Body — partial

Counted where files were available. **Fastener counts here are not yet trustworthy**: many
holes are shared between mating parts, so a hole is not a screw, and several referenced
`Workfiles/` hole-pattern modules were not available to expand.

| Qty | Part | File | Confidence |
|---|---|---|---|
| 2 | Body Half | `Body_Half.scad` | counted |
| 1 | Center Bracket | `Center_Bracket.scad` | counted |
| 2 | Center Bracket Support | `Center_Bracket_Support.scad` | counted |
| 1 | Clippings Exhaust Header | `Clippings_Exhaust_Header.scad` | counted |
| ❓ | Body Skirt | `Body_Skirt.scad` | not available |
| ❓ | Body Stiffener, Inner / Outer / Center | `Body_Stiffener_*.scad` | not available |
| ❓ | Center Bracket Skid Plate | referenced in Body Half Assembly | not available |
| ❓ | Hopper Base, Hopper Bracket | referenced in Body Half Assembly | not available |
| ❓ | Attachment Hinge Boss | referenced in Body Half Assembly | not available |

### Steel stock

| Item | Notes |
|---|---|
| Flat bar, 3.175mm (1/8") | Chassis rails, X and Y slots in the torus base. Slot is 25.6mm wide × 3.175mm. |
| Flat bar, 3.175mm (1/8") | Cutting blades ❓ — length and count not counted |

---

## 3. Not yet counted

These need their files before anything honest can be said about them:

- **Blade carriers** — README calls for R4 bearings (1/4" ID × 1/2" OD × 3/16"), quantity unknown
- **Blade retention bolts** — grade 8, "longer than ground clearance"; length not fixed
- **Suspension** — Attachment Adjustment Arms, ramp inserts, crossheads, springs, adjustment screws
- **Rollover Safety Switches** — 2 off, plus their gravity pins, castle nuts and terminals
- **Wheels** — 4× 1.9" or 2.2" R/C
- **Servos** — 2× standard 1/10 scale
- **Batteries** — 2× standard R/C
- **Hoppers** and their dump mechanism
- **General fasteners** — M2.5 / M3 / M5 screws, nuts, washers, lock washers across the whole machine

---

## 4. Open questions for the manufacturing pass

1. **Screw lengths are unspecified throughout.** Every ⚠ above is a length that needs
   measuring off an assembled stack rather than guessing from the model.
2. **The damper spring rate is undefined.** Preload sets the ±15° deflection behaviour,
   and the spring is currently described only as "clicky pen spring".
3. **Roller count is a design choice, not a constraint.** 30 was chosen for spacing; more
   would spread the preload further, up to about 36 before they touch.
4. **The GT2 tooth profile is unverified.** It is the one set of numbers in the drivetrain
   taken from an external source rather than derived. Fit a real belt to a printed pulley
   before committing to a print run.
5. **Damper bearings are absent from the README requirements list.** It currently
   attributes 10 thrust and 2 flanged bearings to the differential only, which is correct
   as far as it goes, but the 6 + 2 + 2 in section 1.4 are additional and unlisted.
