float cxadd = -.75;
float c2yadd = 0;
int size = 1500;
int y = 0;
boolean drawingComplete = false;
float mandelbrotEdge = 2; // mandelbrot is from -1.5 to 1.5 everything else approaches infinity
float zoomFactor = 1; // >1 for magnify, <1 for minify 
float xOffset = 0; // from -2 to 2 for reasonable offsets
float yOffset = 0; // from -2 to 2 for reasonable offsets
int maxIterations = 360;

void setup()
{
  background(0);
  size(1500, 1500);
}

void draw()
{
  if (!drawingComplete)
  {
    for (int draw3Lines = 0; draw3Lines < 50; draw3Lines++)
    {
      for (int x = 0; x < size; x++)
      {
        float mappedNumberX = map(x, 0, size, -mandelbrotEdge/zoomFactor, mandelbrotEdge/zoomFactor);
        float mappedNumberY = map(y, 0, size, -mandelbrotEdge/zoomFactor, mandelbrotEdge/zoomFactor);

        int counter = Julia(mappedNumberX+xOffset, mappedNumberY+yOffset, cxadd, c2yadd, mandelbrotEdge+2, maxIterations);
        setColor(counter, maxIterations);
        point(x, y);
      }

      if (y >= size)
      {
        y = 0;
        drawingComplete = true;
        //zoomFactor += 1;
        //xOffset += 0.1;
        //cxadd += 0.1;
        //c2yadd += 0.1;
        //saveFrame("frame####.png");
      } else
      {
        y++;
      }
    }
  }
}

int Julia(float x, float y, float xadd, float yadd, float maxBetrag, int maxIterations)
{
  int remainingIterations = maxIterations;
  float xx = x*x;
  float yy = y*y;
  float xy = x*y;
  float betrag2 = xx + yy;

  while (betrag2 <= maxBetrag && remainingIterations > 0)
  {
    remainingIterations--;
    x = xx - yy + xadd;
    y = xy + xy + yadd;
    xx = x*x;
    yy = y*y;
    xy = x*y;
    betrag2 = xx + yy;
  }

  return maxIterations - remainingIterations;
}

void setColor(int iteration, int maxIteration)
{
  colorMode(HSB, maxIteration);
  if (iteration < maxIteration)
  {
    stroke(iteration*10%maxIteration, maxIteration, maxIteration, maxIteration);
  } else
  {
    stroke(0, maxIteration, 0);
  }
}