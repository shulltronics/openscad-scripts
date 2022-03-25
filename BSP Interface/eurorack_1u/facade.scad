use <../../MODULES/roundedcube.scad>;

_DELTA = 0.01;

ONE_HP = 0.2*25.4;
ONE_U  = 39.65;
// approximately equal to a standard PCB thickness
THICKNESS = 1.6;
MODULE_WIDTH = 22*ONE_HP;

// the main facade body
module main() {
    cube([MODULE_WIDTH, ONE_U, THICKNESS]);
}

module mounting_hole(x_offset=0, y_offset=0) {
    $fn = 36;
    MOUNTING_HOLE_DIAMETER = 3.2;
    translate([x_offset, y_offset, THICKNESS/2])
        hull() {
            translate([-1, 0, 0])
                cylinder(THICKNESS+_DELTA, MOUNTING_HOLE_DIAMETER/2, MOUNTING_HOLE_DIAMETER/2, center=true);
            translate([1, 0, 0])
                cylinder(THICKNESS+_DELTA, MOUNTING_HOLE_DIAMETER/2, MOUNTING_HOLE_DIAMETER/2, center=true);
        }
}

// a hole for a jack, pass in the position of the center of the jack
module jack(x_offset=0, y_offset=0) {
    $fn = 36;
    JACK_DIAMETER = 6.5;
    translate([x_offset, y_offset, THICKNESS/2])
        cylinder(THICKNESS+_DELTA, JACK_DIAMETER/2, JACK_DIAMETER/2, center=true);
}

JACK_X_START   = 10;
JACK_X_SPACING = 15.5956;
JACK_Y_SPACING = 0.45*25.4;

DRUM1_X = JACK_X_START;
DRUM1_Y = (ONE_U - JACK_Y_SPACING)/2;

DRUM2_X = JACK_X_START;
DRUM2_Y = (ONE_U - JACK_Y_SPACING)/2 + JACK_Y_SPACING;

DRUM3_X = JACK_X_START + 1*JACK_X_SPACING;
DRUM3_Y = (ONE_U - JACK_Y_SPACING)/2;

DRUM4_X = JACK_X_START + 1*JACK_X_SPACING;
DRUM4_Y = (ONE_U - JACK_Y_SPACING)/2 + JACK_Y_SPACING;

DRUM5_X = JACK_X_START + 2*JACK_X_SPACING;
DRUM5_Y = (ONE_U - JACK_Y_SPACING)/2;

DRUM6_X = JACK_X_START + 2*JACK_X_SPACING;
DRUM6_Y = (ONE_U - JACK_Y_SPACING)/2 + JACK_Y_SPACING;

DRUM7_X = JACK_X_START + 3*JACK_X_SPACING;
DRUM7_Y = (ONE_U - JACK_Y_SPACING)/2;

DRUM8_X = JACK_X_START + 3*JACK_X_SPACING;
DRUM8_Y = (ONE_U - JACK_Y_SPACING)/2 + JACK_Y_SPACING;

module vga(x_offset=74, y_offset=16.561) {
    $fn = 36;
    VGA_X = 23;
    VGA_Y = 10.75;
    HOLE_DIAMETER = 3;
    translate([x_offset+VGA_X/2, y_offset, 0]) {
        translate([-HOLE_DIAMETER/2 - 12.25, 0, THICKNESS/2])
            cylinder(THICKNESS+_DELTA, HOLE_DIAMETER/2, HOLE_DIAMETER/2, center=true);
        translate([HOLE_DIAMETER/2 + 12.25, 0, THICKNESS/2])
            cylinder(THICKNESS+_DELTA, HOLE_DIAMETER/2, HOLE_DIAMETER/2, center=true);
        shull_cube([VGA_X, VGA_Y, THICKNESS+_DELTA],center=true, radius=2, apply_to="z");
    }
}

difference() {
    main();
    mounting_hole(7.5, 3);
    mounting_hole(7.5, ONE_U-3);
    mounting_hole(MODULE_WIDTH-7.5, 3);
    mounting_hole(MODULE_WIDTH-7.5, ONE_U-3);
    jack(DRUM1_X, DRUM1_Y);
    jack(DRUM2_X, DRUM2_Y);
    jack(DRUM3_X, DRUM3_Y);
    jack(DRUM4_X, DRUM4_Y);
    jack(DRUM5_X, DRUM5_Y);
    jack(DRUM6_X, DRUM6_Y);
    jack(DRUM7_X, DRUM7_Y);
    jack(DRUM8_X, DRUM8_Y);
    vga(y_offset=ONE_U/2);
}