altura = 2.5; //3;

FN = 40;

difference(convexity = 1,$fn=FN){
    cubo_maior(); 
}

module cubo_maior(){
difference(convexity = 1,$fn=FN){
    color("red")
    cube([180, 100, altura]);

    translate([180, 0, -2])
    canto();

    translate([180, 100, -2])
    canto();

    translate([0, 100, -2])
    canto();

    //canto embaixo
    //translate([0, 0, -2])
    //canto();
    
    recorteAleasXp06();
}
}  

module canto(){
    color("yellow")
    cylinder(h=10, r=25/2);
}

module recorteAleasXp06() {
    translate([-1, -1, -1])
    color("blue")
    cube([89+1, 21+1, altura+2], center=false);
}