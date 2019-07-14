pad = 1; //0.1; //Padding para abrir em cima
brd = 5; //borda - 3mm
hl = brd+3; //3+5; //altura lateral
rt = (100 + (2*brd)) / 2; //raio total + 2* borda_3mm
smooth = 180; //faces do cilindro

difference() {
  color("red")
  cylinder(hl,rt,rt,center=false,$fn=smooth);
    
  color("green")
	translate([0,0,brd])
	cylinder(hl-brd+pad,rt-brd,rt-brd,center=false,$fn=smooth);
}
