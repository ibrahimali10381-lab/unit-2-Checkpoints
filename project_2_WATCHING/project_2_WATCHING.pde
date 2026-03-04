float movex;
float x = -20;
float randmove = 1.0;
int t = 0;

void setup() {
  size(900, 900);
}




void draw() {
  wall();
  road();

  movex = random(2);


  x = camMove(x, randmove, movex);
  camera(50, 300, x);
  if (t>10) {
    randmove = random(-1, 1);
    t = 0;
  } else {
    t = t +1;
  }


  movex = random(2);

  x = camMove(x, randmove, movex);
  camera(250, 300, x);
  if (t>10) {
    randmove = random(-1, 1);
    t = 0;
  } else {
    t = t +1;
  }

  movex = random(2);

  x = camMove(x, randmove, movex);
  camera(450, 300, x);
  if (t>20) {
    randmove = random(-1, 1);
    t = 0;
  } else {
    t = t +1;
  }

  movex = random(2);

  x = camMove(x, randmove, movex);
  camera(650, 300, x);
  if (t>30) {
    randmove = random(-1, 1);
    t = 0;
  } else {
    t = t +1;
  }

  movex = random(2);

  x = camMove(x, randmove, movex);
  camera(850, 300, x);

  if (t>40) {
    randmove = random(-1, 1);
    t = 0;
  } else {
    t = t +1;
  }
}


void road() {
  pushMatrix();
  translate(0, 700);
  fill(59, 57, 57);
  rect(0, 0, 900, 200);

  fill(255);
  rect(-10, 85, 100, 30);
  rect(290, 85, 100, 30);
  rect(590, 85, 100, 30);
  rect(890, 85, 100, 30);
  popMatrix();
}

void wall() {
  pushMatrix();
  background(0);

  fill(134, 135, 135);
  rect(0, 150, 900, 550);

  fill(183, 181, 181);
  rect(0, 550, 900, 200);
  popMatrix();
}

void camera(int Camx, int Camy, float x) {
  pushMatrix();
  translate(Camx, Camy);


  fill(90);
  rect(x, -20, 40, 40);
  quad(x, -20, 15, -40, 45, -40, x+40, -20);
  quad(x+40, -20, x+40, 20, 45, 0, 45, -40);
  quad(x, -20, x, 20, 15, 0, 15, -40);

  fill(0);
  ellipse(x+20, 0, 20, 20);
  popMatrix();
}

float camMove(float x, float rand, float speed) {
  if (x > 20) {
    rand = 1;
  } else if (x < -20) {
    rand = -1;
  }

  if (rand < 0) {
    x = x+speed;
    return x;
  } else {
    x = x-speed;
    return x;
  }
}
