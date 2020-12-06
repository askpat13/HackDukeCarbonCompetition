import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

class Donations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
          Text('Donations'),
        ),
      ),
      body: Container(
        child: Center(
            child: Text('Make a donation')
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}