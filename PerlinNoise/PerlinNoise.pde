float rand;
int sizeX = 1600;
int sizeY = 1600;
int loopCounter = 0;
float[][][] perlinNoise = new float[sizeX][sizeY][1];
float[][][] grid = new float[sizeX/64 +1][sizeY/64 +1][2];

void setup()
{
  size(1600, 1600);
  background(0, 0, 0);
  randomSeed(1337); // kekekeke -sorry

  textSize(32);
  text("loading", 730, 750);

  // fill array with max values
  for (int y = 0; y <= sizeY/64; y++)
  {
    for (int x = 0; x <= sizeX/64; x++)
    {
      // input random x and y vector -1 to 1
      grid[x][y][0] = random(-1.0, 1.0);
      grid[x][y][1] = random(-1.0, 1.0);

      // make the vector parts as unitvector
      float norm = sqrt(pow(abs(grid[x][y][0]), 2)+pow(abs(grid[x][y][1]), 2));
      grid[x][y][0] = grid[x][y][0] / norm;
      grid[x][y][1] = grid[x][y][1] / norm;

      if (x%75==0)
      {
        //System.out.println("vector x:" + grid[x][y][0] + " vector y:" + grid[x][y][1]);
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
      //float bwgradient = ((1.0/255) * perlinNoise[x][y][0]);
      float bwgradient = lerp(0,255, perlinNoise[x][y][0]);
      if (x%1000==0)
      {
        //System.out.println("perlin: " + perlinNoise[x][y][0] + " gives bwgradient: " + bwgradient);
      }
      //System.out.println(bwgradient);
      stroke(bwgradient, bwgradient, bwgradient);
      point(x, y);
    }
  }
  System.out.println("done");
}

/*
// Function to linearly interpolate between a0 and a1
 // Weight w should be in the range [0.0, 1.0]
 function lerp(float a0, float a1, float weight)
 {
 return (1.0 - weight)*a0 + weight*a1;
 }
 */

// Computes the dot product of the distance and gradient vectors.
float dotGridGradient(int gridX, int gridY, float x, float y)
{
  // Precomputed (or otherwise) gradient vectors at each grid node
  // float perlinNoise[IYMAX][IXMAX][2];

  // Compute the distance vector
  //float dx = x - (float)gridX;
  //float dy = y - (float)gridY;
  float dx = 1.0/(1600/25)*(x - (float)(gridX)*64);
  float dy = 1.0/(1600/25)*(y - (float)(gridY)*64);

  return abs(dx*grid[gridX][gridY][0] + dy*grid[gridX][gridY][1]);
}

float perlin(float x, float y)
{
  int x0 = floor(x/64);
  int x1 = x0 + 1;
  int y0 = floor(y/64);
  int y1 = y0 + 1;

  // real x - gridX*Pixels per Grid cell
  float scaleX = x - (float)x0*64;
  float scaleY = y - (float)y0*64;

  // normalize scaleX and scaleY
  // Important Sidenote: if we don't write 1.0 it will calculate integers, gives 0
  scaleX = (1.0/64)*scaleX;
  scaleY = (1.0/64)*scaleY;

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