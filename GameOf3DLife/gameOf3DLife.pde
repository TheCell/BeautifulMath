int xLength = 1600;
int yLength = 1600;
int zLength = 1600;
int scaleFactor = 64;
Ruleset2D myRules = new Ruleset2D();
float testitestx = 0.0;
int lastTime = second();
float rotateY = 0.0;
int debugger = 0;

// x, y, z
int[][][] lineArray = new int[xLength/scaleFactor][yLength/scaleFactor][zLength/scaleFactor];

//Ruleset2D myRules = new Ruleset2D();

void setup()
{
  noSmooth();
  background(255);
  for (int y = 0; y < lineArray[0].length; y++)
  {
    for (int x = 0; x < lineArray.length; x++)
    {
      for(int z = 0; z < lineArray[0][0].length; z++)
      {
        lineArray[x][y][z] = 0;
      }
    }
  }

  lineArray[lineArray.length / 2][lineArray[0].length / 2][lineArray[0][0].length / 2] = 1;
  lineArray[lineArray.length / 2 + 1][lineArray[0].length / 2 + 1][lineArray[0][0].length / 2] = 1;
  lineArray[lineArray.length / 2 + 2][lineArray[0].length / 2 + 2][lineArray[0][0].length / 2] = 1;
  lineArray[0][0][0] = 1;
  lineArray[lineArray.length -1][0][0] = 1;
  lineArray[lineArray.length -1][lineArray[0].length -1][0] = 1;
  lineArray[lineArray.length -1][0][lineArray[0][0].length -1] = 1;

  size(1600, 1600, P3D);
  //ortho();
  //camera(0, 0, 0, (xLength/scaleFactor)/2, (yLength/scaleFactor)/2, (-zLength/scaleFactor)/2, 0, -1, 0);
}

void draw()
{
  /*
  translate(0, yLength/2, -zLength/2);
  rotateX(PI +PI/4);
  */
  //translate(0, -yLength/2, zLength);
  translate(xLength/2, 0, -zLength/2);
  rotateY(rotateY);
  translate(-xLength/2, 0, zLength/2);
  
  translate(0, -yLength/8, (-zLength)/2);
  rotateX(-PI/4);
  
  if(rotateY >= TWO_PI)
  {
    rotateY = 0;
  }
  else
  {
    rotateY += PI/128;
  }
  
  /*
  testitestx += PI/32;
  if(testitestx > TWO_PI)
  {
    testitestx = 0;
  }
  */
  //rotateY(PI/4);
  //translate(-xLength/scaleFactor, yLength/scaleFactor, 0);
  background(255);
  drawArr(lineArray);
  if(millis() - lastTime > 1000)
  {
    lastTime = millis();
    nextEvolution(lineArray);
  }
  
  
  /*
  fill(50);
  textSize(50);
  text(testitestx, 100, 100, 0);
  */
}

void drawArr(int[][][] arr)
{
  scale(scaleFactor, scaleFactor, scaleFactor);
  for (int y = 0; y < arr[0].length; y++)
  {
    for (int x = 0; x < arr.length; x++)
    {
      for (int z = arr[0][0].length -1; z > 0; z--)
      {
        if (arr[x][y][z] == 1)
        {
          stroke(0, 150, 0);
          strokeWeight(0.1);
          drawCubicle(x, y, z);
        } else
        {
          stroke(255, 255, 255);
          noFill();
        }
        //point(x, y, z);
        
      }
    }
  }
}

void drawCubicle(int x, int y, int z)
{
  pushMatrix();
  
  //rotateX(0.1);
  //rotateY(0.1);
  //translate(-10, -10, -10);
  fill(0);
  
  beginShape(TRIANGLES);
  // top
  vertex(x, y, z);
  vertex(x +1, y, z -1);
  vertex(x +1, y, z);
  vertex(x, y, z);
  vertex(x +1, y, z -1);
  vertex(x, y, z -1);

  // front
  vertex(x, y, z);
  vertex(x +1, y +1, z);
  vertex(x +1, y, z);
  vertex(x, y, z);
  vertex(x +1, y +1, z);
  vertex(x, y +1, z);
  
  // left
  vertex(x, y, z);
  vertex(x, y +1, z -1);
  vertex(x, y +1, z);
  vertex(x, y, z);
  vertex(x, y +1, z -1);
  vertex(x, y, z -1);
  
  // right
  vertex(x +1, y, z);
  vertex(x +1, y +1, z -1);
  vertex(x +1, y, z -1);
  vertex(x +1, y, z);
  vertex(x +1, y +1, z -1);
  vertex(x +1, y +1, z);
  
  // behind
  vertex(x, y, z -1);
  vertex(x, y +1, z -1);
  vertex(x +1, y +1, z -1);
  vertex(x, y, z -1);
  vertex(x +1, y, z -1);
  vertex(x +1, y +1, z -1);
  
  // bottom
  vertex(x, y +1, z);
  vertex(x +1, y +1, z);
  vertex(x +1, y +1, z -1);
  vertex(x, y +1, z);
  vertex(x, y +1, z -1);
  vertex(x +1, y +1, z -1);
  
  endShape();
  popMatrix();
}

void nextEvolution(int[][][] arr)
{
  println("nextEvo" + debugger);
  debugger++;
  int[][][] tempArray = new int[arr.length][arr[0].length][arr[0][0].length];

  for (int y = 1; y < arr[0].length-2; y++)
  {
    for(int x = 1; x < arr.length-2; x++)
    {
      for(int z = 1; z < arr[0][0].length -2; z++)
      {
        int cellsAlive = 0;
        // level 0
        // top left to right
        cellsAlive += arr[x -1][y -1][z];
        cellsAlive += arr[x][y -1][z];
        cellsAlive += arr[x +1][y -1][z];
        // mid left and right
        cellsAlive += arr[x -1][y][z];
        cellsAlive += arr[x +1][y][z];
        // bottom left to right
        cellsAlive += arr[x -1][y +1][z];
        cellsAlive += arr[x][y +1][z];
        cellsAlive += arr[x +1][y +1][z];

        // level -1
        // top left to right
        cellsAlive += arr[x -1][y -1][z -1];
        cellsAlive += arr[x][y -1][z -1];
        cellsAlive += arr[x +1][y -1][z -1];
        // mid left and right
        cellsAlive += arr[x -1][y][z -1];
        cellsAlive += arr[x][y][z -1];
        cellsAlive += arr[x +1][y][z -1];
        // bottom left to right
        cellsAlive += arr[x -1][y +1][z -1];
        cellsAlive += arr[x][y +1][z -1];
        cellsAlive += arr[x +1][y +1][z -1];

        // level 1
        // top left to right
        cellsAlive += arr[x -1][y -1][z +1];
        cellsAlive += arr[x][y -1][z +1];
        cellsAlive += arr[x +1][y -1][z +1];
        // mid left and right
        cellsAlive += arr[x -1][y][z +1];
        cellsAlive += arr[x][y][z +1];
        cellsAlive += arr[x +1][y][z +1];
        // bottom left to right
        cellsAlive += arr[x -1][y +1][z +1];
        cellsAlive += arr[x][y +1][z +1];
        cellsAlive += arr[x +1][y +1][z +1];
        
        tempArray[x][y][z] = myRules.getNext(cellsAlive);
      }
    }
  }

  lineArray = tempArray;
}