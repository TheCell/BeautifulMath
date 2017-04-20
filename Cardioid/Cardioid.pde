void setup()
{
  size(1400, 1400);
  background(255, 255, 255);
  translate(750, 750);
}

float radius = 100;
int counter = 1;

void draw()
{
  translate(750, 750);
  float x = 2*radius*(1-cos(counter))*cos(counter);
  float y = 2*radius*(1-cos(counter))*sin(counter);
  point(x,y);
  counter++;
}