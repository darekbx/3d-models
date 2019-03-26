$fn = 300;
hubDiameter = 35;
spacerHeight = 4;
spacerWidth = 6;
offset = 1;

module spacer() {
    outerDiameter = hubDiameter + spacerHeight * 2;
    difference() {
        cylinder(spacerWidth, outerDiameter, outerDiameter, true);
        cylinder(spacerWidth + offset, hubDiameter, hubDiameter, true);
    }
}

spacer();