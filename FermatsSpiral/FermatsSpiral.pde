void setup() {
  size(1500, 1500);
  background(255,255,255);
}

float middlePointx = 750;
float middlePointy = 750;
float x = middlePointx;
float y = middlePointy;
float x2 = middlePointx;
float y2 = middlePointy;
float i = 0;
float radius = 1;

void draw()
{
  if(i <= 7200)
  {
    line(x, y, middlePointx + cos(i) * radius, middlePointy + sin(i) * radius);
    x = middlePointx + cos(i) * radius;
    y = middlePointy + sin(i) * radius;
    radius = (50 * pow(i, 0.5));
    line(x2, y2, middlePointx + cos(i) * radius * -1, middlePointy + sin(i) * radius * -1);
    x2 = middlePointx + cos(i) * radius * -1;
    y2 = middlePointy + sin(i) * radius * -1;
    radius = (50 * pow(i, 0.5));
    i = i + 0.1;
  }
}