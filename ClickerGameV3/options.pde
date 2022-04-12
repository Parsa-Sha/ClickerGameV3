int sliderHover, backHover;
int selection[] = new int[3];
int hover[] = new int[3];

void options() {
  image(bgs[selectedTheme], width/2, height/2);
  fill(156, 162, 30);
  stroke(211, 83, 12);
  sliderHover = 1;
  backHover = 1;
  
  for(int i = 0; i < 3; i++){
    selection[i] = 0;
    hover[i] = 0;
  }
  
  selection[selectedTheme] = 255;

  if (mouseX > 200 && mouseX < 600 && mouseY > 675 && mouseY < 725) {
    if (mousePressed) {
      difficultySlider = map(mouseX, 200, 600, 1, 20);
    }
    sliderHover = 4;
  }

  if (mouseX > width - 150 && mouseX < width - 50 && mouseY > height - 150 && mouseY < height - 50) {
    if (mousePressed) {
      mode = INTRO;
    }
    backHover = 4;
  }

  if (mouseX > width/4 - 64 - 128 && mouseX < width/4 + 64 && mouseY > 128 && mouseY < 374) {
    if (mousePressed) {
      // width/4 - 64, 256
      selectedTheme = 0;
    }
    hover[0] = 120;
  }

  if (mouseX > width/2-128 && mouseX < width/2+128 && mouseY > 128 && mouseY < 374) {
    if (mousePressed) {
      selectedTheme = 1;
    }
    hover[1] = 120;
  }
  
  if (mouseX > width/4*3 - 64 && mouseX < width/4*3 + 64 + 128 && mouseY > 128 && mouseY < 374) {
    if (mousePressed) {
      selectedTheme = 2;
    }
    hover[2] = 120;
  }

  image(icons[0], width/4 - 64, 256);
  image(icons[1], width/4*2, 256);
  image(icons[2], width/4*3 + 64, 256);

  noStroke();
  fill(120, hover[0]);
  rect(width/4 - 64, 256, 256, 256);
  fill(120, hover[1]);
  rect(width/4*2, 256, 256, 256);
  fill(120, hover[2]);
  rect(width/4*3 + 64, 256, 256, 256);

  noFill();
  strokeWeight(2);
  stroke(120, selection[0]);
  rect(width/4 - 64, 256, 256, 256);
  stroke(120, selection[1]);
  rect(width/4*2, 256, 256, 256);
  stroke(120, selection[2]);
  rect(width/4*3 + 64, 256, 256, 256);

  fill(colour2[selectedTheme]);
  stroke(colour3[selectedTheme]);
  strokeWeight(6);
  line(200, 700, 600, 700);
  strokeWeight(sliderHover);
  rectMode(CENTER);
  rect(map(difficultySlider, 1, 20, 200, 600), 700, 25, 25, 5);
  strokeWeight(backHover);
  rect(width-100, height-100, 100, 100, 20);
  textSize(40);
  fill(colour1[selectedTheme]);
  text("DIFFICULTY", width/2, 650);

  
}
