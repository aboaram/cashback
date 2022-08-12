import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserDettails(String firstname, String lastname, String email,
      String balance, String vip, String sid, String team) async {
    return await userCollection.doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'balance': balance,
      'vip': vip,
      'sid': sid,
      'team': team,
    });
  }
}
