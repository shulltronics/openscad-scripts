_DELTA = 0.01;

module main() {
    import("wiha_8pc_blank.stl");
}

/*
    A hole is an octogon with diameter measured 20mm up from the beginning of handle
 */
module hole(xshift=0, diameter=9) {
    $fn=8;
    translate([xshift, -_DELTA, 13])
        rotate([0, 22.5, 0])    
        rotate([-90, 0, 0])
        cylinder(4, diameter/2, diameter/2);
}

difference() {
    main();
    hole(-70, 9);
    hole(-50, 9);
    hole(-30, 9);
    hole(-10, 9);
    hole(10, 9.6);
    hole(30, 9.6);
    hole(50, 9.6);
    hole(70, 9.6);
}