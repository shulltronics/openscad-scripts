$fa = 1;
$fs = 0.4;

module wheel(wheel_radius=30, wheel_width=5) {
    difference() {
            resize([wheel_radius, wheel_width, wheel_radius])
            sphere(r=10, center=true);
        rotate([90, 0, 0])
            cylinder(wheel_width, wheel_radius/3, wheel_radius/3, center=true);
    }
}

wheel();