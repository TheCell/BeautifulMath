import java.util.*;

public final class MinskyCircleCalc
{
  private double x;
  private double y;
  private double dx = 0.03;
  private double dy = 0.03;
  private Map<String, Integer> options = new HashMap<String, Integer>();

  public MinskyCircleCalc()
  {
    this(0.0d, 1.0d);
  }

  public MinskyCircleCalc(
    double x, 
    double y)
  {
    this.x = x;
    this.y = y;
    options.put("round", 0);
  }

  public void setOption(
    String optionName, 
    Integer value)
  {
    options.replace(optionName, value);
  }

  public double nextX()
  {
    if(options.get("round") == 0)
    {
      this.x += dx * this.y;
    }
    else
    {
      this.x += Math.floor(dx * this.y);
    }
    return this.x;
  }

  public double nextY()
  {
    if(options.get("round") == 0)
    {
      this.y -= dy * this.x;
    }
    else
    {
      this.y -= Math.floor(dy * this.x);
    }
    
    return this.y;
  }
}