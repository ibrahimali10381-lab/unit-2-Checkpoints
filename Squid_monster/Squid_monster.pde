color blue = #0502D8;
int x;
int y;
int z;
int t;
int w;
float b;
int time;

void setup() {
  size(800, 800, P2D);
  background(blue);
  x = 0;
}

void draw() {
  background(blue);
  if (x <= 50) {
    x += 1;
  } else {
    ink(z, w,b);
    z += 5;
    w += 5;
    t += 1;
    y += 1;
    if (t==1) {
    float angle = atan2(mouseY - y, mouseX - x);
    b = angle;
  }
    if (y >= 100) {
      x=0;
      t=0;
      z=0;
      w=0;
      y=0;
    }
  }
  jellyfish(400, 400);
}

void jellyfish(int x, int y) {
  pushMatrix();
  translate(x, y);
  float ang = atan2(mouseY - y, mouseX - x);
  rotate(ang + HALF_PI);

  fill(255);
  noStroke();
  arc(0, 50, 300, 100, PI, TWO_PI);

  strokeWeight(10);
  stroke(0);
  arc(0, 50, 300, 200, 0, PI);

  line(-100, -200, -100, 10);
  line(100, -200, 100, 10);

  ellipse(100, 50, 10, 10);
  ellipse(-100, 50, 10, 10);

  popMatrix();
}

void ink(int z, int w, float b) {
  pushMatrix();
  translate(400, 400);
  rotate(b + HALF_PI +90);

  noStroke();
  fill(0);
  ellipse(z, w, 100, 100);
  ellipse(z-12, w, 100, 100);
  ellipse(z, w+34, 100, 100);
  ellipse(z+41, w+61, 100, 100);
  ellipse(z+76, w-22, 100, 100);
  ellipse(z-13, w+123, 100, 100);

  popMatrix();
}
