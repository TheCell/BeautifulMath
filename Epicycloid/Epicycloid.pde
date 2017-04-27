void setup()
{
  size(1400, 1400);
  background(255, 255, 255);
  background(0, 0, 0);
  colorMode(HSB, 100);
}

float radius = 50;
float counter = 1;
float k = 7;
float increment = 0.01;
float max = 360 / increment;
int H = 0;

void draw()
{
  if(counter < max)
  {
    translate(750, 750);
    float x = radius*(k + 1)*cos(counter)-radius*cos((k + 1)*counter);
    float y = radius*(k + 1)*sin(counter)-radius*sin((k + 1)*counter);
    strokeWeight(3);
    stroke(H, 100, 100);
    point(x,y);
    counter = counter + increment;
    if(H == 360)
    {
      H = 0;
    }
    else
    {
      H++;
    }
  }
}