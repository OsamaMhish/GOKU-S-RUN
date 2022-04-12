class explosion
{
  int x,y;
  PImage[] images;
  int counter;
  int numFrames = 31; 
  explosion()
  {
    images = new PImage[numFrames];   
    for (int i = 0; i < numFrames; i++){
     String filename = "exp" + nf(i,1) + ".png";
     images[i] = loadImage(filename);
    }    
  }
  void render(int x,int y)
  {
   counter =(counter+1) % numFrames;//use % to cycle through frames
   image(images[(counter/2) % numFrames],x,y);
  }
  
  
}
