//difference() {
//importBPouch();
//cut();
cylinderCut();
//}

module importBPouch() {
translate([39.3,79.7,-130.758])
rotate([90,0,0])
import("bpouch__fixed.stl");
}

module cut() {
x = 78.5;
y = 79.4;

translate([(x-60)/2,(y-51)/2,-1])
color("red")
cube ([60,51,10]);

// para achar o tamanho do objeto
//translate([0,0,-0.5])
//color("green")
//cube ([78.5,79.4,20]);
}

module cylinderCut() {
x = 78.5;
y = 79.4;
di = 100;

translate([x/2,(y+51)/2,-41])
rotate([90,0,0])
color("green")
difference() {
cylinder(h=51, d=di);
translate([0,0,-1])
cylinder(h=53, d=di-5);
}
}
