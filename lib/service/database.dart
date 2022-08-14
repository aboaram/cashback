import 'package:cashback/models/AppUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference _inviteCollection =
      FirebaseFirestore.instance.collection('invitecode');

  Future updateInviteLink(int invitecode, int id) async {
    return await _inviteCollection
        .doc(uid)
        .set({'invitecode': invitecode, 'id': id});
  }

  Future updateUserDettails(
      String firstname,
      String lastname,
      String email,
      int balance,
      int vip,
      int sid,
      String active,
      int id,
      int invitecode,
      int refcode,
      bool isactivebounas) async {
    return await _userCollection.doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'balance': balance,
      'vip': vip,
      'sid': sid,
      'active': active,
      'id': id,
      'invitecode': invitecode,
      'refcode': refcode,
      'isactivebounas': isactivebounas
    });
  }

  // user data  from snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        firstname: snapshot['firstname'],
        lastname: snapshot['lastname'],
        email: snapshot['email'],
        balance: snapshot['balance'],
        sid: snapshot['sid'],
        active: snapshot['active'],
        vip: snapshot['vip'],
        id: snapshot['id'],
        invitecode: snapshot['invitecode'],
        refcode: snapshot['refcode'],
        isactivebounas: snapshot['isactivebounas']);
  }

  Stream<UserData> get AppuserData {
    return _userCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
  }
}
