// Helper for OpenSCAD
_DELTA = 0.01;

// Definitions for Eurorack dimensions
ONE_HP = 25.4*0.2;
ONE_U  = 1.75*25.4;

// thickness of the case bottom
BOTTOM_THICKNESS = 4;
// thickness of the case front and back (includes module mounting holes)
SIDE_THICKNESS = 6;

// The amount by which the main body is inset into the side
SIDE_INSET = 1;
// Maximal dimensions of the outside of the case body
//  These are also used to define the dimensions of the sides
OUTER_X = 3*ONE_U;
OUTER_Y = 24*ONE_HP + 2*SIDE_INSET;
OUTER_Z = 30;

module body() {
    difference() {
        cube([OUTER_X, OUTER_Y, OUTER_Z]);
        translate([SIDE_THICKNESS, -_DELTA, BOTTOM_THICKNESS+_DELTA])
            cube([OUTER_X - 2*SIDE_THICKNESS, OUTER_Y + 2*_DELTA, OUTER_Z - BOTTOM_THICKNESS]);
    }
}

LIP_THICKNESS = 2;
module lip() {
    translate([0, SIDE_INSET, 0])
        cube([LIP_THICKNESS, OUTER_Y - 2*SIDE_INSET, LIP_THICKNESS]);
}

body();
translate([0, 0, OUTER_Z])
    lip();
translate([OUTER_X-LIP_THICKNESS, 0, OUTER_Z])
    lip();
