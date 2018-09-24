union() {
    largura = 14; //mm
    altura = 32; //mm
    comprimento = 20; //mm
    espessura = 4.2; //mm
    
    color("green")
    translate([-(comprimento-espessura), 0, 0])
    cube([comprimento, espessura, largura]);

    color("blue")
    rotate(45)
    translate([-1.5, 1.5, 0])
    cube([8, 5, largura]);
    
    cube([espessura, comprimento, largura]);
}
