// Electronics Enclosure OpenSCAD Template
//  By Carsten Thue-Bludworth

use <../MODULES/roundedcube.scad>;

// Global configuration
$fa = 1;
$fs = 0.4;
// Amount of offset to help OpenSCAD with unions and diffs
_DELTA = 0.01;
// The amount of space between the PCB edge and the inner wall of enclosure
MARGIN = 1;
// The thickness of the enclosure wall
WALL_THICKNESS = 1;
// Dimensions of the PCB
PCB_X = 70;
ENC_X_INNER = PCB_X + 2*MARGIN;
ENC_X_OUTER = PCB_X + 2*(MARGIN + WALL_THICKNESS);
PCB_Y = 50;
ENC_Y_INNER = PCB_Y + 2*MARGIN;
ENC_Y_OUTER = PCB_Y + 2*(MARGIN + WALL_THICKNESS);
PCB_Z = 15;
PCB_RADIUS = 1;

// Enclosure body
module body() {
    difference() {
        translate([0, 0, _DELTA])
            roundedcube([ENC_X_OUTER, ENC_Y_OUTER, PCB_Z], radius=PCB_RADIUS, apply_to="z");
        translate([WALL_THICKNESS, WALL_THICKNESS, 0])
            roundedcube([ENC_X_INNER, ENC_Y_INNER, PCB_Z-WALL_THICKNESS], radius=PCB_RADIUS, apply_to="z");
    }
}

// Top cutouts
co_x  = 10;
co_offset_x = 10;
co_y  = 10;
co_offset_y = 10;
co_z  =  1;

module top_cutout(x=1, y=1, x_off=0, y_off=0) {
    translate([x_off, y_off, PCB_Z-WALL_THICKNESS-_DELTA])
        cube([x, y, WALL_THICKNESS+(3*_DELTA)]);
}

// Front cutouts
f_co1_x = 16;
f_co1_x_off = 5;
f_co1_z = 7;
f_co1_z_off = 4;

f_co2_x = 23.4;
f_co2_x_off = 25;
f_co2_z = 7;
f_co2_z_off = 4;

f_co3_x = 18.2;
f_co3_x_off = 53;
f_co3_z = 7;
f_co3_z_off = 4;

module front_cutout(x=1, z=1, x_off=0, z_off=0) {
    translate([x_off, -_DELTA, z_off])
        cube([x, WALL_THICKNESS+(2*_DELTA), z]);
}

// Main model
difference() {
    body();
    //top_cutout(co_x, co_y, co_offset_x, co_offset_y);
    front_cutout(f_co1_x, f_co1_z, f_co1_x_off, f_co1_z_off);
    front_cutout(f_co2_x, f_co2_z, f_co2_x_off, f_co2_z_off);
    front_cutout(f_co3_x, f_co3_z, f_co3_x_off, f_co3_z_off);
}