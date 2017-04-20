void setup()
{
  size(300, 300);
  background(255,255,255);
}

void draw()
{
  circleFromSinus(5,5,100,100);
  circle(5,5,100,100);
}

void circleFromSinus(int xStart, int yStart, int xEnd, int yEnd)
{
  int xMiddlepoint = xEnd - xStart;
  int yMiddlepoint = yEnd - yStart;
  
  for(float i = 0; i < TWO_PI; i += PI/512)
  {
    if(i < PI)
    {
      point(i*40, 50+sin(i)*60.0);
    }
    else
    {
      point((i-PI)*40, 50+sin(i)*60.0);
    }
  }
}

void circle(int xStart, int yStart, int xEnd, int yEnd)
{
  int xMiddlepoint = xEnd - xStart;
  int yMiddlepoint = yEnd - yStart;
  
  /*
  point(xMiddlepoint, yStart);
  point(xMiddlepoint, yEnd);
  point(xStart, yMiddlepoint);
  point(xEnd, yMiddlepoint);
  */
  
  translate(xMiddlepoint, yMiddlepoint);
  
  for(float i = 0; i < TWO_PI; i += PI/512)
  {
    point(0, yMiddlepoint - yStart);
    //point(0, yEnd - yMiddlepoint);
    //point(xMiddlepoint - xStart, 0);
    //point(xEnd - xMiddlepoint, 0);
    rotate(i);
  }
}