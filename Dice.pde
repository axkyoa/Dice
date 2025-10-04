int cols = 7, rows = 7, dieSize = 50, total;
int clickCount = 0; // counts clicks

void setup() {
  size(650, 550);
  noLoop();
 
}

void draw() {
  background(20, 100, 30);  // poker table green
  total = 0;

  pushMatrix();
  translate(width/2 - (cols*dieSize)/2, height/2 - (rows*dieSize)/2 - 20);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      Die wataaa = new Die(i * dieSize, j * dieSize);
      wataaa.roll();
      wataaa.show();
      total += wataaa.value;
    }
  }
  popMatrix();

  fill(255, 215, 0);
  textSize(28);
  textAlign(CENTER,CENTER);
  if (clickCount >= 10) {
    text(" !YOU WIN! A BRAND NEW CAR! ", width/2, height - 25);
    clickCount = 0; // reset after winning
  } else {
    text("TOTAL: " + total, width / 2, height - 25);
  }
}

void mousePressed() {
  clickCount++;
  redraw();
}


class Die {
  int myX, myY, value;  
  color col;

  Die(int x, int y) {   
    myX = x;
    myY = y;
    int pick = (int)(Math.random() * 3);
    if (pick == 0) col = color(255);       // white
    else if (pick == 1) col = color(200, 0, 0); // red
    else col = color(0, 70, 180);          // blue
  }

  void roll() {
    value = (int)(Math.random() * 6) + 1;  
  }

  void show() {
    
    fill(0, 120); noStroke();
    rect(myX+3, myY+3, dieSize, dieSize, 10);

    
    fill(col); stroke(0);
    rect(myX, myY, dieSize, dieSize, 10);

    
   
fill(255);
int cx = myX + dieSize/2, cy = myY + dieSize/2;
int g = dieSize/4; 

int l = myX + g, r = myX + dieSize - g;

int t = myY + g, b = myY + dieSize - g;

if (value == 1 || value == 3 || value == 5) ellipse(cx, cy, 10, 10);

if (value >= 2) { ellipse(l, t, 10, 10); ellipse(r, b, 10, 10); }

if (value >= 4) { ellipse(r, t, 10, 10); ellipse(l, b, 10, 10); }

if (value == 6) { ellipse(l, cy, 10, 10); ellipse(r, cy, 10, 10); }
  }
}
