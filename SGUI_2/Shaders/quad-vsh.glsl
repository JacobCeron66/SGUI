attribute vec4 position;

uniform mat4 transform;

varying vec2 fragCoord;

void main()
{
  gl_Position = transform * position;
  fragCoord = vec2(position.x, -position.y);
}