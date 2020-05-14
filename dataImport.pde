class dataImport {
  
  Table us_table;
  
  Table importData() {
    //us_table = loadTable("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv", "header");
    us_table = loadTable("us.csv", "header");
    return us_table;
  } 
  
  
  String importMessage() {
    // This would load the message from Homeland Security, but for now, it is a hard-coded string it returns
    //String[] messages = loadStrings("http://domain.com/message.txt");
    return "Stay at home and avoid any unnesesscary trips!";
  }
  
}
