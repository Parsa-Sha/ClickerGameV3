// Clicker Game V3
// The first project I've made using modular programming and enums
// https://github.com/Parsa-Sha/ClickerGameV3
// 04/11/2022
// Special thanks to @chomp_munch on insta for desining the backgrounds, characters, & colour palettes

// Ideas for future versions: 
// Spawn new target when all are destroyed
// Spawn new target every 15 sec, 13 sec, 10 sec...
// False targets
// Orbiting targets

// Could also impliment structs to store all of the theme colours, backgrounds, characters, etc.


// This version has these changed from V2:
// Every three seconds, a slime spawns
// You must kill slimes in time before they cover the screen
// If too many slimes spawn, or you miss the slimes, you lose
// Goal is to kill as many slimes as possible
// Hidden ending where if there are no slimes, or correct code is entered, secret ending is found

// To do list
// Secret code, numbers in alphabetical order
// Defeat by invasion & defeat by lives lost
// Cursor & cooldown modifications


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer theme, coin, bump, gameover, introTheme;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int GAMEWON = 4;
final int OPTIONS = 5;
final int INVADED = 6;

float x, y, d;
float vx, vy;

int score, highscore, playerLives;

float difficultySlider = 5;

float sizeLimit = 20;
float clickCooldown = 0;
int targetsDestroyed = 0;
boolean gamestart;

ArrayList<Target> myTargets;
int targetCount = 0;

PImage livesCounter[] = new PImage[4];

PImage characters[] = new PImage[3];
PImage bgs[] = new PImage[3];
PImage icons[] = new PImage[3];
color colour1[] = new color[3];
color colour2[] = new color[3];
color colour3[] = new color[3];
int selectedTheme = 0;

final char secretcode[] = new char[10];
char currentcode[] = new char[10];

void setup() {
  size(800, 800, P2D);
  mode = INTRO;
  
  livesCounter[0] = loadImage("lives\\noLives.png"); // Loading the three lives representations
  livesCounter[1] = loadImage("lives\\oneLife.png");
  livesCounter[2] = loadImage("lives\\twoLives.png");
  livesCounter[3] = loadImage("lives\\threeLives.png");
  
  bgs[0] = loadImage("bg\\grassBg.png"); // Loading backgrounds (thank you chomp_munch)
  bgs[1] = loadImage("bg\\lavaBg.png");
  bgs[2] = loadImage("bg\\darkBg.png");
  
  characters[0] = loadImage("characters\\grassSlime.png"); // Loading characters (again, thank you chomp_munch  )
  characters[1] = loadImage("characters\\lavaSlime.png");
  characters[2] = loadImage("characters\\darkSlime.png");
  
  icons[0] = loadImage("icons\\grassIcon.png"); // Icons to display themes in options
  icons[1] = loadImage("icons\\lavaIcon.png");
  icons[2] = loadImage("icons\\darkIcon.png");
  
  secretcode[0] = '8';
  secretcode[1] = '5';
  secretcode[2] = '4';
  secretcode[3] = '9';
  secretcode[4] = '1';
  secretcode[5] = '7';
  secretcode[6] = '6';
  secretcode[7] = '3';
  secretcode[8] = '2';
  secretcode[9] = '0';
  
  colour1[0] = color(35, 170, 154);
  colour2[0] = color(14, 53, 50);
  colour3[0] = color(56, 184, 125);
  
  colour1[1] = color(238, 73, 40);
  colour2[1] = color(123, 16, 5);
  colour3[1] = color(255, 254, 13);
  
  colour1[2] = color(62, 47, 141);
  colour2[2] = color(10, 7, 45);
  colour3[2] = color(117, 113, 146);
  
  imageMode(CENTER);
    
  x = width/2;
  y = height/2;
  d = 200;
  vx = random(-5, 5);
  vy = random(-5, 5);

  score = 0;
  playerLives = 3;

  minim = new Minim(this);
  theme = minim.loadFile("audioFiles\\introTheme.mp3");
  coin = minim.loadFile("audioFiles\\coin.wav");
  bump = minim.loadFile("audioFiles\\bump.wav");
  gameover = minim.loadFile("audioFiles\\gameover.wav");  
  introTheme = minim.loadFile("audioFiles\\gameTheme.mp3");
  
  myTargets = new ArrayList<Target>();
}

void draw() {
  switch(mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEOVER:
    gameover();
    break;
  case GAMEWON:
    gamewon();
    break;
  case OPTIONS:
    options();
    break;
  case INVADED:
    invaded();
    break;
  default:
    println("ERROR. Mode = " + mode);
  }
}
