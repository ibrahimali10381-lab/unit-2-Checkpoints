
int x;

void setup(){
 size(600,600); 
 x = 600;
}

void draw(){
  background(255);
  ellipse(x,300,200,200);
  x -= 1;
}
