import "services/database.dart";
import 'dart:collection';

import "package:carbon_competition/services/database.dart";
import 'package:flutter/rendering.dart';

import 'daily_class.dart';

class User {
  // TODO: user weight
  //int user_weight; //lbs

  static String name = "User";
  static String zip = "";
  static int level = 0;
  static int icon = 0;

  // TODO: input in different units
  // static int userHeatAvg = 0; //dollars

  static double userAvgDailyHousingCarbon = 0;

  // TODO: multiple cars
  static int userMpg = 0;

  // daily data
  static HashMap<int, DailyData> dataByDay = new HashMap<int, DailyData>();

  // add carbon (kilograms) to today's entry
  static void addCarbon(double carbon) {
    int dayNo = today();
    if (!dataByDay.containsKey(dayNo)) {
      dataByDay[dayNo] = new DailyData();
    }
    dataByDay[dayNo].addCarbon(carbon);
  }

  // get carbon (kilograms) for today
  static double getCarbon() {
    int dayNo = today();
    if (!dataByDay.containsKey(dayNo)) {
      return 0;
    } else {
      return dataByDay[dayNo].carbonUsage;
    }
  }

  // get a unique integer representing today
  static int today() {
    DateTime now = new DateTime.now();
    int dayNo = ((now.year - 2000) * 500) + (now.month * 32) + now.day;
    return dayNo;
  }

  static Future<void> pushToDatabase() async {
    await DatabaseService.pushUserData();
  }

  static Future<void> pullFromDatabase() async {
    await DatabaseService.pullUserData();
  }

  static void printUser() {
    print("Average Daily Housing Carbon $userAvgDailyHousingCarbon");
    print("Miles Per Gallon $userMpg");
    print("User Level $level");

    printDailyData(day, data) {
      print("Day $day");
      data.printDailyData();
    }
    dataByDay.forEach(printDailyData);
  }
}