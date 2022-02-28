// Create a wave surface
module wave_plane(x=20, y=20, delta=0.5, wavelength=10, offset=1, amplitude=1) {
    for(i = [0 : delta : x]) {
        for(j = [0 : delta : y]) {
            translate([i, j, 0])
                cube([delta, delta,  offset+amplitude*sin(j*360/wavelength)*sin(i*360/wavelength)]);
        }
    }
}

translate([0, 0, 3])
    wave_plane(10, 10, 0.03, 2, 0.3, 0.5);