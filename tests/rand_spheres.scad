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
        cube([BASE_WIDTH, BASE_DEPTH, 1-0.005]);
    for(i = [-15 : 3 : 15]) {
        for(j = [-15 : 3 : 15]) {
            translate([i, j, -0.003])
                cutout(rands(0.2, 2, 1)[0], 1);
        }
    }
}

translate([0, 0, 10])
    cutout(2, 1);

// Returns distance between two 3D points
function distance(p0, p1) =
    sqrt( (p1[0] - p0[0])^2 + (p1[1] - p0[1])^2 + (p1[2] - p0[2])^2 );

echo("distance: ", distance([0, 0, 0], [1, 1, 1]));

module cutout(width, length) {
    translate([-width/2, -length/2, 0]) {
        cube([width, length, 1]);
        translate([width, length/2, 0])
            cylinder(1, r=length/2);
        translate([0, length/2, 0])
            cylinder(1, r=length/2);
    }
}