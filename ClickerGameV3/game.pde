int streak = 0;

void game() {
  introTheme.pause();
  introTheme.rewind();
  theme.play();
  image(bgs[selectedTheme], width/2, height/2);

  int i = 0;
  while (i < myTargets.size()) {
    Target myObj = myTargets.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myTargets.remove(i);
    } else {
      i++;
    }
  }

  if (millis() % (abs(difficultySlider - 21) * 1000 / 2 + 20) > (abs(difficultySlider - 21) * 1000 / 2) || gamestart == true) {
    myTargets.add(new Target());
    targetCount++;
    gamestart = false;
  }


  if (mousePressed && clickCooldown == 10) { // If mouse is pressed and cooldown is over
    mousePressed = false;
    checkClick();
    clickCooldown = 0;
  }

  fill(colour1[selectedTheme]);
  textSize(40);
  textAlign(LEFT);
  text("Score: " + targetsDestroyed, 10, 40);
  textAlign(RIGHT);
  image(livesCounter[playerLives], width-130, 40);
  textAlign(CENTER);


  clickCooldown++;
  clickCooldown = min(10, clickCooldown);
  
  strokeWeight(3);
  stroke(0, 0, 255);
  noFill();
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(-HALF_PI);
  arc(0, 0, 30, 30, 0, clickCooldown*TWO_PI/10);
  popMatrix();
  
  highscore = max(highscore, targetsDestroyed);


  if (keyPressed) {
    if (key=='p'||key=='P') {
      mode = PAUSE;
    } else if (key=='s'||key=='S') {
      mode = GAMEWON;
    }
  }

  if (playerLives <= 0) mode = GAMEOVER;

  if (targetCount >= 100) mode = INVADED;

  if (targetCount == 0) mode = GAMEWON;
}

void checkClick() {
  Target clickedTarget = null;

  int i = myTargets.size() - 1;
  while (i > -1) { // Check if mouse is on a target
    Target myObj = myTargets.get(i);
    if (dist(mouseX, mouseY, myObj.pos.x, myObj.pos.y) < myObj.size/2) {
      clickedTarget = myObj; // Check distance to the uppermost target
      break;
    }
    i--;
  }

  if (clickedTarget == null) {  // If no target is under mouse, remove lives
    playerLives--;
    bump.rewind();
    bump.play();
  } else { // Else, run break method to split target
    clickedTarget.slice();
    targetsDestroyed++;
    coin.rewind();
    coin.play();
  }
}
