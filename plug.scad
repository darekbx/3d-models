$fn = 180;

plugDiameter = 23;
plugThickness = 3;

separatorWidth = 12;
separatorHeight = 5;
separatorThickness = 1;

pinDiameter = 7;
pinHeight = 12;
pinHoleDiameter = 4;
space = 0.1;
rimDiameter = 7;
rimHeight = 1;

module plugBase() {
    minkowski() {
        cylinder(plugThickness, d1 = plugDiameter / 1.25, d2 = plugDiameter, true);
        cylinder(r=1, h=1, true);
    }
}

module separator() {
    translate([0, 0, 5]) {
        cube([separatorWidth, separatorThickness, separatorHeight], true);
    }
}

module pin() {
    translate([0, 0, 3]) {
        cylinder(pinHeight, d1 = pinDiameter, d2 = pinDiameter, true);
    }
}

module pinRim() {
    translate([0, 0, 13]) {
        minkowski() {
            cylinder(rimHeight, d1 = rimDiameter, d2 = rimDiameter / 1.25, true);
            cylinder(r=1, h=1, true);
        }
    }
}

module pinHole() {
    translate([0, 0, 4]) {
        #cylinder(pinHeight * 1.1, d1 = pinHoleDiameter, d2 = pinHoleDiameter, true);
    }
}

module spacer() {
    translate([0, 0, 11.25]) {
        #minkowski() {
            cube([space, separatorWidth, pinHeight * 1], true);
            sphere(r=1, true);
        }
    }
}

module pinRimCut(){
    translate([-5, 3.5, 9.5]) {
        #cube([10, 4, 8]);
    }
    translate([-5, -7.5, 9.5]) {
        #cube([10, 4, 8]);
    }
}

module draw() {
    difference() {
        union () {
            pin();
            difference() {
                pinRim();
                pinRimCut();
            }
            separator();
        }
        pinHole();
        spacer();
    }
    plugBase();
}

draw();