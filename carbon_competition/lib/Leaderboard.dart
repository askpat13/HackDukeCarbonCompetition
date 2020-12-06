import 'package:carbon_competition/services/database.dart';
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
          children: getTiles()
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

// TODO: Limit # of tiles to 5
List<ListTile> getTiles() {
  List<LeaderboardEntry> leaders = DatabaseService.getTopScores();
  List<ListTile> allTiles = new List<ListTile>();
  leaders.forEach((entry) =>
      allTiles.add(getTileForEntry(entry))
  );
  return allTiles;
}

ListTile getTileForEntry(LeaderboardEntry entry) {
  return ListTile(leading: new Image(
    image: AssetImage('assets/images/${entry.icon.toString()}.png'),
    alignment: Alignment(-0.9, 3.0),
    height: 50,
    width: 50),
    title: Text(entry.name),
    subtitle: Text(entry.carbon.toString())
  );
}