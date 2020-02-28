//importar_base();
//importar_full();
//translate([0,0,3])
difference() {
  quadrado();
  recortes();
}

module importar_full() {
translate([170.72,-335,0])
import("../hold2_noise_spawn.stl");
}

module importar_base() {
translate([170.72,-335,-3])
import("hold2_noise_spawn__cut.stl");
}

module quadrado() {
  translate([-86+28,-22,-3])
  color("silver")
  cube ([122,45,22]);
}

module recortes() {
union() {
  corteSpawn();
  corteRuidos();
}
}

module corteSpawn() {
  translate([6.1,-12.9,-4])
  color("red")
  cube ([51.6,26.5,24]);

  translate([32,-22,-4])
  color("green")
  cylinder(h=24, d=25);

  translate([32,22,-4])
  color("green")
  cylinder(h=24, d=25);
}

module corteRuidos() {
color("green") {
  translate([-24.7,3.5,-4])
  corteRuidoUnit();

  translate([-9.15,-2,-4])
  rotate([0,0,180])
  corteRuidoUnit();

  translate([-40.5,-2,-4])
  rotate([0,0,180])
  corteRuidoUnit();
}
}

module corteRuidoUnit() {
union() {
  hull() {
    cylinder(h=24, d=7, $fn=20);

    translate([-10,-18,0])
    cylinder(h=24, d=7, $fn=20);

    translate([10,-18,0])
    cylinder(h=24, d=7, $fn=20);
  }

  translate([0,-30,0])
  cylinder(h=24, d=25);
}
}
