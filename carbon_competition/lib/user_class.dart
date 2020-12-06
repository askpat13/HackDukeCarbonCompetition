import "package:carbon_competition/services/database.dart";

class User {
  // TODO: user weight
  //int user_weight; //lbs

  // TODO: input in different units
  int user_heat_avg; //dollars

  // TODO: multiple cars
  int user_mpg;

  User(this.user_heat_avg, this.user_mpg);

  // send this user to the database
  void updateDatabase() {
    DatabaseService.updateUserData(this);
  }

  // get data from database and update the user
  void pullFromDatabase() async {
    Map<String, dynamic> data = await DatabaseService.getUserData();
    if (data == null) {
      print("pullFromDatabase() failed - data was null.");
    } else {
      user_heat_avg = data["user_heat_avg"];
      user_mpg = data["user_mpg"];
    }
  }
}