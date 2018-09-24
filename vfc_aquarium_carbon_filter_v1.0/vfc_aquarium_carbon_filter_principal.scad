//parametros
lMin = 58;
lMax = 63;
comp = 117;
altura = 2;
borda = 10;

//makePrincipal();
//makeTopo();
//makeTela();
makeTelaFechada();


// --------------------------------------------
module makePrincipal() {
    union() {
        body();

        addPinos();

        //addCruzado();
    }
}

module makeTopo() {
    difference() {
        body();

        addFuros();
    }
}

module makeTela() {
    union() {
        body();

        color("blue")
        translate([1,3,1])
        honeycomb(comp-borda, lMax-borda, altura, 3, 0.8); 
    }
}

module makeTelaFechada() {
    bodyExterno();
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
    translate([borda,borda,-1])
    linear_extrude(height=altura*2, center=false, convexity=10)
    polygon_body(borda);
}

module addCruzado() {
    translate([6,10,0])
    rotate([0,0,-67])
    cruzado();

    translate([6,50,0])
    rotate([0,0,-113])
    cruzado();
}

module cruzado() {
    color("red")
    cube([3,comp,altura]);
}

module addPinos() {
    MBorda = borda/2;
    bDir = MBorda;
    bEsq = lMin-MBorda;
    
    //esquerda
    translate([MBorda,bEsq,0])
    pino();

    translate([MBorda+(comp/2),bEsq+1,0])
    pino();

    translate([comp-2-MBorda,bEsq+2,0])
    pino();
    

    //direita
    translate([MBorda,bDir,0])
    pino();

    translate([MBorda+(comp/2),bDir-1,0])
    pino();

    translate([comp-2-MBorda,bDir-2,0])
    pino();
}

module pino() {
    translate([0,0,altura])
    difference() {
        cylinder(h=3.45, r=6/2, $fn=60);
        
        translate([-0.76,-3,0.45])
        cube([1.55,6,4]);
    }
}

module addFuros() {
    MBorda = borda/2;
    bDir = MBorda;
    bEsq = lMin-MBorda;
    
    //esquerda
    translate([MBorda,bEsq,0])
    furo();

    translate([MBorda+(comp/2),bEsq+1,0])
    furo();

    translate([comp-2-MBorda,bEsq+2,0])
    furo();
    

    //direita
    translate([MBorda,bDir,0])
    furo();

    translate([MBorda+(comp/2),bDir-1,0])
    furo();

    translate([comp-2-MBorda,bDir-2,0])
    furo();
}

module furo() {
    translate([0,0,-1])
    cylinder(h=altura+2, r=6/2, $fn=60);
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

