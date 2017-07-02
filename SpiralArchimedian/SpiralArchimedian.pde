void setup() {
  size(500, 500);
  background(255,255,255);
  int middlex = 250;
  int middley = 250;
  int r = 5;
  float distance = 0.2;
  drawArchimedianSpiral(r, distance, middlex, middley);
  println("done");
}

void drawArchimedianSpiral(float radius, float distance, float x, float y)
{
  float lastX, lastY;
  lastX = x + radius;
  lastY = y;
  
  for (float i = 0; i < 720; i += distance)
  {
    //point(x + radius*cos(i), y + radius*sin(i));
    line(lastX, lastY, x + radius*cos(i), y + radius*sin(i));
    
    radius = radius + distance;
    lastX = x + radius*cos(i);
    lastY = y + radius*sin(i);
  }
}