import 'package:carbon_competition/services/database.dart';
import 'package:flutter/material.dart';
import 'package:carbon_competition/carbon_calc.dart';
import 'device_uuid.dart';

void main() {
    runApp(MaterialApp(
      title: 'Carbon app',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CarbonHome()
    ));

    getUuid();
}

// TODO: move to different file
void getUuid() async {
    print(await getDeviceUuid());
    String uuid = await getDeviceUuid();
    User test_user = new User(12, 30);
    await DatabaseService(uid: uuid).updateUserData(test_user);
}

class CarbonHome extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget> [
          IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Next page',
          onPressed: null,
          )
        ]
      ),
      body: Container(
      child: Center(
        child: Text('Go Green!')
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Leaderboards',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Donations',
          ),
        ],
      ),
    );
  }
}
