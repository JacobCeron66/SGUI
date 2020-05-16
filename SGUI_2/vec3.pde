static class vec3
{
  
  float x, y, z;
  
  vec3()
  {
    x = 0;
    y = 0;
    z = 0;
  }
  
  vec3(float x)
  {
    this.x = x;
    y = x;
    z = x;
  }
  
  vec3(vec2 a, float z)
  {
    this.x = a.x;
    y = a.y;
    this.z = z;
  }
  
  vec3(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  vec3(vec3 a)
  {
    x = a.x;
    y = a.y;
    z = a.z;
  }
  
  static vec3 sum(vec3 a, float b)
  {
    return new vec3(a.x + b, a.y + b, a.z + b);
  }

  static vec3 sum(float a, vec3 b)
  {
    return new vec3(a + b.x, a + b.y, a + b.z);
  }

  static vec3 sum(vec3 a, vec3 b)
  {
    return new vec3(a.x + b.x, a.y + b.y, a.z + b.z);
  }
  
  static vec3 sub(vec3 a, float b)
  {
    return new vec3(a.x - b, a.y - b, a.z - b);
  }
  
  static vec3 sub(float a, vec3 b)
  {
    return new vec3(a - b.x, a - b.y, a - b.z);
  }

  static vec3 sub(vec3 a, vec3 b)
  {
    return new vec3(a.x - b.x, a.y - b.y, a.z - b.z);
  }
  
  static vec3 mul(vec3 a, float b)
  {
    return new vec3(a.x * b, a.y * b, a.z * b);
  }

  static vec3 mul(float a, vec3 b)
  {
    return new vec3(a * b.x, a * b.y, a * b.z);
  }

  static vec3 mul(vec3 a, vec3 b)
  {
    return new vec3(a.x * b.x, a.y * b.y, a.z * b.z);
  }
  
  static vec3 div(vec3 a, float b)
  {
    assert(b != 0);
    return new vec3(a.x / b, a.y / b, a.z / b);
  }
  
  static vec3 div(float a, vec3 b)
  {
    assert(b.x != 0 && b.y != 0 && b.z != 0);
    return new vec3(a / b.x, a / b.y, a / b.z);
  }

  static vec3 div(vec3 a, vec3 b)
  {
    assert(b.x != 0 && b.y != 0 && b.z != 0);
    return new vec3(a.x / b.x, a.y / b.y, a.z / b.z);
  }
  
  static float dot(vec3 a, vec3 b)
  {
    return a.x * b.x + a.y * b.y + a.z * b.z;
  }
  
  static float length(vec3 a)
  {
    return sqrt(dot(a, a));
  }
  
  static float dist(vec3 a, vec3 b)
  {
    return sqrt(length(sub(a, b)));
  }
  
  static vec3 normalize(vec3 a)
  {
    return new vec3(div(a, length(a)));
  }
}
