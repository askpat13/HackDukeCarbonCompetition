import 'package:carbon_competition/Donations.dart';
import 'package:flutter/material.dart';
import 'package:carbon_competition/Home.dart';
import 'package:carbon_competition/Leaderboard.dart';
import 'package:carbon_competition/Settings.dart';
import 'package:carbon_competition/user_class.dart';

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
      '/settings': (settingsContext) => Settings()
    },
  ));
  initializeUser();
}

void initializeUser() async {
  User default_user = new User(123,456);
  await default_user.pullFromDatabase();
  default_user.printUser();
}