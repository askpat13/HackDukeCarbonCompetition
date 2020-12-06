import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:carbon_competition/carbon_calcs/carbon_calc.dart';

import '../device_uuid.dart';
import '../user_class.dart';

class DatabaseService {

  // 'FINAL'
  static String uid;

  // collection reference
  static final CollectionReference userData = Firestore.instance.collection(
      'userData');
  static final CollectionReference carbonUseData = Firestore.instance
      .collection('carbonUseData');

  // send user data to database
  static Future<void> pushUserData(User user) async {
    if (uid == null) {
      uid = await getDeviceUuid();
    }

    if (await checkIfDocExists(uid, 'userData')) {
      print("The document exists, pushing.");
    } else {
      print("The document does not exist, pushing.");
    }

    return await userData.document(uid).setData({
      'user_heat_avg': user.userHeatAvg,
      'user_mpg': user.userMpg,
      'data_by_day': user.dataByDay
    });
  }

  // get data from database for user
  static Future<void> pullUserData(User user) async {
    if (uid == null) {
      uid = await getDeviceUuid();
    }

    // If file exists, grab data from
    if (await checkIfDocExists(uid, 'userData')) {
      print("Document exists, pulling.");
      CollectionReference collectionRef = Firestore.instance.collection(
          'userData');

      DocumentSnapshot doc = await collectionRef.document(uid).get();

      // Update
      user.userMpg = doc.data['userMpg'];
      user.userHeatAvg = doc.data['userHeatAvg'];
      user.dataByDay = doc.data['dataByDay'];
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