String generation = "F";
int count = 1;
int xOffset = 750;
int yOffset = 1500;

void setup()
{
  background(255);
  size(1500, 1500);
  translate(xOffset, yOffset);
}

void draw()
{
}

void mousePressed()
{
  generation = iterateGen(generation);
  count++;
  println("Generation " + count + ": " + generation);
  drawGen(generation, 40, PI/16);
}

public String iterateGen(String currentGen)
{
  String next = "";

  for (int i = 0; i < currentGen.length(); i++)
  {
    char c = currentGen.charAt(i);
    if (c == 'F')
    {
      //next += "FF+[+F-F---F]-[-F++F+++F]-[+F+F-F]+[F-F]";
      next += "FF+[+F-F---F]-";
    } else if (c == '+')
     {
     next += "+[++F+FF++]";
     } else if( c == '-')
     {
       next += "-[F--FF+F-F+FF++F-F]";
     }
  }

  return next;
}

public void drawGen(String gen, int branchlength, float angle)
{
  branchlength *= -1;
  translate(xOffset, yOffset);
  background(255);
  for (int i = 0; i < gen.length(); i++)
  {
    char c = gen.charAt(i);
    if (c == 'F')
    {
      line(0, 0, 0, branchlength);
      translate(0, branchlength);
    } else if (c == 'G')
    {
      translate(0, branchlength);
    } else if (c == '+')
    {
      rotate(angle);
    } else if (c == '-')
    {
      rotate(-angle);
    } else if (c == '[')
    {
      pushMatrix();
    } else if (c == ']')
    {
      popMatrix();
    }
  }
}