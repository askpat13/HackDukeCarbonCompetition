import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(bottom: 40),
      color: Colors.white,
      child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.person, size: 40),
                onPressed: () {Navigator.pushReplacementNamed(context, '/home');}
                ),
            IconButton(icon: Icon(Icons.leaderboard, size: 40),
                onPressed: () {Navigator.pushReplacementNamed(context, '/leader');}
            ),
            IconButton(icon: Icon(Icons.healing, size: 40),
                onPressed: () {Navigator.pushReplacementNamed(context, '/donations');}
            ),
          ],
        )
    );
  }

}