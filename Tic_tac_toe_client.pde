//CLIENT SENDS O's (1)
import processing.net.*;

Client myClient;

color teal = #24D69E;
color pink = #FA544E;
boolean itsMyTurn = false;

int[][] grid;
//rows columns

void setup() {
  size(300, 400);
  strokeWeight(3);
  textAlign(CENTER, CENTER);
  textSize(50);
  grid = new int[3] [3];
  myClient = new Client(this, "127.0.0.1", 1234);
}


void draw() {
  if (itsMyTurn) {
    background(teal);
  } else{
  background(pink);
  }
  
  //DRAW DIVIDING LINES
  stroke(0);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  
  //DRAW X AND O
  for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 3; col++) {
      drawXO(row, col);
    }
  }
  
  //DRAW MOUSE COORDINATES
  fill(0);
  text(mouseX + "," + mouseY, 150, 350);

  //RECEIVING MESSAGES
  if (myClient.available() > 0) {
    String incoming = myClient.readString();
    int r = int(incoming.substring(0, 1));
    int c = int(incoming.substring(2,3));
    grid[r][c] = 2;  
    itsMyTurn = true;
   }
}


void drawXO (int row, int col) {
  pushMatrix();
  translate(row*100, col*100);
  if (grid[row][col] == 1) {
    noFill();
    ellipse(50, 50, 90, 90);
  } else if (grid[row][col] == 2) {
      line(10, 10, 90, 90);
      line(90, 10, 10, 90);
  }
  popMatrix();
}


void mouseReleased() {
  int row = (int)mouseX/100; //int/int = whole number
  int col = (int)mouseY/100;
  if (itsMyTurn && grid[row][col] == 0) { //check if the box is empty
    grid[row][col] = 1;
    myClient.write(row + "," + col);
    itsMyTurn = false;
  }
  
}
