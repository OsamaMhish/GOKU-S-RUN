class Heart extends Collectables
{
  PImage Heart;
  Heart(int x,int y,float speed,int scoreValue,int healthInc,int frames)
  {super(x,y,speed, scoreValue, healthInc,frames);
   Heart = loadImage("health.png");
   Heart.resize(40,40);
  }
  
  void render()
  {image(Heart,x,y);} 
}//collectable heart class
