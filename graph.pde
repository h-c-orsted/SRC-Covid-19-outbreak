class graph {
  String graphType = "all";
  
  int x_pos, y_pos;
  float graph_width, graph_height;
  
  float max_value = 1;
  float value_height, bar_width;
  int count_rows;
  String[] date;
  int[] cases;
  int[] deaths;
  
  
  void prepareGraph(Table table, int x_pos, int y_pos, float graph_width, float graph_height) {
    max_value = 1;
    count_rows = table.getRowCount();
    date = new String[count_rows];
    cases = new int[count_rows];
    deaths = new int[count_rows];
    
    
    fill(100);
    rect(x_pos, y_pos, graph_width, graph_height);
    
    int i = 0;
    for (TableRow row : table.rows()) {
      date[i] = row.getString("date");
      cases[i] = row.getInt("cases");
      deaths[i] = row.getInt("deaths");
      i++;
    }
    
    fill(255);
    circle(x_pos+15, y_pos+20, 16);
    fill(255, 10, 10);
    circle(x_pos+15, y_pos+45, 16);
    fill(255);
    textSize(16);
    textAlign(LEFT);
    text("Cases", x_pos+30, y_pos+26);
    text("Deaths", x_pos+30, y_pos+51);
  }
  
  
  
  void showGraphDaily(Table us_table, int xPos, int yPos, float gWidth, float gHeight) {
    x_pos = xPos;
    y_pos = yPos;
    graph_width = gWidth;
    graph_height = gHeight;
    
    // Prepare data
    prepareGraph(us_table, x_pos, y_pos, graph_width, graph_height);
    
    // Set max value so we can make the graph bars correctly
    if (graphType == "deaths") {
      for (TableRow row : us_table.rows()) {
        int cases = row.getInt("deaths");
        if (cases > max_value) {max_value = cases;}
      }
    } else {
      for (TableRow row : us_table.rows()) {
        int cases = row.getInt("cases");
        if (cases > max_value) {max_value = cases;}
      }
    }
    
    max_value *= 1.2;
    value_height = graph_height / max_value;
    bar_width = graph_width / count_rows;
    
    
    for (int i=0; i<count_rows; i++) {
      float bar_x_pos = x_pos + bar_width * i;
      float bar_y_pos = y_pos + graph_height;
      float bar_height_cases = cases[i] * value_height;
      float bar_height_deaths = deaths[i] * value_height;
      
      if (graphType == "all") {
        fill(255, 255, 255);
        rect(bar_x_pos, bar_y_pos, bar_width, -bar_height_cases);
        fill(255, 10, 10);
        rect(bar_x_pos, bar_y_pos, bar_width, -bar_height_deaths);
      }
      else if (graphType == "cases") {
        fill(255, 255, 255);
        rect(bar_x_pos, bar_y_pos, bar_width, -bar_height_cases);
      }
      else if (graphType == "deaths") {
        fill(255, 10, 10);
        rect(bar_x_pos, bar_y_pos, bar_width, -bar_height_deaths);
      }
      
      
    }    
  }
  
  
  void changeView(String view) {
    graphType = view;
  }
  
  
  void hover(float xIn, float yIn) {
    if (xIn > x_pos && xIn < x_pos + graph_width && yIn < y_pos + graph_height && yIn > y_pos) {
      
      int index = round((xIn - x_pos) / (graph_width / count_rows));
      if (index > count_rows-1) {index = count_rows-1;}
      
      if (graphType == "all") {       
        fill(255);
        rect(xIn, yIn, -200, -80);
        fill(100);
        textAlign(LEFT);
        textSize(15);
        text("Date: " + date[index], xIn-190, yIn-60);
        text("Cases: " + cases[index], xIn-190, yIn-40);
        text("Deaths: " + deaths[index], xIn-190, yIn-20);
      }
      else if (graphType == "cases") {
        fill(255);
        rect(xIn, yIn, -200, -60);
        fill(100);
        textAlign(LEFT);
        textSize(15);
        text("Date: " + date[index], xIn-190, yIn-40);
        text("Cases: " + cases[index], xIn-190, yIn-20);
      }
      else if (graphType == "deaths") {
        fill(255);
        rect(xIn, yIn, -200, -60);
        fill(100);
        textAlign(LEFT);
        textSize(15);
        text("Date: " + date[index], xIn-190, yIn-40);
        text("Deaths: " + deaths[index], xIn-190, yIn-20);
      }
      
      
    }
  }
  
}
