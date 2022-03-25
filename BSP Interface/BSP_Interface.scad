use <../MODULES/roundedcube.scad>;

// set this to 0 during development for fast previews
SHULL_CUBE_RADIUS = 0;
MAIN_X = 30;
MAIN_Y = 150;
MAIN_Z = 15;

shull_cube(size=[MAIN_X, MAIN_Y, MAIN_Z], radius=SHULL_CUBE_RADIUS, apply_to="z");