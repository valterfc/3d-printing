largura = 14;
altura = 6;

union() {
	brace1();
	brace2();
	brace3();
}

module brace1() {
	cube([60, altura, largura]);
}

module brace2() {
	translate([60-altura,altura,0])
	cube([altura, 15, largura]);
}

module brace3() {
	translate([60-altura-6,altura,0])
	cube([6, 1.2, largura]);
}
