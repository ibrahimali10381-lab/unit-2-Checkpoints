import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
AudioPlayer drive;
AudioPlayer drive1;
AudioPlayer drive2;
AudioPlayer dragon;
AudioPlayer click;


float movex;
float x = -20;
float randmove = 1.0;
int t = 0;
int time = 0;

int carmovement = 800;
int car2 = 0;
boolean started = false;
int randcar = 1;
int p = 0;

int y = 0;
int cameras;


float r1 = random(0, 255);
float g1 = random(0, 255);
float b1 = random(0, 255);

int z = 0;
boolean s = false;
boolean eye_open = false;
PFont font;

PFont SansSerif;




void setup() {
  size(900, 900);
  font = createFont("adrip1.ttf", 60);
  SansSerif = createFont("SansSerif", 60);
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  drive = minim.loadFile("drive1.mp3");
  drive1 = minim.loadFile("drive2.mp3");
  drive2 = minim.loadFile("drive3.mp3");
  dragon = minim.loadFile("dragon.mp3");
  click = minim.loadFile("clcik.mp3");
}




void draw() {
  dragon.play();
  wall();
  road();

  if (started == false) {
    randcar = int(random(6));
  } else if (randcar == 0) {

    randcar = 0;
  } else {
    randcar = 1;
  }

  car(800, carmovement, r1, g1, b1, randcar);



  movex = random(2);


  x = camMove(x, randmove, movex, randcar, eye_open);
  camera(50, 300, x, y);

  x = camMove(x, randmove, movex, randcar, eye_open);
  camera(250, 300, x, y);


  x = camMove(x, randmove, movex, randcar, eye_open);
  camera(450, 300, x, y);


  x = camMove(x, randmove, movex, randcar, eye_open);
  camera(650, 300, x, y);

  x = camMove(x, randmove, movex, randcar, eye_open);
  camera(850, 300, x, y);


  carmovement -= 15;

  started = true;

  if (carmovement <-300) {
    carmovement = 950;
    started = false;

    if (int(random(1, 6)) == 1) {
      drive.play();
      drive.rewind();
    } else if (int(random(1, 6)) == 2) {
      drive1.play();
      drive1.rewind();
    } else if (int(random(1, 6)) == 3) {
      drive2.play();
      drive2.rewind();
    } else if (int(random(1, 6)) == 4) {
      drive.play();
      drive.rewind();
    } else if (int(random(1, 6)) == 5) {
      drive1.play();
      drive1.rewind();
    } else if (int(random(1, 6)) == 6) {
      drive2.play();
      drive2.rewind();
    }
  }

  wantedcar(100, 350);
  eyes(400, 100, z);


  if (z >= 50) {
    s = false;
    time = time +1;
    eye_open = true;

    if (time>2000) {
      z =0;
      time  = 0;
      eye_open = false;
      song.pause();
    }
  } else if (time > 1500) {
    s = true;
    eye_open = true;
  } else {
    s = false;
    z = 0;
    time +=1;
    eye_open = false;
  }

  if (s == true) {
    z+=1;
    eye_open = true;
    drive.pause();
    drive1.pause();
    drive2.pause();

    song.play();
  }


  graffiti(290, 200, eye_open);

  if (randcar == 0) {
    click.play();
    click.rewind();
    click.play();
    click.rewind();
    click.play();
    click.rewind();
    click.play();
    click.rewind();
    click.play();
    click.rewind();
    click.play();
    click.rewind();
    cameras = 1;
  } else if (cameras > 0) {
    click.play();
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







void camera(int Camx, int Camy, float x, int y) {
  pushMatrix();
  translate(Camx, Camy);

  float t = random(10000);

  if (t<100) {
    randmove = random(-1, 1);
    t = 0;
  } else {
    t = t +1;
  }


  fill(90);
  rect(x, y-20, 40, 40);
  quad(x, y-20, 15, -40, 45, -40, x+40, y-20);
  quad(x+40, y-20, x+40, y+20, 45, 0, 45, -40);
  quad(x, y-20, x, y+20, 15, 0, 15, -40);

  fill(0);
  ellipse(x+20, y, 20, 20);

  if (randcar ==0 && time%2 ==0) {
    fill(255, 0, 0);
    ellipse(x+25, -5, 7, 7);
  }
  popMatrix();
}







float camMove(float x, float rand, float speed, int randomcar, boolean eye) {

  float save = x;
  speed = random(2);


  if (eye == true) {
    y = -20;
    x =0;
    return 0;
  } else if (randomcar == 0) {

    if (rand < 0) {
      x = x+ speed/2;
    } else {
      x = x- speed/2;
    }
    if (x <-20) {
      x = -19;
    }
    y = 0;
    x = 30 - p;
    if (time % 5 ==0) {
      p = p+1;
    } else if (p>80) {
      p = 0;
    }
    return x;
  } else if (p >50 || randomcar !=0) {

    if (rand < 0) {
      x = x+ speed/2;
    } else {
      x = x- speed/2;
    }
    if (x <-20) {
      x = -19;
    }
    y = 0;
    p =0;
    if (x > 30) {
      x = save;
      if (second()%5 == 0) {
        rand = 1;
        return x;
      }
      return x;
    } else if (x < -20) {

      x = save;
      if (second()%5 == 0) {
        rand = -1;
        return x;
      }
      return x;
    }
  }
  return x;
}






void car(int y, int carmove, float r, float g, float b, int rands) {
  pushMatrix();
  translate(carmove, y);



  if (rands == 0) {
    fill(r, g, b);
    ellipse(200, 0, 200, 150);
    rect(0, 0, 300, 100);

    fill(116, 173, 209);
    ellipse(200, 0, 150, 100);

    fill(r, g, b);
    rect(0, 0, 300, 100);

    fill(0);
    ellipse(30, 100, 75, 75);
    ellipse(270, 100, 75, 75);
  } else {


    fill(80, 78, 75);
    ellipse(200, 0, 200, 150);
    rect(0, 0, 300, 100);

    fill(116, 173, 209);
    ellipse(200, 0, 150, 100);

    fill(80, 78, 75);
    rect(0, 0, 300, 100);

    fill(0);
    ellipse(30, 100, 75, 75);
    ellipse(270, 100, 75, 75);
  }


  popMatrix();
}



void wantedcar (int x, int y) {
  pushMatrix();
  translate(x, y);

  fill(250, 203, 126);
  rect(0, 0, 100, 150);

  fill(0);
  textFont(SansSerif);
  textSize(20);
  text("WANTED", 10, 20);

  scale(0.28, 0.28);
  car(300, 20, r1, g1, b1, 0);

  popMatrix();
}

void graffiti(int x, int y, boolean s) {
  translate(x, y);
  textFont(font);
  if (s == true) {
    fill(255, 0, 0);
  }

  text("THEY ARE WATCHING", 0, 0);
}


void eyes (int x, int y, int z) {
  pushMatrix();
  translate(x, y);
  fill(255, 0, 0);
  ellipse(0, 0, 100, z+2);

  ellipse(100, 0, 100, z+2);

  fill(0);

  ellipse(0, 0, 50, 50);

  ellipse(100, 0, 50, 50);

  popMatrix();
}
