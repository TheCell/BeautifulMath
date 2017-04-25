void setup() {
  size(800, 800);
  background(0);  
}

float radius = 300;
int farbe = 1;
int middlePointx = 400;
int middlePointy = 400;
int bg = 0;
float x1= middlePointx + cos(0)* radius;
float y1 = middlePointy + sin(0)*radius;
float i = 0;
int reachedmiddle = 0;
float increment = random(2.0);
float radiusincrement = random(10);
void draw(){
  
  float rand = random(255);
  
  
  if(radius >= 0 && reachedmiddle == 0){
     
      if(bg == 1){background(0);};
      
      //Choose Color
      switch(farbe){
      case 0:
      stroke(rand, 255, 255);
      break;
      case 1:
      stroke(255, rand, 255);
      break;
      case 2:
      stroke(255, 255, rand);
      break;
    }
    
    //Set Stroke Weight
    strokeWeight(3);
    
    
    //Draw
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    
    //Increment radius
    radius = radius - radiusincrement;
    
    //Increment Angle
    i = i+ increment;
    
    //Check if middle is reached
    if(radius <= 0){reachedmiddle = 1; 
  increment = random(2.0); 
farbe = (int) random(2); 
bg = (int) random(2);
radiusincrement = random(8) + 1;
}  
  }
  if(radius <= 400 && reachedmiddle == 1){ 
    
      if(bg == 1){background(0);};  
    
      //Choose Color
      switch(farbe){
      case 0:
      stroke(rand, 255, 255);
      break;
      case 1:
      stroke(255, rand, 255);
      break;
      case 2:
      stroke(255, 255, rand);
      break;
    }
    
    //Set Stroke Weight
    strokeWeight(3);
    
    //Draw
    line(x1,y1,middlePointx + cos(i)* radius,middlePointy + sin(i)*radius);
    x1 = middlePointx + cos(i)* radius;
    y1 = middlePointy + sin(i)*radius;
    
    //Increment radius
    radius = radius + radiusincrement;
    
    //Increment Angle
    i = i+ 1.4;
    
    
    if(radius >= 399){reachedmiddle = 0;
  increment = random(2.0);
farbe = (int) random(2); 
bg = (int) random(2); 
radiusincrement = random(8) + 1;}
  }
  }