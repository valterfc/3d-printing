pad = 1; //0.1; //Padding para abrir em cima
hl = 3+5; //altura lateral
brd = 3; //borda - 3mm
rt = (91.20 + (2*brd)) / 2; //raio total + 2* borda_3mm
smooth = 180; //faces do cilindro
rf = 15 / 2; //raio furo central

difference() {
    difference() {
    color("red")
	cylinder(hl,rt,rt,center=false,$fn=smooth);
    
    color("green")
	translate([0,0,brd])
	cylinder(hl-brd+pad,rt-brd,rt-brd,center=false,$fn=smooth);
    }

    //furo central
    color("black")
	translate([0,0,-pad])
    cylinder(h=hl+(2*pad),r=rf,center=true,$fn=smooth);
}
