PShape shape;
PShader shader;

vec2 size;
vec2 pos;

float res;
float bevel;
float border;
float intensity;

float t1;
float t2;
float t3;

vec3 iColor;
vec3 bColor;
vec3 sColor;

void setup()
{
  size(1024, 720, P2D);
  
  size = new vec2(150, 50);
  pos = new vec2(0, 0);
  
  res = max(size.x, size.y)*2;
  bevel = 0;
  border = 0;
  
  iColor = new vec3(.2, .8, 1);
  bColor = new vec3(.5, .9, 1);
  sColor = new vec3(.5);
  
  shader = loadShader("Shaders/quad-fsh.glsl", "Shaders/quad-vsh.glsl");
  createQuad();
}

void draw()
{
  background(240);
  
  if (keyPressed)
  {
    if (key == 'b')
      t1 += .01;
    else if (key == 'v')
      t1 -= .01;
      
    if (key == 's')
      t2 += .01;
    else if (key == 'a')
      t2 -= .01;
      
    if (key == 'i')
      t3 += .01;
    else if (key == 'u')
      t3 -= .01;
  }
  
  t1 = clamp(t1, 0, 1);
  t2 = clamp(t2, 0, 1);
  t3 = clamp(t3, 0, 1);
  
  bevel(t1);
  border(t2);
  intensity(t3);
  show();
}

void createQuad()
{
  shape = createShape();
  shape.beginShape(TRIANGLE_STRIP);
  shape.noStroke();
  shape.vertex(-res,  res);
  shape.vertex( res,  res);
  shape.vertex(-res, -res);
  shape.vertex( res, -res);
  shape.endShape();
}

void show()
{
  translate(pos.x+mouseX, pos.y+mouseY);
  shader(shader);
  
  shader.set("u_res", res);
  shader.set("u_size", size.x, size.y);
  shader.set("u_bevel", bevel);
  shader.set("u_border", border);
  shader.set("u_intensity", intensity);
  shader.set("u_iColor", iColor.x, iColor.y, iColor.z);
  shader.set("u_bColor", bColor.x, bColor.y, bColor.z);
  shader.set("u_sColor", sColor.x, sColor.y, sColor.z);
  
  shape(shape);
}

float mix(float a, float b, float t)
{
  t = clamp(t, 0, 1);
  return a * (1 - t) + b * t;
}

float clamp(float t, float a, float b)
{
  return min(max(t, a), b);
}

void bevel(float t)
{
  float b = min(size.x, size.y);
  
  bevel = mix(0, b/res, t);
}

void border(float t)
{
  float b = max(size.x, size.y);
  
  border = mix(0, b/8, t);
}

void intensity(float t)
{
  intensity = t;
}
