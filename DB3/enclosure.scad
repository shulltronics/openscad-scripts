// Electronics Enclosure OpenSCAD Template
//  By Carsten Thue-Bludworth

use <MODULES/roundedcube.scad>;

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
PCB_X = 81.25;
ENC_X_INNER = PCB_X + 2*MARGIN;
ENC_X_OUTER = PCB_X + 2*(MARGIN + WALL_THICKNESS);
PCB_Y = 90;
ENC_Y_INNER = PCB_Y + 2*MARGIN;
ENC_Y_OUTER = PCB_Y + 2*(MARGIN + WALL_THICKNESS);
PCB_Z = 20;
PCB_RADIUS = 2.5;

// Enclosure body
module body() {
    difference() {
        translate([-(MARGIN + WALL_THICKNESS), -(MARGIN + WALL_THICKNESS), _DELTA])
            roundedcube([ENC_X_OUTER, ENC_Y_OUTER, PCB_Z], radius=PCB_RADIUS, apply_to="z");
        translate([-MARGIN, -MARGIN, 0])
            roundedcube([ENC_X_INNER, ENC_Y_INNER, PCB_Z-WALL_THICKNESS], radius=PCB_RADIUS, apply_to="z");
    }
}

// Top cutouts
//  This is for the stackable featherwing
//  TODO: make sure this is right
feather_x_offset = 0;
feather_y_offset = 12.7;
feather_x        = 51.2;
feather_y        = 23.4;
feather_r        = 2.5;
//  For the 3 buttons
button1_x_offset = 54.2;
button1_y_offset = 13.6;
button1_x        = 5.08;
button1_y        = 5.08;
button2_x_offset = 61.8;
button2_y_offset = 13.6;
button2_x        = 5.08;
button2_y        = 5.08;
button3_x_offset = 69.4;
button3_y_offset = 13.6;
button3_x        = 5.08;
button3_y        = 5.08;
button_r         = 1;
//  For the LCD
lcd_x            = 64;
lcd_y            = 36.5;
lcd_x_offset     = (PCB_X - lcd_x)/2;
lcd_y_offset     = 47.2;

module top_cutout(x_off=0, y_off=0, x=1, y=1, _radius=0) {
    translate([x_off, y_off, PCB_Z-WALL_THICKNESS-_DELTA])
        if (_radius == 0) {
            cube([x, y, WALL_THICKNESS+(3*_DELTA)]);
        } else {
            roundedcube([x, y, WALL_THICKNESS+(3*_DELTA)], radius=_radius, apply_to="z");
        }
}

// Create a cutout on the left side of width y and height h,
// offset from PCB lower left by y.
module left_cutout(y_off, y, h) {
    translate([-WALL_THICKNESS-MARGIN-_DELTA, y_off - y/2, PCB_Z - h +2*_DELTA])
        cube([WALL_THICKNESS+2*MARGIN, y, h]);
}

// Make a mounting hole with specified radius, with the center offset from
// PCB lower left by specified amount
module mounting_hole(x_center_off, y_center_off, radius=1.5) {
    translate([x_center_off, y_center_off, PCB_Z-(WALL_THICKNESS/2)-_DELTA])
        cylinder(2*WALL_THICKNESS+(2*_DELTA), r=radius, center=true);
}

// TODO: make the lower left of the PCB be at the origin,
//  offset the enclosure to quadrant 3. This way all cutout measurements
//  will be relative to PCB

// Main model
difference() {
    body();
    top_cutout(feather_x_offset, feather_y_offset, feather_x, feather_y, _radius=feather_r);
    left_cutout(feather_y_offset+(feather_y/2), 10, 3.81);
    top_cutout(button1_x_offset, button1_y_offset, button1_x, button1_y, _radius=button_r);
    top_cutout(button2_x_offset, button2_y_offset, button2_x, button2_y, _radius=button_r);
    top_cutout(button3_x_offset, button3_y_offset, button3_x, button3_y, _radius=button_r);
    top_cutout(lcd_x_offset, lcd_y_offset, lcd_x, lcd_y, _radius=1);
    mounting_hole(3.81, 3.81);
    mounting_hole(PCB_X-3.81, 3.81);
}