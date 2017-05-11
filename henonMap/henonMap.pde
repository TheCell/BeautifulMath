PVector[][] pointArr;
int squaresize = 100;
int xOffset = 1000;
int yOffset = 1000;
int counter = 0;

void setup()
{
  size(1500, 1500);

  pointArr = new PVector[squaresize][squaresize];

  for (int y = 0; y < squaresize; y++)
  {
    for (int x = 0; x < squaresize; x++)
    {
      pointArr[y][x] = new PVector(x, y);
    }
  }
}

void draw()
{
  background(204);
  
  for (int i = 0; i < squaresize; i++)
  {
    for (int j = 0; j < squaresize; j++)
    {
      point(pointArr[i][j].x+xOffset, pointArr[i][j].y+yOffset);
    }
  }

  if (counter < 10)
  {
    calcHenonMap(0.1, 1);
    counter++;
    saveFrame("henonMap##");
  }
}

public void calcHenonMap(float a, float b)
{
  for (int y = 0; y < squaresize; y++)
  {
    for (int x = 0; x < squaresize; x++)
    {
      float tempVal = pointArr[y][x].x;
      
      pointArr[y][x].x = pointArr[y][x].y;
      pointArr[y][x].y =1-a*pointArr[y][x].y*pointArr[y][x].y + b*tempVal;
    }
  }
}