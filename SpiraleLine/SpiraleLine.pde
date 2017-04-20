void setup() {
  size(500, 500);
  background(255,255,255);
  int middlex = 50;
  int middley = 50;
  int r = 50;
  int x = 100;
  drawCircle(100,250,250);
    
}

void drawCircle(float radius, int middlePointx, int middlePointy)
{
  float x = middlePointx;
  float y = middlePointy;
  
  /*
  for(float i = 0; i<= 360; i = i+ 0.5)
  {
    line(x, y, middlePointx + cos(i)* radius, middlePointy + sin(i)*radius);
    point(middlePointx + cos(i)* radius,middlePointy + sin(i)*radius );
    radius = radius - 0.7;
    x = middlePointx + cos(i)* radius;
    y = middlePointy + sin(i)*radius;
  }
  */
  
  float i = 0;
  float radiusTemp = 0;
  while(radiusTemp < radius)
  {
    line(x, y, middlePointx + cos(i)* radiusTemp, middlePointy + sin(i)*radiusTemp);
    point(middlePointx + cos(i)* radiusTemp, middlePointy + sin(i)*radiusTemp );
    radiusTemp = radiusTemp + 0.5;
    x = middlePointx + cos(i) * radiusTemp;
    y = middlePointy + sin(i) * radiusTemp;
    i = i + 0.5;
  }
}