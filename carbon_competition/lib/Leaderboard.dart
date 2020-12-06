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
        Container(
          padding: EdgeInsets.only(top: 10),

          ListTile(
            : Icon(Icons.more_vert), title: Text("images/assets"),
            alignment: Alignment(-0.9, 3.0),
            height: 50,
            width: 50),


            ListTile(
              subtitle: Text("Username"),
              trailing: Text("Points"),)
        )
    ])
  }






      bottomNavigationBar: BottomNavBar(),
    );
  }
}
