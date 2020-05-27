//labeled combo box for string
Opcao_Gerar="P"; // [P:Principal, T:Topo]

seleciona();

module seleciona() {
  if (Opcao_Gerar == "P") makePrincipal();
  if (Opcao_Gerar == "T") makeTopo();
}

//parametros
lMin = 58;
lMax = 64.88; //63
comp = 117;
altura = 2;
bordaL = 15;
heigth = 10;

// --------------------------------------------
module makePrincipal(addEncaixe = true) {
    difference() {
    union() {
        body();
        if (addEncaixe == true) addEncaixe();

        gridPattern();
    }

    bodyCorte();
    }
}

module makeTopo() {
    //color("black")
    //translate([0,0,2])
    bodyTopo();
}

module cuteBottom() {
  translate([-6.2,7,-2])
  color("black")
  cube([10,44,6]);
}

module addEncaixe() {
iMax = lMax - bordaL - (4+2);
icomp = comp - bordaL - 5;

union() {
    difference() {

    color("red")
    translate([bordaL-(9-2),bordaL-(10-2),0])
    cube([icomp,iMax,heigth]);

    color("blue")
    translate([bordaL-(9-4),bordaL-(10-4),-2])
    cube([icomp - 4,iMax - 4,19]);

    }
    
//traves
translate([bordaL+25-4.4,bordaL-(10-2),0])
cube([0.8,iMax,heigth]);

translate([bordaL+60-9.4,bordaL-(10-2),0])
cube([0.8,iMax,heigth]);

translate([bordaL-7,(lMin/2)-0.5,0])
cube([icomp,0.8,heigth]);
}
    
}


module bodyTopo() {
iMax = lMax - bordaL - (4+2) + 2.4;
icomp = comp - bordaL - 5 + 2.4;
dif = 1.5;
//dif = 0;

difference() {

color("red")
translate([bordaL-13+dif,bordaL-13+dif,0])
cube([icomp+10-3,iMax+8-(dif*2),3]);

color("blue")
translate([bordaL-7.2,bordaL-8.2,-2])
cube([icomp-2,iMax-2,6]);

}
    
}

module bodyCorte() {
    brd = 5;
    dDif = 2;
    eDif = 11.9;
    
    translate([0,0,-1])
    rotate([0,-0,0]) {
        translate([-2,-dDif,2])
        cube([lMax+42,brd+dDif,altura*2]);
        rotate([0,0,-1])
        translate([-2,-dDif-5.15,0])
        cube([lMax+60,brd+dDif,altura*2]);

        translate([-2,lMax-eDif,2])
        cube([lMax+42,brd+dDif,altura*2]);
        rotate([0,0,1])
        translate([-2,lMax+5.15-eDif,0])
        cube([lMax+60,brd+dDif,altura*2]);
    }
    
    cuteBottom();
}

module body() {
    difference() {
        bodyExterno();
        bodyInterno();
    }
}

module bodyExterno() {
    linear_extrude(height=altura, center=false, convexity=10)
    polygon_body();
}

module bodyInterno() {
    iMax = lMax - bordaL - (4+2);
    icomp = comp - bordaL - 5;

    translate([bordaL-(9-2),bordaL-(10-2),-1])
    cube([icomp,iMax,altura*2]);
}

module polygon_body(diferenca = 0) {
    diferenca = diferenca * 2;
    lMin = (lMin - diferenca);
    lMax = (lMax - diferenca);
    comp = 117 - (diferenca * 1.2);
    lDif = (lMax - lMin) / 2;

    polygon([[0,0],[comp,-lDif],[comp,lMin+lDif],[0,lMin]]);
}



module gridPattern() {

translate([6.5,5])
difference() {
    color("green")
    cube([103,47.5,2]);

    
    union() {
    translate([0,-0.8,-1])
    color("gray")
    {for (a =[0:6]) {
        for (b =[0:17]) {
            aa = a + (a * 14);
            ba = b + (b * 1.8);
            translate([aa,ba,0])
            cube([14,1.8,4]);
        }
    }}}
}
}
