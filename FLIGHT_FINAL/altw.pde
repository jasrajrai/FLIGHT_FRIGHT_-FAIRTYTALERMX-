void runGame2() {
  //scrolling background
  //int pixelColor = plane.get(5, 5); 
  int x1 = frameCount % bg.width;
  for (int i = -x1; i < width; i += bg.width) {
    copy(bg2, 0, 0, bg2.width, height, i, 0, bg2.width, height);
  } 

  //background objects
  for (Bobj ob : Bobj) {
    ob.display();
    ob.move();
  }

  //add background objects
  if (frameCount % 80 == 0) {
    Bobj oob = new Bobj();
    Bobj.add(oob);
  }



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
  for (Obj2 o2 : obj2) {
    o2.display();
    o2.move();

    if (collision(o2, c) == true) {
      gameState = GAME_OVER;
      o2.speed = 0;
      //death.play();
    }
  }
  //failed color collision
  //if (pixelColor < -1) {
  //  filter(INVERT); 
  //  stroke(255);
  //} else {
  //  stroke(0);
  //}
  //Increase amount of enemies over time
  if (millis() - initialTime > interval && interval > 149) {
    Obj2 oo = new Obj2();
    obj2.add(oo);

    initialTime = millis();

    interval -= 25;
  } else if (interval < 149) {
    Obj oo = new Obj();
    obj.add(oo);

    interval = 500;
  }

  //Remove objects once off the screen
  if (o2.x > width) {
    obj2.remove(o);
  }

  if (ob.x > width) {
    Bobj.remove(ob);
  }
  //display the cube
  c.display();
}