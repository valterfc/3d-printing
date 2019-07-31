hl = 50;
smooth = 40;
dia = 12;
diaB = 18;

difference()
{

union() {
  color("yellow")
  translate([0,0,hl-6])
  cylinder(6,d1=dia,d2=diaB,$fn=smooth);

  color("blue")
  cylinder(hl,d=dia,$fn=smooth);
    
  color("green")
  cylinder(4,d=diaB,$fn=smooth);
}

union() {
  color("pink")
  translate([0,0,hl-7])
  cylinder(7+2,d=6,$fn=smooth);

  color("red")
  translate([0,0,7+1.5])
  cylinder(hl,d=2.95,$fn=smooth);

  color("pink")
  translate([0,0,-1])
  cylinder(7+2,d=6,$fn=smooth);
}

}

