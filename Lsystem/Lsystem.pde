String generation = "A";
int count = 1;

void setup()
{
}

void draw()
{
}

void mousePressed()
{
  generation = iterateGen(generation);
  count++;
  println("Generation " + count + ": " + generation);
}

public String iterateGen(String currentGen)
{
  String next = "";

  for (int i = 0; i < currentGen.length(); i++)
  {
    char c = currentGen.charAt(i);
    if (c == 'A')
    {
      next += "AB";
    } else if (c == 'B')
    {
      next += "A";
    }
  }
  
  return next;
}