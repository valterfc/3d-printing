//parametros
lMin = 58;
lMax = 63;
comp = 117;
altura = 2;
bordaL = 15;

makePrincipal();
//makeTopo();
//makeTela();
//makeTelaFechada();


// --------------------------------------------
module makePrincipal(addPinos = true) {
    difference() {
    union() {

        body();
        if (addPinos == true) addPinos();

        color("blue")
        translate([6,5,1])
        honeycomb(comp-bordaL, lMax-bordaL, altura, 2, 0.8); 
    }

    bodyCorte();
    }
}

module makeTopo() {
    difference() {
        bodyTopo();

        addFuros();
    }
}

module makeTela() {
    makePrincipal(false);
}

module makeTelaFechada() {
    bodyExterno();
}





module bodyTopo() {
    iMax = lMax-0.2 - bordaL;
    icomp = comp+5+3 - bordaL;

    difference() {

    color("red")
    translate([bordaL-12.5,bordaL-9.93,1])
    cube([icomp,iMax,altura]);

    color("Yellow")
    translate([bordaL-2.25,bordaL,0])
    cube([icomp-20,iMax-20,altura+2]);
    
    }
}

module bodyCorte() {
    brd = 5;
    dDif = 2;
    eDif = 10;
    
    translate([0,0,-0.5])
    rotate([0,-1,0]) {
    translate([-2,-dDif,2])
    cube([lMax+2,brd+dDif,altura*2]);

    translate([-2,lMax-eDif,2])
    cube([lMax+2,brd+dDif,altura*2]);
    }
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
    iMax = lMax - bordaL - 5;
    icomp = comp - bordaL - 5;

    translate([bordaL-5,bordaL-7.5,-1])
    cube([icomp,iMax,altura*2]);
}

module cruzado() {
    color("red")
    cube([5,comp,altura]);
}

module addPinos() {
    pinDif = 2.5;

    MBorda = bordaL/2;
    bDir = MBorda+pinDif;
    bEsq = lMin-MBorda-pinDif;
    
    //topo eixo y (esquerda - vendo de frente)
    translate([MBorda,bEsq,0])
    pino();

    translate([MBorda+(comp/2),bEsq,0])
    pino();

    translate([comp-2-MBorda,bEsq,0])
    pino();
    

    //base eixo y (direita - vendo de frente)
    translate([MBorda,bDir,0])
    pino();

    translate([MBorda+(comp/2),bDir,0])
    pino();

    translate([comp-2-MBorda,bDir,0])
    pino();
}

module pino() {
    union() {
    
    translate([0,0,altura])
    difference() {
        cylinder(h=3.45, r=6/2, $fn=60);
        
        translate([-0.76,-3,0.45])
        cube([1.55,6,4]);
    }
    
    cylinder(h=altura, r=10/2, $fn=60);
    }
}

module addFuros() {
    pinDif = 2.5;

    MBorda = bordaL/2;
    bDir = MBorda+pinDif;
    bEsq = lMin-MBorda-pinDif;
    
    //topo eixo y (esquerda - vendo de frente)
    translate([MBorda,bEsq,0])
    furo();

    translate([MBorda+(comp/2),bEsq,0])
    furo();

    translate([comp-2-MBorda,bEsq,0])
    furo();
    

    //base eixo y (direita - vendo de frente)
    translate([MBorda,bDir,0])
    furo();

    translate([MBorda+(comp/2),bDir,0])
    furo();

    translate([comp-2-MBorda,bDir,0])
    furo();
}

module furo() {
    color("black")
    translate([0,0,-1])
    cylinder(h=altura+3, r=6/2, $fn=60);
}

module polygon_body(diferenca = 0) {
    diferenca = diferenca * 2;
    lMin = (lMin - diferenca);
    lMax = (lMax - diferenca);
    comp = 117 - (diferenca * 1.2);
    lDif = (lMax - lMin) / 2;

    polygon([[0,0],[comp,-lDif],[comp,lMin+lDif],[0,lMin]]);
}






module hc_column(length, cell_size, wall_thickness) {
        no_of_cells = floor(length / (cell_size + wall_thickness)) ;

        for (i = [0 : no_of_cells]) {
                translate([0,(i * (cell_size + wall_thickness)),0])
                         circle($fn = 6, r = cell_size * (sqrt(3)/3));
        }
}

module honeycomb (length, width, height, cell_size, wall_thickness) {
        no_of_rows = floor(1.2 * length / (cell_size +
wall_thickness)) ;

        tr_mod = cell_size + wall_thickness;
        tr_x = sqrt(3)/2 * tr_mod;
        tr_y = tr_mod / 2;
        off_x = -1 * wall_thickness / 2;
        off_y = wall_thickness / 2;
        linear_extrude(height = height, center = true, convexity = 10,
twist = 0, slices = 1)
                difference(){
                        square([length, width]);
                        for (i = [0 : no_of_rows]) {
                                translate([i * tr_x + off_x, (i % 2) *
tr_y + off_y,0])
                                        hc_column(width, cell_size,
wall_thickness);
                        }
                }
}

