use <../MODULES/roundedcube.scad>;

_DELTA = 0.01;

ONE_HP = 0.2*25.4;
ONE_U  = 39.5;  // a bit small to account for 3d print
// approximately equal to a standard PCB thickness
THICKNESS = 1.6;
MODULE_WIDTH = 10*ONE_HP;

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

module usb_bracket(x_offset, y_offset) {
    $fn = 36;
    usb_gap    = 4.7;
    usb_width  = 13.5;
    usb_height = 6.5;
    hole_left  = 18.9 + usb_gap/2;
    hole_right = 20.1 + usb_gap/2;
    hole_diameter = 3;
    translate([x_offset, y_offset, 0]) {
        // right usb cutout
        translate([usb_width/2 + usb_gap/2, 0, 0])
            cube([usb_width, usb_height, THICKNESS], center=true);
        // right mounting hole
        translate([hole_right, 0,])
            cylinder(THICKNESS, hole_diameter/2, hole_diameter/2, center=true);
        // left usb cutout
        translate([-usb_width/2 - usb_gap/2, 0, 0])
            cube([usb_width, usb_height, THICKNESS], center=true);
        // left mounting hole
        translate([-hole_left, 0, 0])
            cylinder(THICKNESS, hole_diameter/2, hole_diameter/2, center=true);
    }
}

difference() {
    main();
    // These should work for any module
    mounting_hole(7.5, 3);
    mounting_hole(7.5, ONE_U-3);
    mounting_hole(MODULE_WIDTH-7.5, 3);
    mounting_hole(MODULE_WIDTH-7.5, ONE_U-3);
    resize([0, 0, 5])
        usb_bracket(MODULE_WIDTH/2-0.8, ONE_U/2);
}