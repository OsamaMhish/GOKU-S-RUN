public boolean motion = false;

class Player
{
  int x,y;
  int speedX, speedY;
  int counter;
  PVector position ;
  PVector velocity;
  float jumpSpeed = 15;
  int up  = 0;
  float gravity = .5;
  int ground = height-50;
  PImage[] images;
  int imageCount;
  int numFrames = 6;
  
  Player(int x,int ground ,int speedX, int speedY)
  {
    
    this.x = x;
    this.ground = ground;
    this.speedX = speedX;
    this.speedY = speedY;
    images = new PImage[numFrames];
    for (int i = 0; i < numFrames; i++){
    String filename = "PL" + nf(i,2) + ".png";
    images[i] = loadImage(filename);
    }//for loop to load the images  
  }//player constructor 
  
  void update()
  {
    move();
    jump();
    render();
  }//update
  void render()
  {
    //if keypressed activated animate the player
    if (!motion)
    {image(images[0], x, y);}
    //if key released ativated stop the animation

    else if ( counter<7)
    {image(images[0], x, y);}
    else if (counter <17)
    {image(images[1], x, y);} 
    else if ( counter < 27)
    {image(images[2], x, y);} 
    else if (counter <37)
    {image(images[3], x, y);} 
    else if (counter < 47)
    {image(images[4], x, y);} 
    else if ( counter < 56)
    {image(images[5], x, y);}
    else    
    {image(images[5], x,y);
      counter=0;
    }// reset to go through
    counter ++;
  }//render procedure
  
  void move()
  {
    if (keyPressed ==true && key == CODED)
    {
      motion = true;
      if (keyCode == LEFT && position.x >= 0)
      { position.x -= speedX;}
      if (keyCode == RIGHT && position.x <= width-60)
      {position.x += speedX;}
    }  
  }//move procedure
  
  void jump()
{

  if (position.y < ground)
  { velocity.y += gravity;}
   else
  {velocity.y = 0;}//pull player back to the ground
  
  if (position.y >= ground && up != 0)
  {velocity.y = -jumpSpeed;}//player jump
  
  PVector nextPosition = new PVector(position.x, position.y);
  nextPosition.add(velocity);
  float offset = 0;
  if (nextPosition.x > offset && nextPosition.x < (width - offset))
  {
    position.x = nextPosition.x;
  } 
  if (nextPosition.y > offset && nextPosition.y < (height - offset))
  {
    position.y = nextPosition.y;
  }

  translate(position.x, position.y);

}
    boolean crash(Collectables Collectables)
  {return abs(position.x - Collectables.x) < 45 && abs(position.y - Collectables.y) < 45;}//colectables parent class
  
   boolean crash(Enemies Enemies)
  {return abs(position.x - Enemies.x) < 45 && abs(position.y - Enemies.y) < 45;}//enemy parent class
}
