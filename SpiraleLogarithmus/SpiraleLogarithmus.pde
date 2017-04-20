void setup() {
  size(1500, 1500);
  background(255,255,255);
}

float middlePointx = 700;
float middlePointy = 700;
float x = middlePointx;
float y = middlePointy;
float i = 0;
float radius = 1;

void draw()
{
  if(i <= 7200)
  {
    line(x, y, middlePointx + cos(i) * radius, middlePointy + sin(i) * radius);
    x = middlePointx + cos(i) * radius;
    y = middlePointy + sin(i) * radius;
    radius = radius * pow((float) Math.E, i * 0.00015);
    i = i + 0.1;
  }
}