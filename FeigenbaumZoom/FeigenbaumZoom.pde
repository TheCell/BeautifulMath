float tempVal = 1.2;
float tempR = 1.8;
int yStretchFactor = 700;
int xStretchFactor = 900;
int xOffset = 750;
int yOffset = (height/2);
float rStepsize = 0.001;
float minR = 0.9;
float maxR = 3.0;

void setup()
{
  size(2000, 1000);
}

void draw()
{
  printArea(minR, maxR, rStepsize);
  minR += 0.01;
  maxR -= 0.01;
  rStepsize -= 0.1;
  yStretchFactor += 100;
  xStretchFactor += 100;
  //background(204);
  /*
  printCalcHausdorffDimensionLine(300, tempR);
   if (tempR < 4.2)
   {
   tempR += 0.001;
   }
   */
}

public float calcHausdorffDimension(float p, float r)
{
  return p+r*p*(1-p);
}

public void printCalcHausdorffDimensionLine(int amountOfPoints, float r)
{
  int nMax = 100 + amountOfPoints;
  tempVal = 0.1;

  for (int i = 0; i < nMax; i++)
  {
    if (i > 100)
    {
      point(r*xStretchFactor-xOffset, yStretchFactor*(tempVal)+yOffset);
    }

    tempVal = calcHausdorffDimension(tempVal, r);
  }
}

public void printArea(float rMin, float rMax, float rStepsize)
{
  background(204);
  for (float min = rMin; min < rMax; min += rStepsize)
  {
    printCalcHausdorffDimensionLine(200, min);
  }
}