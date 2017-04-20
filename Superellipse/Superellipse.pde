void setup()
{
  size(700, 700);
  background(255, 255, 255);
}

void draw()
{
  drawSuperellipse(100,250,250,0.5);
  drawSuperellipse(100,250,250,10);
}

void drawSuperellipse(int radius, int middlePointx, int middlePointy, float n)
{
  float increment = PI/(n);
  for(float i = 0; i<= 720; i = i + 0.5)
  {
    point(middlePointx + radius * pow(cos(i),2/n), middlePointy + radius * pow(sin(i),2/n));
    point(middlePointx + radius * pow(cos(i),2/n), middlePointy - radius * pow(sin(i),2/n));
    point(middlePointx - radius * pow(cos(i),2/n), middlePointy + radius * pow(sin(i),2/n));
    point(middlePointx - radius * pow(cos(i),2/n), middlePointy - radius * pow(sin(i),2/n));
    
    /*
    point(middlePointx + radius * pow(cos(i),2*n), middlePointy + radius * pow(sin(i),2/n));
    point(middlePointx + radius * pow(cos(i),2/n), middlePointy + radius * pow(sin(i),2*n));
    point(middlePointx + radius * pow(cos(i),2*n), middlePointy + radius * pow(sin(i),2*n));
    */
  }
}