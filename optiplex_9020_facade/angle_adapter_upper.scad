// A custom mesh facade for Dell Optiplex 9020
// Angled bracked part, upper
//  By Carsten Thue-Bludworth
//  February, 2022

// CONFIGURATION CONSTANTS
$fn = 1;
$fa = 0.4;
// The overlap amount to help OpenSCAD form unions & differences
_DELTA = 0.01;

// These are the dimensions of the bracket
BASE_WIDTH        = 25.6;
BASE_HEIGHT       = 160;
BASE_THICKNESS_SM = 1.75;
BASE_THICKNESS_LG = 10.9;
WALL_THICKNESS    = 2;

// Creates the base solid for our facade
module base() {
    difference() {
        // I linear extrude the wedge
        points = [[0, 0],
                  [0, BASE_THICKNESS_LG],
                  [BASE_WIDTH, BASE_THICKNESS_LG],
                  [BASE_WIDTH, 0]
                 ];
        linear_extrude(BASE_HEIGHT)
            polygon(points);
        // and now subtract the middle
        translate([-_DELTA, -_DELTA, -_DELTA])
            cube([BASE_WIDTH-WALL_THICKNESS, BASE_THICKNESS_LG+2*_DELTA, BASE_HEIGHT-WALL_THICKNESS]);
    }
}

base();