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
//   carbonUsed += user.user_heat_avg;

  // Add carbon from meals
  carbonUsed += calcCarbonFromMeals(meals);

  // Add carbon from miles
  carbonUsed += calcCarbonFromMiles(miles, user);

  return carbonUsed;
}

void main() {
  Map<String, int> miles = {"plane":100};

  Drink drink = new Drink("beer",1);
  Meal meal1 = new Meal("beef", "vegetable", drink);
  Meal meal2 = new Meal("poultry", "vegetable", drink);
  User user = new User(50, 30);
  List<Meal> meals = [meal1, meal2];

  print(calcDailyCarbonUsed(miles, meals, user));
}