// A custom mesh facade for Dell Optiplex 9020
//  By Carsten Thue-Bludworth
//  February, 2022

// CONFIGURATION CONSTANTS
$fn = 1;
$fa = 0.4;
// The overlap amount to help OpenSCAD form unions & differences
_DELTA = 0.01;

// These are the dimensions of the base solid
BASE_WIDTH  = 26;
BASE_HEIGHT = 144;
BASE_THICKNESS = 2.5;
// The area around perimeter that is to be unaltered
MARGIN = 2.5;


// Creates the base solid for our facade
module base() {
    cube([BASE_WIDTH-_DELTA, BASE_HEIGHT, BASE_THICKNESS]);;
}

// This is the number of mesh cutouts we want in the x axis
MESH_N_X = 2;
MESH_N_Y = 18;
// This is the largest dimension of an individual hole
MESH_SIZE_X = 6;
MESH_SIZE_Y = 5;
// This is the spacing between holes in order to get
//  MESH_N_X holes within the allowable area
MESH_X_SPACING = (BASE_WIDTH - 2*MARGIN - MESH_SIZE_X) / MESH_N_X;
MESH_Y_SPACING = (BASE_HEIGHT - 2*MARGIN - MESH_SIZE_Y) / MESH_N_Y;

// Creates an upside down pyramid
module pyramid_mesh() {
    $fn = 4;
    translate([MESH_SIZE_X/2, MESH_SIZE_X/2, 0])
    rotate([0, 180, 0])
    rotate([0, 0, 45])
        cylinder(5, MESH_SIZE_X/sqrt(2), 0);
}

// Create a polygon
module polygon_mesh(num_sides = 6) {
    // bounding box must be MESH_SIZE_X by MESH_SIZE_Y
    $fn = num_sides;
    translate([MESH_SIZE_X/2, MESH_SIZE_X/2, 0])
    rotate([0, 0, rands(0, 360, 1)[0]])
    linear_extrude(height=10, center = true, convexity = 10, twist = 0)
        circle(d = MESH_SIZE_X);
}

// Here is our main model
difference() {
    base();
    for(i = [0 : 1 : MESH_N_X]) {
        for(j = [0 : 1 : MESH_N_Y]) {
            translate([MARGIN + i*MESH_X_SPACING, MARGIN + j*MESH_Y_SPACING, BASE_THICKNESS+_DELTA])
                //polygon_mesh(3);
                pyramid_mesh();
        }
    }
}