import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
          child:
           Text('Settings'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Edit settings')
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}