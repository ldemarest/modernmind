int prevX, prevY = 0;

void setup(){
  size(1000,400);
  background(255);
  stroke(1);
  strokeWeight(1);
  rect(1,1,998, 398);
  line(100,1,100,398)
  smooth();
}

void draw(){
  if ( mousePressed && mouseX > 0 ) {
    line(mouseX,mouseY,prevX,prevY);
  }
  prevX = mouseX;
  prevY = mouseY;
}