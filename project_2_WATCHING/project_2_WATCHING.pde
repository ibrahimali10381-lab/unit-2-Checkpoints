float movex;
int x = -20;
int t = 0;

void setup() {
  size(900, 900);
}




void draw() {
  wall();
  road();
  camera(50, 300, x);
  camera(250, 300, x);
  camera(450, 300, x);
  camera(650, 300, x);
  camera(850, 300, x);


  if (t==1) {
    if (x>=-20 && x<=20) {
      movex += 1;
      x += movex;
      t =0;
    } else {
      movex -= 1;
      x += movex;
      t =0;
    }
  } else {
    t = 1;
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

void camera(int Camx, int Camy, int x) {
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
