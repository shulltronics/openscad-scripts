$fa = 1;
$fs = 0.4;

BASE_WIDTH = 40;
BASE_DEPTH = 40;

NUM_SPHERES = 100;
SPHERE_MIN_R = 1;
SPHERE_MAX_R = 2;

// generate randomly positioned spheres
xs = rands(1, 2, NUM_SPHERES);
ys = rands(1, 2, NUM_SPHERES);
zs = rands(1, 2, NUM_SPHERES);
rs = rands(SPHERE_MIN_R, SPHERE_MAX_R, NUM_SPHERES);
positions = [
    for(i = [0 : NUM_SPHERES-1])
        [rands(0.3, 3, 1)[0], rands(0.3, 3, 1)[0], 0]
];

difference() {
    translate([-BASE_WIDTH/2, -BASE_DEPTH/2, 0])
        cube([BASE_WIDTH, BASE_DEPTH, 1-0.01]);
    for(i = [-(BASE_WIDTH/2 - 2) : 3 : BASE_WIDTH/2 - 2]) {
        for(j = [-(BASE_DEPTH/2 - 2) : 3 : BASE_DEPTH/2 - 2]) {
            translate([i, j, -0.003])
                if (rands(0, 2, 1)[0] < 1)
                    square_cutout(rands(1, 2, 1)[0], rands(1, 2, 1)[0]);
        }
    }
}

// Returns distance between two 3D points
function distance(p0, p1) =
    sqrt( (p1[0] - p0[0])^2 + (p1[1] - p0[1])^2 + (p1[2] - p0[2])^2 );

echo("distance: ", distance([0, 0, 0], [1, 1, 1]));

translate([0, 0, 10])
    recursive_cube(10);

translate([60, 0, 0])
    recursive_cylinder(10);

module tictac_cutout(width, length) {
    translate([-width/2, -length/2, 0]) {
        cube([width, length, 1]);
        translate([width, length/2, 0])
            cylinder(1, r=length/2);
        translate([0, length/2, 0])
            cylinder(1, r=length/2);
    }
}

module square_cutout(width, length) {
    translate([-width/2, -length/2, 0]) {
        cube([width, length, 1]);
    }
}

module recursive_cube(size) {
    if(size > 0.1) {
        cube(size, center=true);
        translate([size, 0, 0])
            recursive_cube(size*0.8);
    }
}

module recursive_cylinder(size) {
    $fs = 20;
    $fa = 0.1;
    if (size > 0.1) {
        cylinder(size, size, size/2);
        translate([0, -size/2, size])
            rotate([66, 0, 0])
            recursive_cylinder(size/2);
    }
}