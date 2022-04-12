class Final extends Enemies
{
  int counter;
  PImage[] images;
  int imageCount;
  
  Final(int x,int y, float SpeedE,int frames,float healthValue)
  {
    super(x, y, SpeedE,frames,healthValue);
   images = new PImage[frames];  
    for (int i = 0; i < frames; i++){
      String filename = "A" + nf(i,2) + ".png";
      images[i] = loadImage(filename);
    }//for loop to load the images    
  }//constructor
  @Override
  void render()
  {
     if ( counter<10)
    {image(images[0], x, y);}
    else if (counter <20)
    {image(images[1], x, y);} 
    else if ( counter < 30)
    {image(images[2], x, y);} 
    else if (counter <39)
    {image(images[3], x, y);}
    else 
    {image(images[3], x, y);
      counter=0;
    }// reset to go through
    counter ++;
  }//render procedure
  
}//enemy class
