import 'dart:io';

Future<double> calcAvgHousingCarbon(String targetZip) async {

  // Parse information on zip code
  String contents = await File('/Users/joshholder/Documents/code/HackDukeCarbonCompetition/carbon_competition/lib/carbon_calcs/housing.csv').readAsString();
  List<String> contentSplit = contents.split(',');
  int zipIndex = contentSplit.indexOf(targetZip);

  // Find million BTU per person per year, lbs carbon per MWh
  double millionBtuPerPerson = 0;
  double carbonPerMwh = 1;
  if (zipIndex != -1) { // if zip code can be found
    millionBtuPerPerson = double.parse(contentSplit[zipIndex + 1]);
    carbonPerMwh = double.parse(contentSplit[zipIndex + 2]);
  }

  double yearsToDay = 0.002737850787;
  double millionBtuToMwh = 0.29307107;
  double lbsToKg = 0.453592;

  double millionBtuPerPersonPerDay = millionBtuPerPerson * yearsToDay;
  double kgCarbonPerPersonPerDay = millionBtuPerPersonPerDay * millionBtuToMwh * lbsToKg * carbonPerMwh;

  return kgCarbonPerPersonPerDay;
}