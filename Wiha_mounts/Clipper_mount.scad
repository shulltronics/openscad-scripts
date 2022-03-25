_DELTA = 0.01;

module main() {
    import("Wiha_8pc_blank.stl");
}

CUTOUT_X = 49.2;
OFFSET_X = 47-CUTOUT_X/2;
CUTOUT_Y = 3.1;
CUTOUT_Z = 12;
OFFSET_Z = (13-CUTOUT_Z/2);

difference() {
    main();
    translate([OFFSET_X, 0, OFFSET_Z])
        cube([CUTOUT_X, CUTOUT_Y, CUTOUT_Z]);
    translate([-OFFSET_X-CUTOUT_X, 0, OFFSET_Z])
        cube([CUTOUT_X, CUTOUT_Y, CUTOUT_Z]);
}