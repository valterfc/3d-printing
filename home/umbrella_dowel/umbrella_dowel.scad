//size
//total = 24.5mm
//diameter = 6.5mm

//center hole
//heigth = 10mm
//diameter = 1.6mm

//lateral hole
//distance from base = 12mm
//diameter = 1.6mm

total_size = 24.5;
total_diameter = 6.5;
total_faces = 30;
total_r = total_diameter / 2; //3.25

hole_diameter = 2; //1.8mm
hole_faces = 6; //6 faces
late_hole_distance = 12;
late_hole_h = total_diameter + 2; //8.5
cent_hole_h = late_hole_distance - hole_diameter; //10
holes_r = hole_diameter / 2; //1 or 0.9

draw();

module draw() {
	//union() {
	difference() {
		draw_body();
		draw_centerhole();
		draw_lateralhole();
	}
}

module draw_body() {
	cylinder(h=total_size, r=total_r, $fn=total_faces);
}

module draw_centerhole() {
	cylinder(h=cent_hole_h, r=holes_r, $fn=hole_faces);
}

module draw_lateralhole() {
	translate([0, late_hole_h/2, late_hole_distance])
		rotate([90, 0, 0])
			cylinder(h=10, r=holes_r, $fn=hole_faces);
}
