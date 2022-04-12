class Enemies
{
  float healthValue;
  int x,y;
  float SpeedE;
  int numFrames;
  
  Enemies(int x,int y,float SpeedE,int frames, float healthValue)
  {
    this.healthValue = healthValue;
    this.x = x;
    this.y = y;
    this.SpeedE = SpeedE;
    numFrames = frames;
  }// superclass constructor 
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
    this.x -= SpeedE;
  }//move procedure parent class
  
}// enemies super class 
