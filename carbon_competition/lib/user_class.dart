import "package:carbon_competition/services/database.dart";
import 'package:flutter/rendering.dart';

class User {
  // TODO: user weight
  //int user_weight; //lbs

  // TODO: input in different units
  int user_heat_avg; //dollars

  // TODO: multiple cars
  int user_mpg;

  User(this.user_heat_avg, this.user_mpg);

  Future<void> updateDatabase() async {
    await DatabaseService.updateUserData(this);
  }

  Future<void> pullFromDatabase() async {
    await DatabaseService.pullUserData(this);
  }

  void printUser() {
    print("Heat Average $user_heat_avg");
    print("Miles Per Gallon $user_mpg");
  }
}