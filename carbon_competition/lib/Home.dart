import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

class CarbonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page'),
          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Settings',
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            )
          ]
      ),
      body: Container(
          child: Center(
              child: Text('Go Green!')
          )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
