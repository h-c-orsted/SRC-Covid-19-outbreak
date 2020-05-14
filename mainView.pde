dataImport data = new dataImport();
graph dailyGraph = new graph();
graphics graphic = new graphics();

button btnShowAll;
button btnShowCases;
button btnShowDeaths;

void setup() {
  size(1920, 1080);
    
  btnShowCases = new button(1300, 350, 290, 50, "Show cases");
  btnShowDeaths = new button(1610, 350, 290, 50, "Show deaths");
  btnShowAll = new button(1300, 420, 290, 50, "Show all");
 
}


void draw() {
  clear();
  background(204);
  
  dailyGraph.showGraphDaily(data.importData(), 50, 200, 1200, 680);
  
  graphic.showMessage(data.importMessage());
  graphic.showHeader(50, 30);
  graphic.showGraphInfo(1300, 200, 600, 100, "Cases and deaths, US");
  
  btnShowCases.drawButton();
  btnShowDeaths.drawButton();
  btnShowAll.drawButton();
  
  dailyGraph.hover(mouseX, mouseY);
}


void mousePressed() {
  if (btnShowCases.registerClick(mouseX, mouseY)) {
    dailyGraph.changeView("cases");
  }
  
  if (btnShowDeaths.registerClick(mouseX, mouseY)) {
    dailyGraph.changeView("deaths");
  }
  
  if (btnShowAll.registerClick(mouseX, mouseY)) {
    dailyGraph.changeView("all");
  }
}
