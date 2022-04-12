void pause() {
  background(255);
  theme.pause();
  fill(0);
  text("PRESS MOUSE TO CONTINUE GAME", width/2, height/2);
  if(mousePressed){
    mousePressed = false;
    mode = GAME;
  }
}
