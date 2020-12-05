import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:carbon_competition/carbon_calc.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference user_data = Firestore.instance.collection('user_data');
  final CollectionReference carbon_use_data = Firestore.instance.collection('carbon_use_data');

  Future updateUserData(User user) async {
    return await user_data.document(uid).setData({
      'car_mpg': user.user_mpg,
      'user_heat_avg': user.user_heat_avg,
    });
  }
}