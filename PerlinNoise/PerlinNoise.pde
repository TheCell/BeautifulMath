void setup() {
  size(1600, 1600);
  background(0,0,0);
  randomSeed(1337); // kekekeke -sorry
  
  textSize(32);
  text("loading", 730, 750);
  
  // fill array with max values
  for(int y = 0; y <= sizeY/64; y++)
  {
    for(int x = 0; x <= sizeX/64; x++)
    {
      if(x%5==0)
      {
        //System.out.println(random(0, 1.0));
      }
      grid[x][y][0] = random(0, 1.0);
      grid[x][y][1] = random(0, 1.0);
    }
  }
  
  for(int y = 0; y < sizeY; y++)
  {
    for(int x = 0; x < sizeX; x++)
    {
      perlinNoise[x][y][0] = perlin(x, y);
    }
  }
}

float rand;
int sizeX = 1600;
int sizeY = 1600;
float x = -750;
float y = -750;
float i = 0;
int loopCounter = 0;
float frequency = 1;
float amplitude = 1;
float maxValue = 0;
float[][][] perlinNoise = new float[sizeX][sizeY][1];
float[][][] grid = new float[sizeX/64 +1][sizeY/64 +1][2];

void draw()
{

  if(loopCounter == 0)
  {
    background(0,0,0);
  }
  loopCounter++;
  
  // draw shit
  //translate(750,750);
  strokeWeight(3);
  stroke(255, 255, 255);
  
  for(int y = 0; y < sizeY; y++)
  {
    for(int x = 0; x < sizeX; x++)
    {
      float bwgradient = ((1.0/255) * perlinNoise[x][y][0]);
      if(x%1000==0)
      {
        //System.out.println(perlinNoise[x][y][0]);
      }
      //System.out.println(bwgradient);
      stroke(bwgradient, bwgradient, bwgradient);
      point(x,y);
    }
  }
  
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
  float dx = x - (float)gridX;
  float dy = y - (float)gridY;
  
  if(x%100==0)
  {
    //System.out.println("dx: " + dx + " x:" + x + " gridX:" + (gridX-1));
    System.out.println("dx: " + dx + " 1/(1600/64):" + (1/(1600/64)) + " *(x - (float)(gridX -1)*64):" + (x - (float)(gridX -1)*64));
  }
  return dx*grid[gridX][gridY][0] + dy*grid[gridX][gridY][1];
}


// Computes the y vector for given pixel
float dotTestiGradient(int gridX, int gridY, float x, float y)
{
  // testitest
  float dx = (float)1/(1600/26)*(x - (float)(gridX -1)*64);
  float dy = (float)1/(1600/26)*(y - (float)(gridY -1)*64);
  
  if(x%100==0)
  {
    //System.out.println("dx: " + dx + " x:" + x + " gridX:" + (gridX-1));
    System.out.println("dx: " + dx + " 1/(1600/64):" + (1/(1600/64)) + " *(x - (float)(gridX -1)*64):" + (x - (float)(gridX -1)*64));
  }
  return dx*grid[gridX][gridY][0] + dy*grid[gridX][gridY][1];
}

float perlin(float x, float y)
{
  int x0 = floor(x/64);
  int x1 = x0 + 1;
  int y0 = floor(y/64);
  int y1 = y0 + 1;
  
  float sx = x - (float)x0;
  float sy = y - (float)y0;
  
  float n0, n1, ix0, ix1, value;
  n0 = dotGridGradient(x0, y0, x, y);
  n1 = dotGridGradient(x1, y0, x, y);
  ix0 = lerp(n0, n1, sx);
  n0 = dotGridGradient(x0, y1, x, y);
  n0 = dotGridGradient(x1, y0, x, y);
  ix1 = lerp(n0, n1, sx);
  value = lerp(ix0, ix1, sy);
  
  return value;
}