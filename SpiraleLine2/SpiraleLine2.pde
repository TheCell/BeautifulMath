void setup() {
  size(1500, 1500);
  background(255,255,255);
  int middlex = 50;
  int middley = 50;
  int r = 50;
  int x = 100;
  drawCircle(0,700,700);
    
}

void drawCircle(float radius, int middlePointx, int middlePointy)
{
  float x = middlePointx;
  float y = middlePointy;
  
  for(float i = 0; i<= 360; i = i+ 0.5)
  {
    line(x, y, middlePointx + cos(i) * radius, middlePointy + sin(i) * radius);
    radius = radius + 0.7;
    /*
    x = middlePointx + cos(i) * radius;
    y = middlePointy + sin(i) * radius;
    */
  }
}