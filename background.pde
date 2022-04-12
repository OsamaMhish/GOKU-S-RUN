class Background
{
  int score;
  int time = 60;
  PImage lvl1,lvl2;//loading image form the library
  public Background()
  {
    lvl1 = loadImage("lvl1.png");
    lvl2 = loadImage("lvl2.jpg");
  }
 void update()
 {
   lvl1();
   score();
   timer();
 }
 void update2()
 {
   lvl2();
   score();
   timer();
 }//update procedure
  void lvl1()
  {
    imageMode(CENTER);
    image(lvl1, width/2, height/2);
  }//render procedure
  void lvl2()
  {
    imageMode(CENTER);
    image(lvl2, width/2, height/2);
    fill(0);
    textSize(20);
    text("HARD",width/2,23);
  }
  void score()
{
    fill(0);
    textSize(25);
    text("Score=" + score, width-115,19);
}//score procedure
void timer()
{
  if (SpawnTimer % 60 == 0)
{ time -=1;}
 text("TimeRemaining: " + time,110,25);
}
}//class background
