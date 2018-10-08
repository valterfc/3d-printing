difference() {
    color("red")
	cylinder(h=60,r=(16.5-0.4)/2,$fn=180);
    
    color("green")
	translate([0,0,-1])
	cylinder(h=60+2,r=(8.0+0.4)/2,$fn=180);
}
