_DELTA = 0.1;

module main() {
    import("46hp_4u_Eurorack.stl");
}

ONE_HP = 25.4*0.2;

difference() {
    main();
//    translate([4, -_DELTA, -_DELTA])
//        cube([ONE_HP*20, 200, 55]);
}