import "services/database.dart";
import 'dart:collection';

import "package:carbon_competition/services/database.dart";
import 'package:flutter/rendering.dart';

import 'daily_class.dart';

class User {
  // TODO: user weight
  //int user_weight; //lbs

  // TODO: input in different units
  int userHeatAvg; //dollars

  // TODO: multiple cars
  int userMpg;

  // daily data
  HashMap<int, DailyData> dataByDay;

  // constructor
  User(this.userHeatAvg, this.userMpg) {
    this.dataByDay = new HashMap<int, DailyData>();
  }

  // add carbon (kilograms) to today's entry
  void addCarbon(int carbon) {
    int dayNo = today();
    if (!dataByDay.containsKey(dayNo)) {
      dataByDay[dayNo] = new DailyData();
    }
    dataByDay[dayNo].addCarbon(carbon);
    int newCarbon = dataByDay[dayNo].carbonUsage;
  }

  // get a unique integer representing today
  int today() {
    DateTime now = new DateTime.now();
    int dayNo = ((now.year - 2000) * 500) + (now.month * 32) + now.day;
    return dayNo;
  }

  Future<void> pushToDatabase() async {
    await DatabaseService.pushUserData(this);
  }

  Future<void> pullFromDatabase() async {
    await DatabaseService.pullUserData(this);
  }

  void printUser() {
    print("Heat Average $userHeatAvg");
    print("Miles Per Gallon $userMpg");
    //dataByDay.forEach((k,v) => {print(k,v)});
  }
}