// Open Customizer

// External Part
externo = true;

// Complete / parcial
completo = false;


// ----------
difference() {
if (externo) {
  main(3,90);
} else {
  main(3,83);
}

if (!completo) {
if (externo) {
  //corte frente
  translate([0,50+3,0])
  translate([-50,-50,-25])
  cube([100,100,80]);
} else {
  //corte tras
  translate([0,-50-5,0])
  translate([-50,-50,-25])
  cube([100,100,80]);
}
}

}



module main(diametro, esfera) {
rotate([-16,0,0])
difference()
{
color("yellow")
//rotate([16,0,0]) //corrigir linhas esfera
sphere(d=esfera, $fn=100);

union() {
color("yellow")
sphere(d=esfera-(diametro*2), $fn=100);

translate([0,0,-5.7])
color("red")
translate([-60,-2.25,-1.8])
rotate([0,90,0])
cylinder(120, d=21);
  

rotate([16,0,0])
difference()
{

translate([0,0,-29])
cube([100,100,50], center=true);

color("green")
translate([60,56,-4])
rotate([0,180,90])
trapezoidal();
}
}


}
}


// ---------------------
module trapezoidal() {
//https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids#polyhedron
la = 120;
co = 50;
ma = 18.7;
mi = 5.3;

CubePoints = [
  [  0,  0,  0 ], //0
  [ co,  0,  0 ], //1
  [ co, la,  0 ], //2
  [  0, la,  0 ], //3
  [  0,  0, ma ], //4
  [ co,  0, mi ], //5

  [ co, la, mi ], //6
  [  0, la, ma ]  //7
];
  
CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
polyhedron( CubePoints, CubeFaces );
}
