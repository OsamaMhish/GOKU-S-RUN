public class LifeBar
{
  int x,y;
  float Health = 100;
  PImage[] images;
  int imageCount;
  int numFrames = 5;  
  LifeBar(int x, int y)
  {
    this.x = x;
    this.y = y;
    images = new PImage[numFrames];  
    for (int i = 0; i < numFrames; i++){
    String filename = "HL" + nf(i,2) + ".png";
    images[i] = loadImage(filename);
    }//for loop to load the images    
    
    }//lifebar constructor
    
    void render()
    {
      if(Health == 100)
      {image(images[4],x,y);}
      else if(Health == 87.5)
      {image(images[4], x,y);}
      else if(Health == 75)
      {image(images[3],x,y);}
      else if(Health == 62.5)
      {image(images[3], x,y);}
      else if(Health == 50)
      {image(images[2],x,y);}
      else if(Health == 37.5)
      {image(images[2], x,y);}
      else if(Health == 25)
      {image(images[1],x,y);}
      else if(Health == 12.5)
      {image(images[1], x,y);}
      else if(Health == 0)
      {image(images[0],x,y);}
      
      if(Health > 100)
      {Health = 100;}//if health bar is max or 0 no more colletables affect it
    }//render procedure
}//lifebar class
