class Collectables
{
   int healthInc; 
   int  scoreValue;
   int x , y;
   float Speed;
   int numFrames;
   
   Collectables(int x, int y, float Speed,int scoreValue,int healthInc,int frames)
   {
    numFrames = frames;
    this.healthInc = healthInc;
    this.scoreValue = scoreValue; 
    this.x = x;
    this.y = y;
    this.Speed = Speed;
   }//Superclass constructor
  void update()
  {
    move();
    render();
  }//update procedure parent class
  
  void render()
  {
  }//render procedure parent class
    void move()
  {
    this.x -= Speed;
  }//move procedure parent class
  
}//collectables super class
