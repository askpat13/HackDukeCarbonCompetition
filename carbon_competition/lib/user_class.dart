import "services/database.dart";
import 'dart:collection';

import "package:carbon_competition/services/database.dart";
import 'package:flutter/rendering.dart';

import 'daily_class.dart';

class User {
  // TODO: user weight
  //int user_weight; //lbs

  static String name = "";
  static String zip = "";

  // TODO: input in different units
  static int userHeatAvg = 0; //dollars

  // TODO: multiple cars
  static int userMpg = 0;

  // daily data
  static HashMap<int, DailyData> dataByDay = new HashMap<int, DailyData>();

  // add carbon (kilograms) to today's entry
  static void addCarbon(int carbon) {
    int dayNo = today();
    if (!dataByDay.containsKey(dayNo)) {
      dataByDay[dayNo] = new DailyData();
    }
    dataByDay[dayNo].addCarbon(carbon);
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
    print("Heat Average $userHeatAvg");
    print("Miles Per Gallon $userMpg");

    printDailyData(day, data) {
      print("Day $day");
      data.printDailyData();
    }
    dataByDay.forEach(printDailyData);
  }
}