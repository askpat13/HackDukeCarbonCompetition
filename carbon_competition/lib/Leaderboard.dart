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
      body: ListView(
          children: <Widget>[
            ListTile(leading: new Image(
                image: AssetImage('assets/images/1.png'),
              alignment: Alignment(-0.9, 3.0),
              height: 50,
              width: 50),
              title: Text("Username"),
              subtitle: Text("Points"),
            ),
          ]
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
