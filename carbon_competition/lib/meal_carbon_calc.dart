class Meal {
  String primary_type;
  String side_type;
  Drink meal_drinks;

  Meal(this.primary_type, this.side_type, this.meal_drinks);
}

class Drink {
  String drink_type;
  int num_drinks;

  Drink(this.drink_type, this.num_drinks);
}

// Source: https://ourworldindata.org/food-choice-vs-eating-local
var food_carbon_constants = {
  "beef":60.0, // per kg
  "lamb":24.0,
  "pork":7.0,
  "poultry":6.0,
  "rice":4.0,
  "wheat":1.4,
  "vegetable":0.7,
};

// Source: https://www.bieroundtable.com/wp-content/uploads/49d7a0_7a5cfa72d8e74c04be5aeb81f38b136b.pdf
// https://klementoninvesting.substack.com/p/the-carbon-footprint-of-drinking
// https://www.environmentalleader.com/2009/01/carbon-footprint-of-tropicana-orange-juice-17-kg/
var drink_carbon_constants = {
  "soda":0.2, // per drink
  "beer":0.330,
  "wine":0.275,
  "spirits":0.123,
  "juice":0.2125, // orange juice, 8oz serving
};

double calcCarbonFromMeals(List<Meal> meals) {
  // TODO: don't assume 2000 calories

  // Add carbon for all meals
  double meals_carbon_used = 0;
  for (int ii = 0; ii < meals.length; ii++) {
    Meal current_meal = meals[ii];

    // Calculate carbon contribution of primary makeup
    meals_carbon_used += calcCarbonFromPrimary(current_meal.primary_type);

    // Calculate carbon contribution of side makeup
    meals_carbon_used += calcCarbonFromSide(current_meal.side_type);

    // Calculate carbon contribution of drink makeup
    meals_carbon_used += calcCarbonFromDrink(current_meal.meal_drinks);
  }
  return meals_carbon_used;
}

double calcCarbonFromPrimary(String primary_type) {
  // Meat serving source: https://calculate-this.com/meat-person-calculator
  double standard_serving_kg = 0.2;
  double food_carbon_per_kg = food_carbon_constants[primary_type];

  return food_carbon_per_kg * standard_serving_kg;
}

double calcCarbonFromSide(String side_type) {
  // Assume half as much as primary
  double standard_serving_kg = 0.1;
  double food_carbon_per_kg = food_carbon_constants[side_type];

  return food_carbon_per_kg * standard_serving_kg;
}

double calcCarbonFromDrink(Drink drink) {
  double drink_carbon_per_kg = drink_carbon_constants[drink.drink_type];

  return drink_carbon_per_kg * drink.num_drinks;
}

// Testing functionality
void main() {
  Drink drink1 = new Drink("beer",1);
  Drink drink2 = new Drink("juice", 2);
  Meal meal1 = new Meal("beef", "vegetable", drink1);
  Meal meal2 = new Meal("poultry", "vegetable", drink2);
  List<Meal> meals = [meal1, meal2];

  print(calcCarbonFromMeals(meals));
}