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
BASE_WIDTH        = 10.9;
BASE_HEIGHT       = 114;
WALL_THICKNESS    = 2;

// Creates the base solid for our facade
module base() {
    cube([BASE_WIDTH, BASE_HEIGHT, WALL_THICKNESS]);
}

base();