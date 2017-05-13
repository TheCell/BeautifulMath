float rand;
int sizeX = 1600;
int sizeY = 1600;
int gridSize = 64;
int loopCounter = 0;
float[][][] perlinNoise = new float[sizeX][sizeY][1];
PVector[][] grid = new PVector[sizeX/gridSize +1][sizeY/gridSize +1];

void setup()
{
  size(1600, 1600);
  background(0, 0, 0);
  randomSeed(1337); // kekekeke -sorry

  textSize(32);
  text("loading", 730, 750);

  // fill array with max values
  for (int y = 0; y <= sizeY/gridSize; y++)
  {
    for (int x = 0; x <= sizeX/gridSize; x++)
    {
      // input random x and y vector -1 to 1 and normalize
      grid[x][y] = new PVector(random(-1.0, 1.0), random(-1.0, 1.0)).normalize();
      if(y==5 && x == 5)
      {
        print(grid[x][y]);
      }
      
    }
  }

  for (int y = 0; y < sizeY; y++)
  {
    for (int x = 0; x < sizeX; x++)
    {
      perlinNoise[x][y][0] = perlin(x, y);
      if (x%100==0)
      {
        //System.out.println("perlinNoise[x][y][0]:" + perlinNoise[x][y][0]);
      }
    }
  }
}

void draw()
{

  if (loopCounter == 0)
  {
    background(0, 0, 0);
  }
  loopCounter++;

  // draw shit
  //translate(750,750);
  strokeWeight(3);
  stroke(255, 255, 255);

  for (int y = 0; y < sizeY; y++)
  {
    for (int x = 0; x < sizeX; x++)
    {
      float bwgradient = lerp(0, 255, (perlinNoise[x][y][0]+1)/2);
      if (x%1000==0)
      {
        //System.out.println("perlin: " + perlinNoise[x][y][0] + " gives bwgradient: " + bwgradient);
      }
      stroke(bwgradient, bwgradient, bwgradient);
      point(x, y);
    }
  }
  //System.out.println("done");
}

// Computes the dot product of the distance and gradient vectors.
float dotGridGradient(int gridX, int gridY, float x, float y)
{
  // Compute the distance vector
  float dx = 1.0/(sizeX/gridSize)*(x - (float)(gridX)*gridSize);
  float dy = 1.0/(sizeY/gridSize)*(y - (float)(gridY)*gridSize);
  
  float xVector = grid[gridX][gridY].x * dx;
  float yVector = grid[gridX][gridY].y * dy;
  
  return xVector + yVector;
}

float perlin(float x, float y)
{
  int x0 = floor(x/gridSize);
  int x1 = x0 + 1;
  int y0 = floor(y/gridSize);
  int y1 = y0 + 1;

  // real x - gridX*Pixels per Grid cell
  float scaleX = x - (float)x0*gridSize;
  float scaleY = y - (float)y0*gridSize;

  // normalize scaleX and scaleY
  // Important Sidenote: if we don't write 1.0 it will calculate integers, gives 0
  scaleX = (1.0/gridSize)*scaleX;
  scaleY = (1.0/gridSize)*scaleY;

  float n0, n1, ix0, ix1, value;
  n0 = dotGridGradient(x0, y0, x, y);
  n1 = dotGridGradient(x1, y0, x, y);
  ix0 = lerp(n0, n1, scaleX);
  n0 = dotGridGradient(x0, y1, x, y);
  n1 = dotGridGradient(x1, y1, x, y);
  ix1 = lerp(n0, n1, scaleX);
  value = lerp(ix0, ix1, scaleY);

  return value;
}