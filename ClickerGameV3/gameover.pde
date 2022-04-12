void gameover() {
  theme.pause();
  gameover.play();
  introTheme.rewind();
  background(100, 0, 0);
  image(livesCounter[0], width/2, height/2);
  if(mousePressed){
    mousePressed = false;
    mode = INTRO;
  }
  
  fill(colour1[selectedTheme]);
  textSize(100);
  text("DEFEAT", width/2, height/2 - 100);
  textSize(30);
  textLeading(30);
  text("Score: " + targetsDestroyed + "\n" + "Highscore: " + highscore + "\nClick to play again", width/2, height/2 +100);
}
