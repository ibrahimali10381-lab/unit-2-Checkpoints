color blue = #0502D8;
int x;

void setup(){
 size(800,800, P2D); 
 background(blue);
 x = 0;
}

void draw(){
  background(blue);
  jellyfish(400,400);
  if (x <= 300){
    x += 1;
  }
   else{
     ink(0,0);
   }
}

void jellyfish(int x,int y) {
  pushMatrix();
  fill(255);
  translate(x,y);
  rotate(radians(-mouseY));
  noStroke();
  arc(-0,50,300,100, PI, TWO_PI);
  strokeWeight(10);
  stroke(0);
   arc(-0,50,300,200,0,PI);
  line(-100,-200,-100,10);
  line(100,-200,100,10);
  ellipse(100,50,10,10);
  ellipse(-100,50,10,10);
  popMatrix();

}

void ink(int z, int w){
   pushMatrix();
   translate(400,400);
   rotate(radians(-mouseY));
   noStroke();
   fill(0);
   popMatrix();
   
}
