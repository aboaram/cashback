import 'package:cashback/models/AppUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserDettails(String firstname, String lastname, String email,
      String balance, String vip, String sid, String team, String id) async {
    return await userCollection.doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'balance': balance,
      'vip': vip,
      'sid': sid,
      'team': team,
      'id': id
    });
  }

  // user data  from snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        firstname: snapshot['firstname'],
        balance: snapshot['balance'],
        sid: snapshot['sid'],
        team: snapshot['team'],
        vip: snapshot['vip'],
        id: snapshot['id']);
  }

  Stream<UserData> get AppuserData {
    return userCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
  }
}
