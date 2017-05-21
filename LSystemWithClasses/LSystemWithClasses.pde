ArrayList<Sym> instructions = new ArrayList<Sym>();
Turtle executorTurtle = new Turtle(15.0, PI/3);
int xOffset = 750;
int yOffset = 750;

void setup()
{
  size(1500, 1500);
  translate(xOffset, yOffset);
  background(255);
  
  instructions.add(Sym.TD);
  println(instructions);
  instructions = Ruleset.applyRules(instructions);
  
  for(Sym instruction : instructions)
  {
    executorTurtle.execute(instruction);
  }
  
}

void draw()
{
}