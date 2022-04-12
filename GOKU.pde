public int SpawnTimer = 0;
public int highscore;
final int SPLASH = 2;
final int PLAYING = 0;
final int FINISHED = 1;
int gameMode = SPLASH;
import processing.sound.*;
SoundFile collection,impact;

Player Goku;//make a new player
Splash sp;//splash screen
Background lvls;
explosion Bomb;
LifeBar Bar;
PFont font;

ArrayList<Collectables> collectables = new ArrayList();//contains all dragon ball and heart collectables
ArrayList<Enemies> enemies = new ArrayList();//contains both air and ground enemy arraylists

void setup()
{
  size(1000, 361);
  Goku = new Player(20,height-50, 4,4);
  collection = new SoundFile(this, "collection.mp3");
  impact = new SoundFile(this, "impact.mp3");
  Bomb = new explosion();
  Bar = new LifeBar(51,16);
  lvls = new Background();
  font = loadFont("spFont.vlw");
  textFont(font);
  sp = new Splash();
  Goku.position = new PVector(Goku.x, Goku.ground);
  Goku.velocity = new PVector(0, 0);
}
void draw()
{
 switch(gameMode){
 case 0:
 if(lvls.score >= 30)
 {lvls.update2();}
 else
   lvls.update();
    SpawnTimer ++; // adds 1 to the  coin  spawn counter
    CollectableSpawn();
    EnemySpawn();
    Bar.render();
    collision();
    Goku.update();
  break;
  case 1:
  sp.update2();
  if(lvls.score > highscore)
  {highscore = lvls.score;}
  break;
  case 2:
  reset();
  sp.update();
  lvls.score = 0;
  lvls.time = 60;
  break;
}
}//draw procedure

void collision()
{
  for( int i=0 ; i < collectables.size() ; i++)
  {
    Collectables currentballz = collectables.get(i);
    currentballz.update();
    if(Goku.crash(currentballz))
    {
     collection.play();
     collectables.remove(i);
     lvls.score += currentballz.scoreValue;//add score (x) upon collision
     Bar.Health += currentballz.healthInc;//add health (x) upon collision
    }
    else if(currentballz.x < -100)
    {collectables.remove(i);}
  }

for( int i=0 ; i < enemies.size() ; i++)
  {
    Enemies currentenemy = enemies.get(i);
    
    currentenemy.update();
    if(Goku.crash(currentenemy) || currentenemy.x < -100) 
      {enemies.remove(i);}
    if(Goku.crash(currentenemy))
      {Bar.Health -= currentenemy.healthValue; 
       Bomb.render(currentenemy.x+15,currentenemy.y-15);
       impact.play();}}
      
    if(Bar.Health == 0 || lvls.time == 0)
    {gameMode = FINISHED;}
}//collision detection

void keyReleased()
{
   
 if (key ==' ')
  {
    Goku.up = 0;
  }
  motion = false;   
}//keyreleased for the jump procedure

void keyPressed()
{
    if (key == ' ')
  {
    Goku.up = -1;
    gameMode = PLAYING;
  }
  else  if(keyCode == ENTER && lvls.time == 0 || Bar.Health == 0)
 {gameMode = SPLASH;}
}
void EnemySpawn()
{
  float speedf =2.5;
  float speedb = 2; 
  if(lvls.score >= 100)
  {speedf += 0.5;
  speedb += 1;}
 if (SpawnTimer % 300 == 0)
     {enemies.add(new freeza( width+(int) random(150), height-50, speedf,4,25));}
     if(SpawnTimer % 370 == 0)
     {enemies.add(new Bird( width+(int) random(150),(int) random(150,200), speedb,8,25));}
     if(lvls.score >60 && SpawnTimer % 180 == 0)
     {enemies.add(new Bird( width+(int) random(150),(int) random(150,220), speedb,8,25));}
   if(lvls.score > 30 && SpawnTimer % 900 == 0)
     {enemies.add(new Final( width+(int) random(150),(int) random(180,300), 3.5,4,50));}
}
void CollectableSpawn()
{
  if (SpawnTimer % 120 == 0)
   {
      float r = random(2);
      if(r <= 1.9)
      {collectables.add(new dragonBallz1( width+(int) random(150), (int) random(150,250),2,1,0,5));}
      if(r < 1.2)
      {collectables.add(new dragonBallz3( width+(int) random(150), (int) random(150,250),2.5,3,0,5));}
      if(r<0.4)
      {collectables.add(new dragonBallz7( width+(int) random(150), (int) random(130,190),3.5,7,0,6));}
       }//draw dragonBallz
       float spawn = random(3);
       if(SpawnTimer % 120 == 0 && spawn<0.2)
       { collectables.add(new Heart( width+(int) random(150), (int) random(150,250),3.5,0,25,1));}
}
void reset()
{
  Goku = new Player(20,height-50, 4,4);
  Bomb = new explosion();
  Bar = new LifeBar(51,16);
  lvls = new Background();
  font = loadFont("spFont.vlw");
  textFont(font);
  sp = new Splash();
  Goku.position = new PVector(Goku.x, Goku.ground);
  Goku.velocity = new PVector(0, 0);
  for(int i = 0; i< enemies.size(); i++)
  {enemies.remove(i);}
  for(int i = 0; i<collectables.size(); i++)
  {collectables.remove(i);}
}//reset procedure
