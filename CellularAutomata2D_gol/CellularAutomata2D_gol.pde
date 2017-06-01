int xLength = 1600;
int yLength = 1600;
int[][] lineArray = new int[xLength/4][yLength/4];
int lineFeed = 0;

Ruleset2D myRules = new Ruleset2D();

void setup()
{
  noSmooth();
  background(255);
  for (int i = 0; i < yLength/4; i++)
  {
    for (int j = 0; j < xLength/4; j++)
    {
      lineArray[j][i] = 0;
    }
  }

  lineArray[lineArray.length / 2][lineArray[0].length / 2] = 1;
  lineArray[lineArray.length / 2 + 1][lineArray[0].length / 2 + 1] = 1;
  lineArray[lineArray.length / 2 + 2][lineArray[0].length / 2 + 2] = 1;

  size(1600, 1600);
}

void draw()
{
  drawArr(lineArray);
}

void drawArr(int[][] arr)
{

  scale(4, 4);
  for (int y = 0; y < arr.length; y++)
  {
    for (int x = 0; x < arr[0].length; x++)
    {
      if (arr[x][y] == 1)
      {
        stroke(0, 0, 0);
      } else
      {
        stroke(255, 255, 255);
      }
      point(x, y);
    }
  }
  
  nextEvolution(arr);

  /*
  loadPixels();
   PImage background = pixels;
   */
}

void nextEvolution(int[][] arr)
{
  int[][] tempArray = new int[arr.length][arr[0].length];

  for (int y = 0; y < arr[0].length-1; y++)
  {
    for(int x = 0; x < arr.length-1; x++)
    {
      int cellsAlive = 0;
      cellsAlive += ArrayLogic.getTopLeft(arr, x, y);
      cellsAlive += ArrayLogic.getTop(arr, x, y);
      cellsAlive += ArrayLogic.getTopRight(arr, x, y);
      cellsAlive += ArrayLogic.getLeft(arr, x, y);
      cellsAlive += ArrayLogic.getRight(arr, x, y);
      cellsAlive += ArrayLogic.getBottomLeft(arr, x, y);
      cellsAlive += ArrayLogic.getBottom(arr, x, y);
      cellsAlive += ArrayLogic.getBottomRight(arr, x, y);
      
      tempArray[x][y] = myRules.getNext(cellsAlive);
    }
  }

  lineArray = tempArray;
}