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

      Image.network("https://lh3.googleusercontent.com/proxy/yH-wKB0IRPlPAMs5Ocr7jOLhkcid208ZpFqCVWc-95T_U2I60zmTb15yCCVDjLwrBtj-Vvw19kodReNgqI_0gJCAFJm-ikPhllUv9g9A4tDgrk966FNZM4me",

          height: 50,
        width: 50),




          ListTile(
            subtitle: Text("Username"),
            trailing: Text("Points"),)
    ],
      ),







      bottomNavigationBar: BottomNavBar(),
    );
  }
}
