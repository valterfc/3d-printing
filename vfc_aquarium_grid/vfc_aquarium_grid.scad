altura = 2.5; //3;

FN = 40;

difference(convexity = 1,$fn=FN){
union(convexity = 1, $fn=FN){    
    cubo_maior(); 
    cubo_menor();
}

//canto embaixo
translate([0, 0, -2])
canto();
}

module cubo_maior(){
difference(convexity = 1,$fn=FN){
    color("red")
    cube([180, 75, altura]);

    translate([180, 0, -2])
    canto();

    //translate([180, 75, -2])
    //canto();
}
}  

module cubo_menor(){
difference(convexity = 1,$fn=FN){
    color("green")
    cube([55, 100, altura]);

    translate([0, 100, -2])
    canto();
}
}  

module canto(){
    color("yellow")
    cylinder(h=10, r=25/2);
}