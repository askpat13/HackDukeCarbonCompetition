import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:carbon_competition/carbon_calc.dart';

import '../device_uuid.dart';
import '../user_class.dart';

class DatabaseService {

  // 'FINAL'
  static String uid;

  // collection reference
  static final CollectionReference user_data = Firestore.instance.collection('user_data');
  static final CollectionReference carbon_use_data = Firestore.instance.collection('carbon_use_data');

  static Future updateUserData(User user) async {
    if (uid == null) {
      uid = await getDeviceUuid();
    }

    if (await checkIfDocExists(uid, 'user_data')) {
      print("exists");
    }
    // If file
    else {
      print("no");
    }

    return await user_data.document(uid).setData({
      'user_heat_avg': user.user_heat_avg,
      'user_mpg': user.user_mpg
    });
  }

  static Future pullUserData(User user) async {
    if (uid == null) {
      uid = await getDeviceUuid();
    }

    // If file exists, grab data from
    if (await checkIfDocExists(uid, 'user_data')) {
      CollectionReference collectionRef = Firestore.instance.collection('user_data');

      DocumentSnapshot doc = await collectionRef.document(uid).get();

      // Update
      user.user_mpg = doc.data['user_mpg'];
      user.user_heat_avg = doc.data['user_heat_avg'];
      print(user.user_mpg);
      print(user.user_heat_avg);

    }
    // If file
    else {
      print("Set data in document to default");

      user_data.document(uid).setData({
        'user_heat_avg': user.user_heat_avg,
        'user_mpg': user.user_mpg,
      });
    }

  }
}

Future<bool> checkIfDocExists(String docId, String collection_name) async {
  try {
    // Get reference to Firestore collection
    CollectionReference collectionRef = Firestore.instance.collection(collection_name);

    DocumentSnapshot doc = await collectionRef.document(docId).get();
    return doc.exists;
  } catch (e) {
    return false;
  }
}