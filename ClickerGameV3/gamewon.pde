void gamewon() {
  theme.pause();
  image(bgs[selectedTheme], width/2, height/2);
  textAlign(CENTER, CENTER);
  text("SECRET VICTORY!", width/2, height/2);
  
  if(mousePressed){
    mousePressed = false;
    mode = INTRO;
  }
}
