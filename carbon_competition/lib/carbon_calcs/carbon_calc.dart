// Carbon calculation algorithm
import 'package:carbon_competition/carbon_calcs/meal_carbon_calc.dart';
import 'package:carbon_competition/carbon_calcs/transport_carbon_calc.dart';
import "package:carbon_competition/user_class.dart";


double calcDailyCarbonUsed(Map<String, int> miles, List<Meal> meals, User user) {
  // meals = list of Meal Objects
  // miles = list of miles from each type of transportation
  double carbonUsed = 0;

  // Add carbon from heating for the day
  // TODO: calculate daily heating based on time of year
  carbonUsed += User.userAvgDailyHousingCarbon;

  // Add carbon from meals
  carbonUsed += calcCarbonFromMeals(meals);

  // Add carbon from miles
  carbonUsed += calcCarbonFromMiles(miles, user);

  return carbonUsed;
}