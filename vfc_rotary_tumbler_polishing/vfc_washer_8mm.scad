smooth = 40;

difference()
{

color("green")
cylinder(8,d=10,$fn=smooth);

color("red")
translate([0,0,-1])
cylinder(10,d=3.1,$fn=smooth);

}

