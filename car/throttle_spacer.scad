cilindro(1.12);

translate([-25,0,0])
cilindro(2.52);

translate([25,0,0])
cilindro(2.24);

translate([0,25,0])
cilindro(0.56);

translate([25,25,0])
cilindro(1.4);

module cilindro(altura) {

difference() {
cylinder(h=altura, r=20/2);

translate([0,0,-0.5])
cylinder(h=altura+2, r=10/2);
}

}