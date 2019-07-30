hl = 23;
smooth = 40;

difference()
{

union() {
  translate([0,0,hl-1])
  color("DarkBlue")
  cylinder(3,d1=9,d2=7,$fn=smooth);
    
  color("blue")
  cylinder(hl-1,d=9,$fn=smooth);
    
  color("green")
  cylinder(4,d=17,$fn=smooth);

}

union() {
  color("pink")
  translate([0,0,-1])
  cylinder(7+1,d=6,$fn=smooth);

  color("red")
  translate([0,0,7+0.5])
  cylinder(hl,d=3.05,$fn=smooth);
}

}

