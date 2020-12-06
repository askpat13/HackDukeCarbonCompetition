import "package:carbon_competition/services/database.dart";

class User {
  // TODO: user weight
  //int user_weight; //lbs

  // TODO: input in different units
  int user_heat_avg; //dollars

  // TODO: multiple cars
  int user_mpg;

  User(this.user_heat_avg, this.user_mpg);

  void updateDatabase() {

    DatabaseService.updateUserData(this);
  }

  void pullFromDatabase() {
    DatabaseService.pullUserData(this);
  }
}