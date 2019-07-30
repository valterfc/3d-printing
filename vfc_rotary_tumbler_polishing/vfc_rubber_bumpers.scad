hl = 23;
smooth = 40;

difference()
{

union() {
  color("blue")
  cylinder(hl,d=9.5,$fn=smooth);
    
  color("green")
  cylinder(4,d=17,$fn=smooth);

}

union() {
  color("pink")
  translate([0,0,-1])
  cylinder(7+1,d=6,$fn=smooth);

  color("red")
  translate([0,0,7+0.5])
  cylinder(hl,d=2.9,$fn=smooth);
}

}

