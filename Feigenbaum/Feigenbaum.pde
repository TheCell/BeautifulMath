float tempVal = 1.2;
float tempR = 1.8;
int yStretchFactor = 400;
int xStretchFactor = 900;
int xOffset = 1300;
int yOffset = (height/2)+200;

int nMin = 100;
int nMax = 200;

void setup()
{
  size(2000, 1000);
}

void draw()
{
  //background(204);
  tempVal = 0.1;
  for (int i = 0; i < nMax; i++)
  {
    if (i > nMin)
    {
      //line(i,factor*lastVal+(height/2),i+1,factor*tempVal+(height/2));
      point(tempR*xStretchFactor-xOffset, yStretchFactor*(tempVal)+yOffset);
    }

    tempVal = calcHausdorffDimension(tempVal, tempR);
  }
  if (tempR < 4.2)
  {
    tempR += 0.001;
  }
}

public float calcHausdorffDimension(float p, float r)
{
  return p+r*p*(1-p);
}