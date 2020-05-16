static class vec2
{
  float x, y;
  
  vec2()
  {
    x = 0;
    y = 0;
  }
  
  vec2(float x)
  {
    this.x = x;
    this.y = x;
  }
  
  vec2(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  vec2(vec2 a)
  {
    x = a.x;
    y = a.y;
  }
  
  static vec2 sum(vec2 a, float b)
  {
    return new vec2(a.x + b, a.y + b);
  }

  static vec2 sum(float a, vec2 b)
  {
    return new vec2(a + b.x, a + b.y);
  }

  static vec2 sum(vec2 a, vec2 b)
  {
    return new vec2(a.x + b.x, a.y + b.y);
  }
  
  static vec2 sub(vec2 a, float b)
  {
    return new vec2(a.x - b, a.y - b);
  }
  
  static vec2 sub(float a, vec2 b)
  {
    return new vec2(a - b.x, a - b.y);
  }

  static vec2 sub(vec2 a, vec2 b)
  {
    return new vec2(a.x - b.x, a.y - b.y);
  }
  
  static vec2 mul(vec2 a, float b)
  {
    return new vec2(a.x * b, a.y * b);
  }

  static vec2 mul(float a, vec2 b)
  {
    return new vec2(a * b.x, a * b.y);
  }

  static vec2 mul(vec2 a, vec2 b)
  {
    return new vec2(a.x * b.x, a.y * b.y);
  }
  
  static vec2 div(vec2 a, float b)
  {
    assert(b != 0);
    return new vec2(a.x / b, a.y / b);
  }
  
  static vec2 div(float a, vec2 b)
  {
    assert(b.x != 0 && b.y != 0);
    return new vec2(a / b.x, a / b.y);
  }

  static vec2 div(vec2 a, vec2 b)
  {
    assert(b.x != 0 && b.y != 0);
    return new vec2(a.x / b.x, a.y / b.y);
  }
  
  static float dot(vec2 a, vec2 b)
  {
    return a.x * b.x + a.y * b.y;
  }
  
  static float length(vec2 a)
  {
    return sqrt(dot(a, a));
  }
  
  static float dist(vec2 a, vec2 b)
  {
    return sqrt(length(sub(a, b)));
  }
  
  static vec2 normalize(vec2 a)
  {
    return new vec2(div(a, length(a)));
  }
}
