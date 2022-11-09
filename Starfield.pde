class firework {
  double fx, fy, fSpd, fAng, fSz;
  int fRed, fGrn, fBlu;
  firework(int x, int y) {
    fx = x;
    fy = y;
    fSz = 2;
    fRed = (int)(Math.random()*100)+155;
    fGrn = (int)(Math.random()*100)+70;
    fBlu = (int)(Math.random()*100)+50;
    fAng = (Math.random()*(2* PI));
    fSpd = (Math.random()*5)+3;
  }
  void boom() {
    fSz += 0.1;
    fx += Math.cos(fAng)*fSpd;
    fy += Math.sin(fAng)*fSpd;
    fBlu += 5;
  }
  void show() {
    fill(fRed, fGrn, fBlu);
    ellipse((float)fx, (float)fy, (float)fSz, (float)fSz);
  }
}//end firework class
class oddball extends firework {
  oddball(int x, int y) {
    super(x, y);
    fSpd = (Math.random()*4)+2;
  }
  void show() {
    fill(150,170,210);
    rect((float)fx, (float)fy, 10, 10);
  }
  void boom() {
    super.boom();
    fx += (Math.random()*10)-5;
    fy += (Math.random()*10)-5;
  }
}//end oddball

firework[] kachow;
int age = 0;
int maxAge = 30;
void setup() {
  noStroke();
  size(600, 600);
  background(35, 90, 150);
  kachow = new firework[50];
  for (int i = 0; i<kachow.length; i++) {
    if(i%4 == 0){
      kachow[i] = new oddball(300, 300);
    }
    else {
      kachow[i] = new firework(300, 300);
    }
  }
}//endsetup

void draw() {
  fill(35, 90, 150, 20);
  rect(0,0, 600, 600);
  age ++;
  if(age< maxAge){
    for (int i = 0; i<kachow.length; i++) {
      kachow[i].show();
      kachow[i].boom();
    }
  }
}//enddraw

void mousePressed() {
  kachow = new firework[50];
  for (int i = 0; i<kachow.length; i++) {
    if(i%4 == 0){
      kachow[i] = new oddball(mouseX, mouseY);
    }
    else {
      kachow[i] = new firework(mouseX, mouseY);
    }
  }
  background(35, 90, 200);
  ellipse(mouseX, mouseY, 10, 10);
  age = 0;
}
