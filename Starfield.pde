Particle[] arrayBob; 

void setup()
{
  size(700,700);
  arrayBob = new Particle[100];
  for(int i = 0; i <arrayBob.length; i++)
  {
    arrayBob[i] = new NormalParticle();
  }
  arrayBob[9] = new JumboParticle();
  arrayBob[8] = new OddballParticle();
  
}
void draw()
{
  background(200);
  for(int i = 0; i <arrayBob.length; i++)
  {
    arrayBob[i].show();
    arrayBob[i].move();
  }
  
}

interface Particle
{
  public void show();
  public void move();
}

class NormalParticle implements Particle
{
  double myX, myY, angle, speed;
  int myColor;
  NormalParticle()
  {
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    myX = myY = 350;
    speed = (int)(Math.random()+1)*4;
    angle = (Math.random())*2*Math.PI;
  }
  public void move()
  {
    myX = myX + cos((float)angle) * speed;
    myY = myY + sin((float)angle) * speed;
    if((myX>700)||(myX<0)||(myY>700)||(myY<0))
    {
      myX = myY =350;
    }

  }
  public void show()
  {
    fill(myColor);
    ellipse((float)myX,(float)myY, 15,15);
  }
}

class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill(0,0,100);
    ellipse((float)myX,(float)myY, 30,30);
  }
}

class OddballParticle extends NormalParticle
{
  public void show()
  {
    rect((float)myX,(float)myY, 50,50);
  }
  
  public void move()
  {
   myX = myX + (Math.random()*5)-2;
   myY = myY + (Math.random()*5)-2;
  }
}
