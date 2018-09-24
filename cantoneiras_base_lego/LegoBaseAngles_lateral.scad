union() {
    largura = 14; //mm
    altura = 32; //mm
    comprimento = 32; //mm
    espessura = 4.2; //mm
    
    //translate([0, 0, 0]);
    //cylinder(h=4, d=1, center=true);
    //rotate(60) color("red");

    color("red")
    translate([-6, 0.5, 0])
    rotate(45)
    cube([8, 5, largura]);
    
    color("green")
    translate([-(comprimento-espessura), 0, 0])
    cube([comprimento, espessura, largura]);

    color("blue")
    translate([-espessura, 0, 0])
    cube([espessura+1, 21, largura]);
    
    cube([espessura, comprimento, largura]);
}
