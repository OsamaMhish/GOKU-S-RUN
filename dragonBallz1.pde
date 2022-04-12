class dragonBallz1 extends Collectables
{
  int counter;
  PImage[] images;
  int imageCount;
  
  dragonBallz1(int x, int y, float Speed,int scoreValue, int healthInc,int frames)
  {
    super(x, y, Speed,scoreValue, healthInc,frames);
    images = new PImage[frames];
    for (int i = 0; i < frames; i++){
     String filename = "B" + nf(i,2) + ".png";
     images[i] = loadImage(filename);
    }//for loop to load the images  
  }//collectables contructor
  @Override
  void render()
  {
   if ( counter<7)
    {image(images[0],x,y);}
    else if (counter <17)
    {image(images[1],x,y);}
    else if ( counter < 27)
    {image(images[2],x,y);} 
    else if (counter <37)
    {image(images[3],x,y);}
    else if (counter < 46)
    {image(images[4],x,y);} 
    else    
    {image(images[4],x,y);
      counter=0;
    }// reset to go through
    counter ++;
  }//render procedure
}//collectable class
