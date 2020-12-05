import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference
  final CollectionReference brew = Firestore.instance.collection('test');
}