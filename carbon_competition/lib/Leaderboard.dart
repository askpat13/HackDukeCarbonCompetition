import 'package:flutter/material.dart';

import 'BottomNavBar.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
          Text('Leaderboard'),
        ),
      ),
      body: Container(
        child: Center(
            child: Text('Check friends activity')
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}