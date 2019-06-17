menor();
//maior();

module menor(){
difference(){
	union(){
		cylinder(r=5/2, h=7, $fn=30);
		translate([0,0,7+3])
			sphere(r = 10/2);
	}
	
	cylinder(r=2.5/2, h=9, $fn=30);
}
}

module maior(){
difference(){
	union(){
		cylinder(r=7/2, h=7, $fn=30);
		translate([0,0,7+3])
			sphere(r = 14/2);
	}
	
	cylinder(r=2.5/2, h=11, $fn=30);
}
}
