class Bird extends Enemies
{
  int counter;
  PImage[] images;
  int imageCount;
  
  Bird(int x,int y, float SpeedE,int frames,float healthValue)
  {
    super(x, y, SpeedE,frames,healthValue);
    images = new PImage[frames];
    for (int i = 0; i < frames; i++){
      String filename = "Q" + nf(i,2) + ".png";
      images[i] = loadImage(filename);
    }//for loop to load the images  
   
  }//AirEnemy contructor
  @Override
  void render()
  {
     if ( counter<10)
    {image(images[0], x, y);}
    else if (counter <15)
    {image(images[1], x, y);} 
    else if ( counter < 20)
    {image(images[2], x, y);} 
    else if (counter <25)
    {image(images[3], x, y);}
    else if (counter <30)
    {image(images[4], x, y);}
    else if (counter <35)
    {image(images[5], x, y);}
    else if (counter <40)
    {image(images[6], x, y);}
    else if (counter <44)
    {image(images[7], x, y);}
    else 
    {image(images[7], x, y);
      counter=0;
    }// reset to go through
    counter ++;
  }//render procedure
}//class air enemy
