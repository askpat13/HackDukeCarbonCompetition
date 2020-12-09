import 'dart:collection';

import "package:carbon_competition/services/database.dart";
import 'package:carbon_competition/carbon_calcs/meal_carbon_calc.dart';

class DailyCarbonInfo {
  static List<Meal> meals;
  static Map<String, int> miles;
}