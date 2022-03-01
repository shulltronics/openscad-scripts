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
PCB_Z = 15;
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
feather_x_offset = 5.08;
feather_y_offset = 12.7;
feather_x        = 43.18;
feather_y        = 24.13;
//  For the 3 buttons
button1_x_offset = 50;
button1_y_offset = 15;
button1_x        = 5.08;
button1_y        = 5.08;
button2_x_offset = 56;
button2_y_offset = 15;
button2_x        = 5.08;
button2_y        = 5.08;
button3_x_offset = 62;
button3_y_offset = 15;
button3_x        = 5.08;
button3_y        = 5.08;
//  For the LCD
lcd_x            = 74.6;
lcd_y            = 45;
lcd_x_offset     = (PCB_X - lcd_x)/2;
lcd_y_offset     = 42.54;

module top_cutout(x_off=0, y_off=0, x=1, y=1) {
    translate([x_off, y_off, PCB_Z-WALL_THICKNESS-_DELTA])
        cube([x, y, WALL_THICKNESS+(3*_DELTA)]);
}

// TODO: make the lower left of the PCB be at the origin,
//  offset the enclosure to quadrant 3. This way all cutout measurements
//  will be relative to PCB

// Main model
difference() {
    body();
    top_cutout(feather_x_offset, feather_y_offset, feather_x, feather_y);
    top_cutout(button1_x_offset, button1_y_offset, button1_x, button1_y);
    top_cutout(button2_x_offset, button2_y_offset, button2_x, button2_y);
    top_cutout(button3_x_offset, button3_y_offset, button3_x, button3_y);
    top_cutout(lcd_x_offset, lcd_y_offset, lcd_x, lcd_y);
}