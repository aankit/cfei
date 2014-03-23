//the rain class creates many drops
Rain r = new Rain();
Timer t = new Timer();
//what am i controlling in the main program?
//I can controlling the timer
void setup(){
  size(600,800);
  
}

void draw(){
  background(152);
  r.makeItRain(0);
  r.run();
}
