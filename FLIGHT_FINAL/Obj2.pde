//lightning bolts
class Obj2 {
  float x;
  color c;
  float y;
  float speed;
  float size;
  float radius;
  float b = 255;
  float g = 255;
  Obj2() {
    x = random(0, 1050);
    y = 0;
    speed = 2;
    size = random(15, 80);
    radius = size;
  }
  void display() {
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
      //MUSIC SPEED UP
      //bgmusic.rate(2);
    }
    color c = color(255, b, g);
    fill(c);
    stroke(#1D326F);
    image(thun, x, y, size, size);
  }
  void move() {
    y+= speed;
  }
}