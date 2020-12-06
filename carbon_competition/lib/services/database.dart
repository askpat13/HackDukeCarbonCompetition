import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:carbon_competition/carbon_calcs/carbon_calc.dart';

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

    // Convert dataByDay to a serializable type
    HashMap<String, HashMap<String, dynamic>> serializedData = new HashMap<String, HashMap<String, dynamic>>();
    serialize(day, dailyData) {
      String index = day.toString();
      serializedData[index] = new HashMap<String, dynamic>();
      serializedData[index]['carbonUsage'] = User.dataByDay[day].carbonUsage;
    }
    User.dataByDay.forEach(serialize);
    print(serializedData);

    // update database
    return await userData.document(uid).setData({
      'name': User.name,
      'zip': User.zip,
      'level': User.level,
      'userAvgDailyHousingCarbon': User.userAvgDailyHousingCarbon,
      'userMpg': User.userMpg,
      'dataByDay': serializedData
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
      User.userMpg = doc.data['userMpg'];
      User.userAvgDailyHousingCarbon = doc.data['userAvgDailyHousingCarbon'];

      // Update day-by-day data (convert back to HashMap)
      //HashMap<String, HashMap<String, dynamic>> serializedData = HashMap<String, dynamic>.from(doc.data['dataByDay']);
      HashMap<String, dynamic> serializedData = HashMap<String, dynamic>.from(doc.data['dataByDay']);
      HashMap<int, DailyData> dataByDay;
      deserialize(day, dailyData) {
        int index = int.parse(day);
        dataByDay = new HashMap<int, DailyData>();
        dataByDay[index] = new DailyData(dailyData['carbonUsage']);
      }
      serializedData.forEach(deserialize);
      User.dataByDay = dataByDay;

    } else {
      print("Document does not exist, cannot pull.");
    }
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