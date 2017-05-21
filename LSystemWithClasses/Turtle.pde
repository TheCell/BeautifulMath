class Turtle
{
  private float distance;
  private float angle;

  Turtle(float distance, float angleRadiant)
  {
    this.distance = distance;
    this.angle = angleRadiant;
  }

  void execute(Sym symbol)
  {
    switch(symbol)
    {
    case TD:
      line(0, 0, 0, distance);
      translate(0, distance);
      break;
    case TU:
      translate(0, distance);
      break;
    case RR:
      rotate(angle);
      break;
    case RL:
      rotate(-angle);
      break;
    case RB:
      popMatrix();
      break;
    case LB:
      pushMatrix();
      break;
    default:
      println("unknown command");
      break;
    }
  }
}