//background clouds
class Bobj {
  float x;
  color c;
  float y;
  float speed;
  float size;
  float radius;

  Bobj() {
    x = -180;
    y = random(0, 200);
    speed = 1;
    size = random(5, 30);
    radius = size;
  }

  void display() {

    pushMatrix();
    //stroke(128,128,128,20);
    image(cld, x, y, 175, 170);
    popMatrix();
  }

  void move() {
    x += speed;
  }
}