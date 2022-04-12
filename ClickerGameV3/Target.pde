class Target {

  int size;
  PVector pos;
  PVector vel;
  int lives;
  float clickCooldown;

  Target() {
    size = 256;
    pos = new PVector(width/2, height/2);
    vel = new PVector(random(-3.5, 3.5), random(-3.5, 3.5));
    lives = 1;
    clickCooldown = 0;
  }

  Target(int s, float x, float y) {
    size = s;
    pos = new PVector(x, y);
    vel = new PVector(random(-3.5, 3.5), random(-3.5, 3.5));
    lives = 1;
    clickCooldown = 0;
  }

  void show() {
    strokeWeight(3);
    stroke(200);
    fill(0);
    //ellipse(pos.x, pos.y, size, size);
    image(characters[selectedTheme], pos.x, pos.y, size, size);
  }

  void act() {
    pos.add(vel);

    if (size < sizeLimit) {
      lives = 0;
      targetCount--;
    }

    if (pos.x < size/2 || pos.x > width-size/2) {
      vel.x *= -1;
      vel.y += random(-0.3, 0.3);
    }

    if (pos.y < size/2 || pos.y > height-size/2) {
      vel.y *= -1;
      vel.x += random(-0.3, 0.3);
    }
  }

  void slice() {
    lives = 0;
    targetCount++;
    myTargets.add(new Target(size/2, pos.x, pos.y));
    myTargets.add(new Target(size/2, pos.x, pos.y));
  }
}
