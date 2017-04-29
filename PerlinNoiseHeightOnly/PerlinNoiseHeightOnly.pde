float rand;
int sizeX = 1600;
int sizeY = 1600;
int loopCounter = 0;
float[][][] perlinNoise = new float[sizeX][sizeY][1];
float[][][] grid = new float[sizeX/64 +1][sizeY/64 +1][1];

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
      // input random x and y vector 0 to 1
      grid[x][y][0] = random(0, 1.0);
      
      grid[x][y][0] = grid[x][y][0];
    }
  }

  for (int y = 0; y < sizeY; y++)
  {
    for (int x = 0; x < sizeX; x++)
    {
      perlinNoise[x][y][0] = perlin(x, y);
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

  strokeWeight(3);
  stroke(255, 255, 255);

  for (int y = 0; y < sizeY; y++)
  {
    for (int x = 0; x < sizeX; x++)
    {
      float bwgradient = lerp(0,255, perlinNoise[x][y][0]);
      stroke(bwgradient, bwgradient, bwgradient);
      point(x, y);
    }
  }
  System.out.println("done");
}

// Computes the dot product of the distance and gradient vectors.
float dotGridGradient(int gridX, int gridY, float x, float y)
{
  // Compute the distance vector
  float dx = 1.0/(1600/25)*(x - (float)(gridX)*64);

  return abs(dx*grid[gridX][gridY][0]);
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