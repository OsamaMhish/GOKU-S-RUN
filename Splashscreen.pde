
class Splash
{
  PImage img1;
  Splash()
  {
    img1 = loadImage("splash2.png");
  }//contructor
  void update()
  {
    render();
    Start();
  }//starting splash screen
  void update2()
  {
    render();
    End();
  }//ending splash screen
  void render()
  {
   imageMode(CENTER);
    image(img1,width/2,height/2);
  
  }//render procedure
  
  void Start()
  {
    textSize(50);
    text("press 'Space' to begin", 220,100);
    textSize(38);
    text("Move the player using 'LEFT' 'RIGHT' 'SPACE' keys.",30,220);
    textSize(20);
    text("Collect 1,3 and 7 star dragon ballz!!",30,height-20);
    text("NOTE: you can move the player left and right mid-air" ,480,height-20);
  }//text procedure
  
  void End()
  {
  textSize(50);
  fill(255,255,255);
  text("Your score: " + lvls.score, width-650,120);
  textSize(30);
  text("HighScore: " + highscore,width-200,30);
  textSize(50);
  text("Press 'ENTER' to return to SplashScreen", 50,200);
  textSize(15);
  text("Game done by : OSAMA MHISH",width-250, height-20);
  }
  
}//splash screen class
