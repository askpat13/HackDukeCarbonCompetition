// Carbon calculation algorithm
import "meal_carbon_calc.dart";
import "package:carbon_competition/user_class.dart";

double calcDailyCarbonUsed(List<int> miles, List<Meal> meals, User user) {
  // meals = list of Meal Objects
  // miles = list of miles from each type of transportation
  double carbon_used = 0;

  // Add carbon from heating for the day
  // TODO: calculate daily heating based on time of year
//   carbon_used += user.user_heat_avg;

  // Add carbon from meals
  carbon_used += calcCarbonFromMeals(meals);

  // Add carbon from miles
  carbon_used += calcCarbonFromMiles(miles);

  return carbon_used;
}

double calcCarbonFromMiles(List<int> miles) {
  return 0;
}

void main() {
  List<int> miles = [10];

  Drink drink = new Drink("beer",1);
  Meal meal1 = new Meal("beef", "vegetable", drink);
  Meal meal2 = new Meal("poultry", "vegetable", drink);
  User user = new User(50, 30);
  List<Meal> meals = [meal1, meal2];

  print(calcDailyCarbonUsed(miles, meals, user));
}