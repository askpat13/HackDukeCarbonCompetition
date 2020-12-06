import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../device_uuid.dart';
import '../user_class.dart';
import '../daily_class.dart';

class DatabaseService {

  // 'FINAL'
  static String uid;

  // collection reference
  static final CollectionReference userData = Firestore.instance.collection(
      'userData');
  static final CollectionReference carbonUseData = Firestore.instance
      .collection('carbonUseData');

  // send user data to database
  static Future<void> pushUserData() async {
    if (uid == null) {
      uid = await getDeviceUuid();
    }

    if (await checkIfDocExists(uid, 'userData')) {
      print("The document exists, pushing.");
    } else {
      print("The document does not exist, pushing.");
    }

    // update database
    return await userData.document(uid).setData({
      'name': User.name,
      'zip': User.zip,
      'level': User.level,
      'icon': User.icon,
      'userMpg': User.userMpg,
      'userAvgDailyHousingCarbon': User.userAvgDailyHousingCarbon,
      'dataByDay': _serialize(User.dataByDay)
    });
  }

  // get data from database for user
  static Future<void> pullUserData() async {
    if (uid == null) {
      uid = await getDeviceUuid();
    }

    // If file exists, grab data from
    if (await checkIfDocExists(uid, 'userData')) {
      print("Document exists, pulling.");
      CollectionReference collectionRef = Firestore.instance.collection(
          'userData');

      DocumentSnapshot doc = await collectionRef.document(uid).get();

      // Update user data
      User.name = doc.data['name'];
      User.level = doc.data['level'];
      User.zip = doc.data['zip'];
      User.icon = doc.data['icon'];
      User.userMpg = doc.data['userMpg'];
      if (doc.data['userAvgDailyHousingCarbon'] != null){
        User.userAvgDailyHousingCarbon = doc.data['userAvgDailyHousingCarbon'];
      }
      User.dataByDay = _deserialize(doc.data['dataByDay']);
    }
  }

  // serialize data for database
  static HashMap<String, HashMap<String, dynamic>> _serialize(HashMap<int, DailyData> dataByDay) {
    HashMap<String, HashMap<String, dynamic>> serializedData = new HashMap<String, HashMap<String, dynamic>>();
    serialize(day, dailyData) {
      String index = day.toString();
      serializedData[index] = new HashMap<String, dynamic>();
      serializedData[index]['carbonUsage'] = User.dataByDay[day].carbonUsage;
    }
    dataByDay.forEach(serialize);
    return serializedData;
  }

  // deserialize daily data from database
  static HashMap<int, DailyData> _deserialize(dynamic serializedDataByDay) {
    HashMap<String, dynamic> serializedData = HashMap<String, dynamic>.from(
        serializedDataByDay);
    HashMap<int, DailyData> dataByDay;
    dataByDay = new HashMap<int, DailyData>();
    insertDailyClass(day, dailyData) {
      int index = int.parse(day);
      dataByDay[index] = new DailyData(dailyData['carbonUsage']);
    }
    serializedData.forEach(insertDailyClass);
    return dataByDay;
  }

  // get top users from leaderboard
  static Future<List<LeaderboardEntry>> getTopScores() async {
    // Get list of all user documents
    CollectionReference collectionRef = Firestore.instance.collection('userData');
    QuerySnapshot querySnapshot = await collectionRef.getDocuments();
    List<DocumentSnapshot> documentSnapshots = querySnapshot.documents;

    // Create a list of sortable LeaderboardEntries.
    List<LeaderboardEntry> leaders = new List<LeaderboardEntry>();
    addLeader(snapshot) {
      String name = snapshot.data['name'];
      int today = User.today();
      HashMap<int, DailyData> dataByDay = _deserialize(snapshot.data['dataByDay']);
      DailyData todayData = dataByDay[today];
      double carbon = 0;
      if (todayData != null) {
        double carbon = todayData.carbonUsage;
      }
      LeaderboardEntry newEntry = new LeaderboardEntry(name, carbon);
      leaders.add(newEntry);
    }
    documentSnapshots.forEach(addLeader);

    // Sort leaders by lowest carbon values
    //leaders.sort();
    leaders.sort((entry1, entry2) => entry1.compareTo(entry2));
    return leaders;
  }
}

Future<bool> checkIfDocExists(String docId, String collectionName) async {
  try {
    // Get reference to Firestore collection
    CollectionReference collectionRef = Firestore.instance.collection(collectionName);

    DocumentSnapshot doc = await collectionRef.document(docId).get();
    return doc.exists;
  } catch (e) {
    return false;
  }
}

class LeaderboardEntry {
  String name;
  double carbon;
  LeaderboardEntry(this.name, this.carbon);

  // NOTE: Less carbon is better.
  int compareTo(LeaderboardEntry other) {
    if (this.carbon > other.carbon) {return 1;}
    else if (this.carbon < other.carbon) {return -1;}
    else {return 0;}
  }
}