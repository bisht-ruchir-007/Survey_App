import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future updateUserData(String email, String name) async {
    return await userCollection.document(uid).setData({
      'email': email,
      'name': name,
    });
  }
}
