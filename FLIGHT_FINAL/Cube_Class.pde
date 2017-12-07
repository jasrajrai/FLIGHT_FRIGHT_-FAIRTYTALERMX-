//plane class and controls
class Plane {

  float size;
  float x;
  float y;
  float radius;

  Plane(float xx, float yy, float sizee) {
    x = xx;
    y = yy;
    size = sizee;
    radius = 20;
  }

  void display() {
    image(plane, x-100, y-100);
    //testcube/collision
    rectMode(CENTER);
    noFill();
    noStroke();
    rect(x, y, 50, 50);
  }

  void shiftUp() {
    y -= 4;
  }

  void shiftDown() {
    y += 4;
  }
  void shiftLeft() {
    x -= 4;
  }
  void shiftRight() {
    x += 4;
  }
}