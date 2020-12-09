class Meal {
  String primaryType;
  String sideType;
  Drink mealDrinks;

  Meal(this.primaryType, this.sideType, this.mealDrinks);
}

class Drink {
  String drinkType;
  int numDrinks;

  Drink(this.drinkType, this.numDrinks);
}

// Source: https://ourworldindata.org/food-choice-vs-eating-local
var foodCarbonConstants = {
  "beef":60.0, // kg per kg
  "lamb":24.0,
  "pork":7.0,
  "dairy":21.0,
  "poultry":6.0,
  "rice":4.0,
  "wheat":1.4,
  "vegetable":0.7,
  "none":0,
};

// Sources: https://www.bieroundtable.com/wp-content/uploads/49d7a0_7a5cfa72d8e74c04be5aeb81f38b136b.pdf
// https://klementoninvesting.substack.com/p/the-carbon-footprint-of-drinking
// https://www.environmentalleader.com/2009/01/carbon-footprint-of-tropicana-orange-juice-17-kg/
// https://tappwater.co/us/carbon-footprint-bottled-water/
var drinkCarbonConstants = {
  "soda":0.2, // per drink
  "beer":0.330,
  "wine":0.275,
  "spirit":0.123,
  "bottled water":0.042, // bottled water 8oz
  "juice":0.2125, // orange juice, 8oz serving
  "none":0,
};

// double calcCarbonFromMeals(List<Meal> meals) {
//   // TODO: don't assume 2000 calories
//
//   // Add carbon for all meals
//   double mealsCarbonUsed = 0;
//   for (int ii = 0; ii < meals.length; ii++) {
//     Meal currentMeal = meals[ii];
//
//     // Calculate carbon contribution of primary makeup
//     mealsCarbonUsed += calcCarbonFromPrimary(currentMeal.primaryType);
//
//     // Calculate carbon contribution of side makeup
//     mealsCarbonUsed += calcCarbonFromSide(currentMeal.sideType);
//
//     // Calculate carbon contribution of drink makeup
//     mealsCarbonUsed += calcCarbonFromDrink(currentMeal.mealDrinks);
//   }
//   return mealsCarbonUsed;
// }

double calcCarbonFromPrimary(String primaryType) {
  // Meat serving source: https://calculate-this.com/meat-person-calculator
  double standardServingKg = 0.2;
  double foodCarbonPerKg = foodCarbonConstants[primaryType];

  return foodCarbonPerKg * standardServingKg;
}

double calcCarbonFromSide(String sideType) {
  // Assume half as much as primary
  double standardServingKg = 0.1;
  double foodCarbonPerKg = foodCarbonConstants[sideType];

  return foodCarbonPerKg * standardServingKg;
}

double calcCarbonFromDrink(String drinkType) {
  return drinkCarbonConstants[drinkType];
}