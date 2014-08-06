int prevX, prevY = 0;

void setup() {
    size(900, 400);
    background(250, 235, 215);
    stroke(1);
    strokeWeight(1);
    smooth();
}

void draw() {
    if (mousePressed && mouseX > 0) {
        line(mouseX, mouseY, prevX, prevY);
    }
    prevX = mouseX;
    prevY = mouseY;
}