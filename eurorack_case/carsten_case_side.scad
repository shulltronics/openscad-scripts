// Helper for OpenSCAD
_DELTA = 0.01;

// Definitions for Eurorack dimensions
ONE_HP = 25.4*0.2;
ONE_U  = 1.75*25.4;

// Maximal dimensions of the outside of the case body
OUTER_X = 3*ONE_U;
OUTER_Y = 24*ONE_HP;
OUTER_Z = 30;
// The amount by which the side overlaps the main body
SIDE_OVERLAP = 2;
// The amount by which the main body is inset into the side
SIDE_INSET = 1;

WALL_THICKNESS = 4;

difference() {
    cube([OUTER_X + 2*SIDE_OVERLAP, WALL_THICKNESS, OUTER_Z + 2*SIDE_OVERLAP]);
    translate([SIDE_OVERLAP, WALL_THICKNESS - SIDE_INSET + _DELTA, SIDE_OVERLAP])
        cube([OUTER_X, SIDE_INSET, OUTER_Z]);
}