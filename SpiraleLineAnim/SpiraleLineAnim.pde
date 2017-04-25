void setup() {
  size(1000, 1000);
  background(255,255,255);;
}

float radius = 100;
float middlePointx = 500;
float middlePointy = 500;
float x = middlePointx;
float y = middlePointy;
float i = 0;
float radiusTemp = 0;
void draw()
{
  line(x, y, middlePointx + cos(i)* radiusTemp, middlePointy + sin(i)*radiusTemp);
  point(middlePointx + cos(i)* radiusTemp, middlePointy + sin(i)*radiusTemp );
  radiusTemp = radiusTemp + 1;
  x = middlePointx + cos(i) * radiusTemp;
  y = middlePointy + sin(i) * radiusTemp;
  //i = i + 0.7;
  //i = i + 1.3;
  //i = i + 1.4;
  //i = i + 1.6;
  i = i + 1.8;
}