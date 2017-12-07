//fright flight
//by Jasraj Rai
// teleporting through time
// the bermuda bamboozle
// through the triangle of terror

import processing.sound.*;
PImage bg;
PImage bg2;
PImage plane;
PImage grem;
PImage thun;
PImage cld;


PFont font;
PFont fontTitle;

SoundFile bgmusic;
SoundFile bloop;
SoundFile death;

int score;
int INTRO = 0;
int RUN_GAME = 1;
int RUN_GAME2 = 3;
int GAME_OVER = 2;
int gameState = INTRO;
int stage = gameState;

int x1;

int initialTime;
int interval = 2000;

Plane c;

ArrayList<Obj> obj = new ArrayList();
Obj o;

ArrayList<Bobj> Bobj = new ArrayList();
Bobj ob;

ArrayList<Obj2> obj2 = new ArrayList();
Obj2 o2;


/////////////////////////////////////////////////////
void setup() {
  size(1080, 720);

  c = new Plane(width/2, height/2, 50);

  o = new Obj();

  o2 = new Obj2();

  ob = new Bobj();


  initialTime = millis();

  bg = loadImage("gameback1.png");
  bg2 = loadImage("720gameback.png");
  plane = loadImage("plane.png");
  grem = loadImage("grml.png");
  thun = loadImage("thunder.png");
  cld = loadImage("clouds.png");

  font = loadFont("Hemogoblin-68.vlw");
  fontTitle = loadFont("Hemogoblin3DItalic-88.vlw");

  //for some reason these files will not work
  //bgmusic = new SoundFile(this, "bgmusic.mp3");
  //death = new SoundFile(this, "death.mp3");
  //bloop = new SoundFile(this, "bloop.mp3");

  //bgmusic.loop();
}

////////////////////////////////////////////////////
void draw() {
  if (gameState == INTRO) intro();
  else if (gameState == RUN_GAME) runGame();
  else if (gameState == RUN_GAME2) runGame2();
  else if (gameState == GAME_OVER) gameOver();
}

////////////////////////////////////////////////////
void intro() {
  //scrolling background
  int x1 = frameCount % bg.width;
  for (int i = -x1; i < width; i += bg.width) {
    copy(bg, 0, 0, bg.width, height, i, 0, bg.width, height);
  } 



  //add background objects
  if (frameCount % 80 == 0) {
    Bobj oob = new Bobj();
    Bobj.add(oob);
  }

  //title 
  //pushMatrix();
  //fill(255);
  //translate(width/2, height/2);
  ////rotate(PI/4);
  //rectMode(CENTER);
  //triangle(-50, 35, 0, 30, 0, 65);
  //popMatrix();


  pushMatrix();
  fill(255);
  textFont(fontTitle, 150);
  textAlign(CENTER);
  text("FRIGHT FLIGHT", width/2, height/3);
  popMatrix();

  //textFont(fontTitle, 38);
  //text("IN THE:", width/2, height/2 - 50);

  textFont(fontTitle, 38);
  text(":THROUGH THE TRIANGLE OF TERROR", width/2, height/2);

  //textFont(font, 50);
  //text("2", width/2+230, height/2-70);

  textFont(font, 28);
  text("CLICK ANYWHERE TO BEGIN", width/2, height/2+height/7);

  textFont(font, 18);
  text("USE ARROW KEYS TO MOVE", width/2, height/2+height/4.8);

  textFont(font, 18);
  text("PRESS ' 1 ' OR ' 2 ' TO SWITCH BETWEEN WORLDS", width/2, height/2+height/4);

  textFont(font, 18);
  text("TRY TO MAKE IT AS FAR AS YOU CAN!", width/2, height/2+height/3.4);
}


///////////////////////////////////////////////////
void runGame() {
  //scrolling background
  int x1 = frameCount % bg.width;
  for (int i = -x1; i < width; i += bg.width) {
    copy(bg, 0, 0, bg.width, height, i, 0, bg.width, height);
  } 


  //display the cube
  c.display();

  //score
  score++;
  fill(255); 
  textFont(font, 30);
  textAlign(LEFT);
  text(score, 10, 30);

  //Move the cube
  //PRESSED = UP
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP && c.y >20) {
        c.shiftUp();
      }
    }
  }

  //down
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == DOWN && c.y < 720) {
        c.shiftDown();
      }
    }
  }
  //LEFT
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == LEFT && c.x > 20) {
        c.shiftLeft();
      }
    }
  }
  //RIGHT
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == RIGHT && c.x < 1080) {
        c.shiftRight();
      }
    }
  }


  //display the enemies
  for (Obj o : obj) {
    o.display();
    o.move();

    if (collision(o, c) == true) {
      gameState = GAME_OVER;
      o.speed = 0;
      //DEATH NOISE
      //death.play();
    }
  }

  //Increase amount of enemies over time
  if (millis() - initialTime > interval && interval > 149) {
    Obj oo = new Obj();
    obj.add(oo);

    initialTime = millis();

    interval -= 25;
  } else if (interval < 149) {
    Obj oo = new Obj();
    obj.add(oo);

    interval = 500;
  }

  //Remove objects once off the screen
  if (o.x > width) {
    obj.remove(o);
  }

  if (ob.x > width) {
    Bobj.remove(ob);
  }
}
void keyPressed() {
  if (key == '1') {
    gameState = RUN_GAME;
    //TELEPORT NOISE
    //bloop.play();
  } else if (key == '2') {
    gameState = RUN_GAME2;
  }
}
//void runGame2(){
//      background(0, 255, 0); //green
//}
///////////////////////////////////////////////////
//Collision
boolean collision(Obj o, Plane c) {
  float d = dist(c.x, c.y, o.x, o.y);

  if (d< o.radius + c.radius) {
    return true;
  } else {
    return false;
  }
}
boolean collision(Obj2 o2, Plane c) {
  float d = dist(c.x, c.y, o2.x, o2.y);

  if (d< o2.radius + c.radius) {
    return true;
  } else {
    return false;
  }
}
////////////////////////////////////////////
void gameOver() {
  fill(255);
  textFont(font, 80);
  textAlign(CENTER);
  text("GAME OVER!", width/2, height/4); 

  textFont(font, 20);
  text("CLICK TO RETRY", width/2, height/4+50); 

  o.speed = 0;
}

///////////////////////////////////////////////////
void mousePressed() {
  if (gameState == INTRO || gameState == GAME_OVER) {
    gameState = RUN_GAME;
    score = 0;
    obj.clear();
    Bobj.clear();
    obj2.clear();
    interval = 2000;
  }
}