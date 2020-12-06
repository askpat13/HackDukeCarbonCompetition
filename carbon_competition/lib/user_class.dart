import "services/database.dart";

import 'daily_class.dart';

class User {
  // TODO: user weight
  //int user_weight; //lbs

  // TODO: input in different units
  int userHeatAvg; //dollars

  // TODO: multiple cars
  int userMpg;

  // daily data
  Map<int, DailyData> dataByDay;

  // constructor
  User(this.userHeatAvg, this.userMpg) {
    this.dataByDay = new Map<int, DailyData>();
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
  }
}