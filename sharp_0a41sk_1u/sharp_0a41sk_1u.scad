use <../MODULES/roundedcube.scad>;

_DELTA = 0.01;

ONE_HP = 0.2*25.4;
ONE_U  = 39.65;
// approximately equal to a standard PCB thickness
THICKNESS = 1.6;
MODULE_WIDTH = 12*ONE_HP;

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

CV1_X = JACK_X_START;
CV1_Y = ONE_U/2;

module sharp_sensor(x_offset, y_offset) {
    $fn = 36;
    width = 28;
    height = 7.5;
    hole_spacing = 37;
    hole_diameter = 3;
    translate([x_offset, y_offset, THICKNESS/2]) {
        cube([width, height, THICKNESS+_DELTA], center=true);
        translate([-hole_spacing/2, 0, 0])
            cylinder(THICKNESS+_DELTA, hole_diameter/2, hole_diameter/2, center=true);
        translate([hole_spacing/2, 0, 0])
            cylinder(THICKNESS+_DELTA, hole_diameter/2, hole_diameter/2, center=true);
    }
}

difference() {
    main();
    // These should work for any module
    mounting_hole(7.5, 3);
    mounting_hole(7.5, ONE_U-3);
    mounting_hole(MODULE_WIDTH-7.5, 3);
    mounting_hole(MODULE_WIDTH-7.5, ONE_U-3);
    jack(8, ONE_U/2);
    sharp_sensor(36, ONE_U/2 + 2.5);
}