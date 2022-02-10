// OpenSCAD Enclosure
//  By Carsten Thue-Bludworth

$fa = 1;
$fs = 0.4;

body_x  = 70;
body_y = 50;
body_z  = 15;

// Enclosure body
cube([body_x, body_y, body_z]);

// Top cutouts
co_x  = 10;
co_offset_x = 10;
co_y  = 10;
co_offset_y = 10;
co_z  =  1;
translate([0, 0, body_z])
    cutout(co_x, co_y, co_offset_x, co_offset_y);
    
translate([0, 0, body_z])
    cutout(x_off = 30, y_off = 30);
    
module cutout(x=1, y=1, x_off=0, y_off=0) {
    translate([x_off, y_off, 0])
        cube([x, y, 1]);
}