void setup() {
  size(500, 500);
  background(255,255,255);
  int middlex = 50;
  int middley = 50;
  int r = 50;
  int x = 100;
  drawCircle(100,250,250);
    
}

// Archimedian
void drawCircle(float radius, int middlePointx, int middlePointy)
{
  for(float i = 0; i<= 1440; i = i+ 0.5)
  {
    point(middlePointx + cos(i)* radius,middlePointy + sin(i)*radius );
    /*
    if(i%10==0)
    {
      radius = radius -1;
    }
    */
    radius = radius - 0.1;
  }
}