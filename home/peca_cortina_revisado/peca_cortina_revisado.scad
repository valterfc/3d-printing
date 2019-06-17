difference()
{
union()
{
translate([0,0,-(1/2)])
cube([88,15,1.3],center=true);

color("blue")
translate([0,(15/2)-(3.1/2),0])
cube([88,3.1,2.3],center=true);

color("red")
translate([0,-1*(15/2)+(3.1/2),0])
cube([88,3.1,2.3],center=true);
}

translate([0,4.85-3.1,0])
cube([8.45,5.4,5],center=true);
}