// A custom mesh facade for Dell Optiplex 9020
// Angled bracked part
//  By Carsten Thue-Bludworth
//  February, 2022

// CONFIGURATION CONSTANTS
$fn = 1;
$fa = 0.4;
// The overlap amount to help OpenSCAD form unions & differences
_DELTA = 0.01;

// These are the dimensions of the bracket
BASE_WIDTH  = 23;
BASE_HEIGHT = 115;
BASE_THICKNESS = 7.4;
WALL_THICKNESS = 1;

// Creates the base solid for our facade
module base() {
    difference() {
        // I linear extrude the wedge
        points = [[0, 0],
                  [BASE_WIDTH, 0],
                  [BASE_WIDTH, BASE_THICKNESS]
                 ];
        linear_extrude(BASE_HEIGHT)
            polygon(points);
        // and now subtract the middle
        translate([0, -_DELTA, WALL_THICKNESS])
            cube([BASE_WIDTH-WALL_THICKNESS, BASE_THICKNESS, BASE_HEIGHT-2*WALL_THICKNESS]);
    }
}

base();