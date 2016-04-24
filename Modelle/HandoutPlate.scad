pThickness = 2.5;


module testThingies() {
	xTranslation = 90;
	intersection() {
		union() {
			translate([xTranslation, 10, pThickness]) sphere(r = 5);

			translate([xTranslation, 40, pThickness]) cylinder(r = 5, h = 5);

			translate([xTranslation - 4, 25 - 4, pThickness]) polyhedron(points = [ [0,0,0], [8,0,0], [8,8,0], [0,8,0], [4, 4, 5]], faces = [[0, 1, 2, 3], [4, 2, 1], [4, 3, 2], [4, 0, 3], [4, 1, 0]]);

		}

		cube([100, 60, 60]);
	}
}

module sepLine() {
	xPosition = 80;
	yDist = 5;

	translate([xPosition, yDist, pThickness]) cube([1, 50 - yDist*2, 1.5]);
}

module emblem() {
	translate([4, 10, pThickness]) linear_extrude(height = 1.5) text("PLA", font = "Gentium Book Basic", size = 33); // "Gentium Book Basic"
}

resize([90, 0, 7.5], auto = true) {
	emblem();
	sepLine();
	testThingies();
	cube([100, 50, pThickness]);
}
