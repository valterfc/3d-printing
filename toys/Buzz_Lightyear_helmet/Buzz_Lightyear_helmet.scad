//%import("Buzz_Lightyear_fixed.stl");

translate([152.75,63.5,235])
difference()
{
color("yellow")
sphere(d=90, $fn=100);

union() {
color("yellow")
sphere(d=90-3, $fn=100);

color("red")
translate([-60,-2.25,-1.8])
rotate([0,90,0])
cylinder(120, d=21);
  
rotate([16,0,0])
translate([0,0,-29])
cube([100,100,50], center=true);
}
}
