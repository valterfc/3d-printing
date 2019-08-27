// corpo
translate([-60,0,0])
cube([120, 6, 30]);

// encaixe
translate([-42.5/2,0,0]) {
    hull()
    {
    cube([42.5, 6, 55]);

    color("yellow")
    translate([0,-10,30])
    cube([42.5, 10, 25]);
    }
}

// ponta esquerda
translate([-60,0,0])
pontas();

// ponta direita
translate([60,0,0])
mirror([180,0,0])
pontas();

module pontas(inverter) {
angulo = 18; // 12.0948
    color("red")
    rotate([0,0,angulo])
    cube([6, 70, 30]);
}
