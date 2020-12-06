import 'dart:io';

double calcAvgHousingCarbon(String zip){
  int int_zip = int.parse(zip);
  new File('/Users/joshholder/Documents/code/HackDukeCarbonCompetition/carbon_competition/lib/carbon_calcs/housing.csv').readAsString().then((String contents) {
    List<String> content_split = contents.split(',');
    for (int ii = 0; ii < content_split.length; ii++){
      print(content_split[ii]);
    }
  });
}