//gremlins
class Obj {
  float x;
  color c;
  float y;
  float speed;
  float size;
  float radius;
  float b = 255;
  float g = 255;
  Obj() {
    x = 0;
    y = random(10, 700);
    speed = 2;
    size = random(15, 90);
    radius = size;
  }
  void display() {
    if (score >= 500) {

      speed = 4;
    }
    if (score >= 900) {

      speed = 3;
    }
    if (score >= 1200) {
      speed = 4;
    }
    if (score >= 1600) {
      speed = 6;
    }
    if (score >= 1900) {
      speed = 7;
    }
    if (score >= 2000) {
      speed = 8;
    }
    if (score >= 2500) {
      speed = 9;
    }

    color c = color(255, b, g);
    fill(c);
    stroke(#1D326F);
    image(grem, x, y, size, size);
    //rect(x,y,size,size);
  }
  void move() {
    x+= speed;
  }
}