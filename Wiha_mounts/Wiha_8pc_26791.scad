_DELTA = 0.01;

module main() {
    import("wiha_8pc_blank.stl");
}

module hole(xshift=0) {
    $fn=8;
    translate([xshift, -_DELTA, 12.5])
        rotate([0, 22.5, 0])    
        rotate([-90, 0, 0])
        cylinder(4, 4.5, 4.5);
}

difference() {
    main();
    hole(-70);
    hole(-50);
    hole(-30);
    hole(-10);
    hole(70);
    hole(50);
    hole(30);
    hole(10);
}