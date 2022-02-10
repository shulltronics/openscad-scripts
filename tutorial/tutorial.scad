// OpenSCAD tutorial
//  By Carsten Thue-Bludworth
//  February, 2022    
$fa = 1;
$fs = 0.4;

use <wheel.scad>

body_base_h  = 20;
body_top_h   = 10;
wheel_radius = 20;
wheel_width  = 7;

// car body base
resize([60, 20, body_base_h])
    sphere(r=10, center=true);
// car body top
translate([0, 0, ((body_base_h/2))-0.001])
resize([30, 20, body_top_h])
    sphere(r=10, center=true);

translate([-20, -10 - 0.001, 0])
    rotate([0, 0, 20])
    wheel(wheel_radius, wheel_width);

translate([-20, 10 - 0.001, 0])
    rotate([0, 0, 20])
    wheel(wheel_radius, wheel_width);