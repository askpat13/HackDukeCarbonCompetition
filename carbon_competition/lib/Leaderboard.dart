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
          ListTile(leading: Icon(Icons.more_vert),title: Text("User Pic here"),
            subtitle: Text("Username"),
            trailing: Text("Points"),)

        ],
      ),



      bottomNavigationBar: BottomNavBar(),
    );
  }
}