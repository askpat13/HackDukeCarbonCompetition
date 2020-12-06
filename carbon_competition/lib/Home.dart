import 'package:flutter/material.dart';
import 'BottomNavBar.dart';
import 'package:carbon_competition/user_class.dart';

class CarbonHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Carbon Crushers!'),

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
      body:
      Column(
      children: [
        UserCard(),
        ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/dailycarbon');}
        , child: Text('Enter your daily carbon data!'))
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class UserCard extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
  return new Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
    child: new Column(
      children: <Widget>[
        avatarThumbnail,
        avatarCard,
      ],
    ),
    );
  }

 final avatarThumbnail = new Container(
   alignment: Alignment.topCenter,
     child: new Image(
       image: new AssetImage("assets/images/pixeldude.png"),
       height: 66,
       width: 66,
     ),
 );

 final avatarCard = new Container(
         height: 60.0,
         width: double.infinity,
         margin: new EdgeInsets.only(left: 20, right: 20),
         child: Column(
           children: <Widget> [
             Text(User.name),
             Text('lvl 1'),
             Text('Your most recent carbon output was ' + '2' + ' lbs.'),
           ],
         ),
     decoration: new BoxDecoration(
       color: new Color(0xFFE8F5E9),
       shape: BoxShape.rectangle,
       borderRadius: new BorderRadius.circular(8.0),
       boxShadow: <BoxShadow>[
         new BoxShadow(
           color: Colors.black12,
           blurRadius: 10.0,
           offset: new Offset(0.0, 10.0),
         ),
       ],
     ),
   );

}

