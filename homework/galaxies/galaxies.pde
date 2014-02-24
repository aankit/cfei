int planets = 850;
int stars = 100;
int rocks = 2000;
Planet[] p = new Planet[planets];
Star[] s = new Star[stars];
Rock[] r = new Rock[rocks];

void setup(){
	size(1280, 800, P3D);
	for (int i=0;i<planets;i++) p[i] = new Planet();
	for (int i=0;i<stars;i++) s[i] = new Star();
	for (int i=0;i<rocks;i++) r[i] = new Rock();
}

void draw(){
	for (int i=0;i<planets;i++) {
		p[i].update();
		p[i].display();
		//p[i] user interaction of some nature
	}
	for (int i=0;i<stars;i++) {
		s[i].update();
		s[i].display();
		//s[i] user interaction of some nature
	}
	for (int i=0;i<rocks;i++) {}
		r[i].update();
		r[i].display();
	}
}
