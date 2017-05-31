ArrayList<Sym> instructions = new ArrayList<Sym>();
Turtle executorTurtle = new Turtle(15.0, PI/6);
int xOffset = 750;
int yOffset = 750;
int counter = 0;

void setup()
{
  size(1500, 1500);

  instructions.add(Sym.TD);
}

void draw()
{
  if (counter < 3)
  {
    translate(xOffset, yOffset);
    rotate(PI);
    background(255);
    println(instructions);
    instructions = Ruleset.applyRules(instructions);

    for (Sym instruction : instructions)
    {
      executorTurtle.execute(instruction);
    }
    counter++;
  }
}