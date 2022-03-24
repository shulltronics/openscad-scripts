_DELTA = 0.01;

module main() {
    import("Wiha_5pc_blank.stl");
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
    hole(-40, 9);
    hole(-20, 9);
    hole(  0, 9);
    hole( 20, 9.8);
    hole( 40, 9.8);
}