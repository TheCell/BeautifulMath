/**
 * http://home.pipeline.com/~hbaker1/hakmem/hacks.html#item149
 * https://nbickford.wordpress.com/2011/04/03/the-minsky-circle-algorithm/
 * http://cabezal.com/misc/minsky-circles.html
 **/

int screenWidth = 1600;
int screenHeight = 1600;
int zoomFactor = screenWidth / 6;
double x = 0;
double y = 1;
MinskyCircleCalc mcc = new MinskyCircleCalc();

void settings()
{
  size(screenWidth, screenHeight);
}

void setup()
{
  background(255);
  mcc.setOption("round", 0);
}

void draw()
{
  translate(screenWidth / 2, screenHeight / 2);
  
  x = mcc.nextX();
  y = mcc.nextY();
  
  point((float) x * zoomFactor, (float) y * zoomFactor);
}