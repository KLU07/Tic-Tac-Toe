int[][] grid;
//rows columns

void setup() {
  size(300, 400);
  strokeWeight(3);
  textAlign(CENTER, CENTER);
  textSize(50);
  grid = new int[3] [3];
}


void draw() {
  background(255); //white
  
  //DRAW DIVIDING LINES
  stroke(0);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  
  //DRAW X AND O
  int row = 0;
  int col = 0;
  while (row < 3) {
    drawXO(row, col);
    col++;
    if (col == 3) {
      col = 0;
      row++;
    }
  }
  
  //DRAW MOUSE COORDINATES
  fill(0);
  text(mouseX + "," + mouseY, 150, 350);

}


void drawXO (int row, int col) {
  pushMatrix();
  translate(row*100, col*100);
  if (grid[row][col] == 1) {
    fill(255);
    ellipse(50, 50, 90, 90);
  } else if (grid[row][col] == 2) {
      line(10, 10, 90, 90);
      line(90, 10, 90, 10);
  }
  popMatrix();
}


void mouseReleased() {
  int row = mouseX/100; //int/int = whole number
  int col = mouseY/100;
  if (grid[row][col] == 0) { //check if the box is empty
    grid[row][col] = 1;
  }
  
}
