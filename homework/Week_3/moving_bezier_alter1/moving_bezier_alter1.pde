int foo = floor(random(0,1000));
Bez[] b = new Bez[foo];

void setup(){
  size(1280, 800);
  for(int i=0;i<foo;i++) b[i] = new Bez();
}

void draw(){
  background(255);
  for(int i=0;i<foo;i++) b[i].display();
}
