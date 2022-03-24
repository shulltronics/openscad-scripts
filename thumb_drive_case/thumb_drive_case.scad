// value to help openSCAD with overlaps
_DELTA = 0.01;
// value to add to measured dimensions for final print accuracy
_EXP_VAL = 0.2;

USB_HEIGHT =  4.65 + _EXP_VAL;
USB_WIDTH  = 13.51 + _EXP_VAL;
USB_DEPTH  = 20.85 + _EXP_VAL;
WALL_THICKNESS = 1;

module body() {
    difference() {
        cube([USB_WIDTH+2*WALL_THICKNESS, USB_DEPTH+WALL_THICKNESS, USB_HEIGHT+2*WALL_THICKNESS]);
        translate([WALL_THICKNESS, -_DELTA, WALL_THICKNESS])
            cube([USB_WIDTH, USB_DEPTH, USB_HEIGHT]);
    }
}


module end_cap() {
    $fn = 72;
    cyl_diameter = USB_WIDTH+2*WALL_THICKNESS;
    cyl_height = USB_HEIGHT+2*WALL_THICKNESS;
    cyl_trans_x = cyl_diameter/2;
    cyl_trans_y = USB_DEPTH+WALL_THICKNESS;
    translate([cyl_trans_x, cyl_trans_y, 0])
    difference() {
        cylinder(cyl_height, cyl_diameter/2, cyl_diameter/2);
        translate([0, -cyl_diameter/4, cyl_height/2-_DELTA])
            cube([cyl_diameter, cyl_diameter/2, cyl_height+3*_DELTA], center=true);
    }
}

body();
end_cap();