#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float u_res;
uniform float u_bevel;
uniform float u_border;
uniform float u_intensity;

uniform vec2 u_size;

uniform vec3 u_iColor;
uniform vec3 u_bColor;
uniform vec3 u_sColor;

varying vec2 fragCoord;

float sdfQuad(in vec2 p, in vec2 s, float b)
{
  p = abs(p) - (s-b);
  return (length(max(p, 0))-b) + min(max(p.x, p.y), 0);
}

void main()
{
  vec2 uv = fragCoord / u_res;

  vec3 col = vec3(0);

  vec2 size = u_size/u_res;

  float q = sdfQuad(uv, size, u_bevel);

  float s_bq = smoothstep(1/u_res*(u_border-1), 1/u_res*u_border, abs(q));
  float bq = smoothstep(2/u_res*(u_border-1), 2/u_res*u_border, abs(q));

  float s_q = step(0, q);
  q = smoothstep(0, 2/u_res, q);

  float sq = sdfQuad(uv-vec2(.0, 0), size, u_bevel);
  sq = smoothstep(2/u_res-u_intensity, 0.4+2/u_res*u_border-u_intensity, sq)+.5;

  vec3 c1 = mix(u_bColor, u_iColor, max(1-q, bq));
  vec3 c2 = mix(u_sColor, u_sColor, sq);

  float alpha = 1-q*bq*sq;

  col += c1*(1-min(q, bq)+c2);

  gl_FragColor = vec4(col, alpha);
}