import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/AppUser.dart';

class FirestoreHelper {
  final String uid;
  FirestoreHelper({required this.uid});

  Future creatUser(UserModel user) async {
    final CollectionReference userCollection =
    FirebaseFirestore.instance.collection('users');
    final docRef = userCollection.doc(uid);

    final newUser = UserModel(
        uid: user.uid,
        name: user.name,
        email: user.email,
        balance: user.balance,
        sid: user.sid,
        vip: user.vip,
        id: user.id,
        active: user.active,
        invitecode: user.invitecode,
        refcode: user.refcode,
        isactivebounas: user.isactivebounas,
        rewardbalance: user.rewardbalance,
        wallet: user.wallet,
        depositwallet: user.depositwallet,
        phone: user.phone,
        teambalance: user.teambalance,
        isthiswalletin: user.isthiswalletin,
        team: user.team,
        mounthlyBalance: user.mounthlyBalance,
        weeklyBalance: user.weeklyBalance,
        lastmonthhbalance: user.lastmonthhbalance,
        vipteam: user.vipteam,
        normalteam: user.normalteam,
        depositreq: user.depositreq,
        withdrawlreq: user.withdrawlreq,
        vipreq: user.vipreq,
        notficone: user.notficone,
        notfictwo: user.notfictwo,
        notficthree: user.notficthree)
        .toJson();
    try {
      await docRef.set(newUser);
    } catch (e) {
      print('some error happen $e');
    }

    Future updateInviteLink(invitemodel newinv) async {
      final invitecollection =
      FirebaseFirestore.instance.collection('invitecode');
      final invRef = invitecollection.doc();
      final newInvCode = invitemodel(
        invitecode: newinv.invitecode,
        id: newinv.invitecode,
      ).toJson();
      try {
        await invRef.set(newInvCode);
      } catch (e) {
        print('some error happen in invite code $e');
      }
    }
  }

  UserData _userData(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot['name'],
      email: snapshot['email'],
      balance: snapshot['balance'],
      sid: snapshot['sid'],
      vip: snapshot['vip'],
      id: snapshot['id'],
      active: snapshot['active'],
      invitecode: snapshot['invitecode'],
      refcode: snapshot['refcode'],
      isactivebounas: snapshot['isactivebounas'],
      rewardbalance: snapshot['rewardbalance'],
      wallet: snapshot['wallet'],
      depositwallet: snapshot['depositwallet'],
      phone: snapshot['phone'],
      teambalance: snapshot['teambalance'],
      isthiswalletin: snapshot['isthiswalletin'],
      team: snapshot['team'],
      mounthlyBalance: snapshot['mounthlyBalance'],
      weeklyBalance: snapshot['weeklyBalance'],
      lastmonthhbalance: snapshot['lastmonthhbalance'],
      vipteam: snapshot['vipteam'],
      normalteam: snapshot['normalteam'],
      vipreq: snapshot['vipreq'],
      withdrawlreq: snapshot['withdrawlreq'],
      depositreq: snapshot['depositreq'],
      notficone: snapshot['notficone'],
      notfictwo: snapshot['notfictwo'],
      notficthree: snapshot['notficthree'],
    );
  }

  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('users');

  Stream<UserData> get userDta {
    return userCollection.doc(uid).snapshots().map(_userData);
  }
}