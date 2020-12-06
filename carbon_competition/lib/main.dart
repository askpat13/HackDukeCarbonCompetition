import 'package:carbon_competition/CarbonForm.dart';
import 'package:carbon_competition/Donations.dart';
import 'package:flutter/material.dart';
import 'package:carbon_competition/Home.dart';
import 'package:carbon_competition/Leaderboard.dart';
import 'package:carbon_competition/Settings.dart';
import 'package:carbon_competition/user_class.dart';
import 'package:carbon_competition/carbon_calcs/house_carbon_calc.dart';

void main() {
  runApp(MaterialApp(
    title: 'Carbon app',
    theme: ThemeData(
      primarySwatch: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: CarbonHome(),
    initialRoute: '/home',
    routes: {
      '/home': (context) => CarbonHome(),
      '/leader': (leadContext) => Leaderboard(),
      '/donations': (donoContext) => Donations(),
      '/settings': (settingsContext) => Settings(),
      '/dailycarbon': (carbonContext) => CarbonTracker()
    },
  ));
  initializeUser();
}

void initializeUser() async {
  await User.pullFromDatabase();
  User.addCarbon(600);
  User.printUser();

  double avg = await calcAvgHousingCarbon('10520');
  print(avg);
}