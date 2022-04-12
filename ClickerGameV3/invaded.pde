void invaded() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("THE SLIMESS HAVE OVERTAKEN YOU!\nScore: " + targetsDestroyed + "\nHighscore: " + highscore, width/2, height/2);

  if (mousePressed) {
    mousePressed = false;
    mode = INTRO;
  }
}
