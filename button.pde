class button {
    float posX, posY;
    float w,h;
    String text;


    button(float x, float y, float btn_w, float btn_h, String t) {
      posX = x;
      posY = y;
      w = btn_w;
      h = btn_h;
      text = t;
    }


    boolean registerClick(float xIn, float yIn) {
        if (xIn > posX && xIn < posX + w && yIn < posY + h && yIn > posY) {
            return true;
        } else {
          return false;
        }
    }

    void drawButton() {
        fill(0);
        rect(posX, posY, w, h);
        fill(255);
        textSize(25);
        textAlign(CENTER);
        text(text, posX, posY+(h/4), w, h);
    }
}
