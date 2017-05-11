float tempVal = 1.2;
float lastVal = 0;
float tempR = 0.01;
int factor = 100;
int xOffset = 100;

void setup()
{
  size(2000, 600);
  
  for(int i = 0; i < 2000; i++)
  {
    line(i+xOffset,factor*lastVal+(height/2),i+1+xOffset,factor*tempVal+(height/2));
    //point(i, 10*(tempVal)+(height/2));
    println(tempVal);
    lastVal = tempVal;
    
    tempVal = calcHausdorffDimension(tempVal);
  }
}

void draw()
{
  background(204);
  tempVal = 2.1;
  for(int i = 0; i < 2000; i++)
  {
    line(i,factor*lastVal+(height/2),i+1,factor*tempVal+(height/2));
    //point(i, factor*(tempVal)+(height/2));
    lastVal = tempVal;
    
    tempVal = calcHausdorffDimension(tempVal, tempR);
  }
  if(tempR < 4)
  {
    tempR += 0.001;
  }
  
}

public float calcHausdorffDimension(float p)
{
  float r = 0.05;
  return p+r*p*(1-p);
}

public float calcHausdorffDimension(float p, float r)
{
  return p+r*p*(1-p);
}