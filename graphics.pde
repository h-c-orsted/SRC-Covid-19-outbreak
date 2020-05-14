class graphics {
 
  void showMessage(String message) {
    fill(255, 20, 20);
    rect(50, 920, 1820, 100);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text(message, 50, 945, 1820, 100);
  } 
  
  void showLogo(float x_pos, float y_pos, float w, float h) {
    PImage img = loadImage("logo.png");
    image(img, x_pos, y_pos, w, h);
  }
  
  void showHeader(float x_pos, float y_pos) {
    showLogo(x_pos, y_pos, 100, 100);
    
    fill(255);
    textSize(40);
    textAlign(LEFT);
    text("Covid-19 outbreak information center", x_pos+120, y_pos+60);
    
    fill(255);
    rect(0, y_pos+130, 2000, 1);
  }
  
  void showGraphInfo(float x_pos, float y_pos, float w, float h, String info) {
    fill(255);
    rect(x_pos, y_pos, w, h);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(info, x_pos, y_pos+15, w, h);
    textSize(15);
    text("Plase hover the graph to show details", x_pos, y_pos+60, w, h);
  }
  
}
