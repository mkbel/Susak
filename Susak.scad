l = 35;
l_in = 18;
a = 20;
d_in = 14.2;
d_out = 12.5;
hole_offset = 10;
arrow_wide = 15;
arrow_thin = 9.5;
arrow_length = 6;
zero = 0.01;

module Arrow(){
    hull(){
        translate([-zero,-arrow_wide/2,-zero])cube([zero, arrow_wide, a+2*zero]);
        translate([arrow_length,-arrow_thin/2,-zero])cube([zero, arrow_thin, a+2*zero]);
    }
}

module Basic_shape(){
    difference() {
        translate([-hole_offset, -a/2, 0])cube([l, a, a]);
        translate([0,0,-1])cylinder(d=d_out, h=1000);
    }
}


module Basic_shape_moved(){
    translate([10,0,0])Basic_shape();
}

module Clips(){
    difference(){
        Basic_shape_moved();
        Arrow();
    }
}

module Standing_clips(){
    translate([-a/2,0,l+zero])rotate([0,90,0])Clips();
}

module Holed_clips(){
    difference() {
        Standing_clips();
        cylinder(d = d_out, h = l_in);
    }
}

Holed_clips();

