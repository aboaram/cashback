import 'package:cloud_firestore/cloud_firestore.dart';

class Appuser {
  final String uid;
  Appuser({required this.uid});
}

class UserModel {
  final String uid;
  final String name;
  final String email;
  final double balance;
  final int sid;
  final int vip;
  final int id;
  final bool active;
  final int invitecode;
  final int refcode;
  final bool isactivebounas;
  final double rewardbalance;
  final String wallet;
  final String depositwallet;
  final int phone;
  final double teambalance;
  final bool isthiswalletin;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.balance,
      required this.sid,
      required this.vip,
      required this.id,
      required this.active,
      required this.invitecode,
      required this.refcode,
      required this.isactivebounas,
      required this.rewardbalance,
      required this.wallet,
      required this.depositwallet,
      required this.phone,
      required this.teambalance,
      required this.isthiswalletin});

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        uid: snapshot['uid'],
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
        isthiswalletin: snapshot['isthiswalletin']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'balance': balance,
        'sid': sid,
        'vip': vip,
        'id': id,
        'active': active,
        'invitecode': invitecode,
        'refcode': refcode,
        'isactivebounas': isactivebounas,
        'rewardbalance': rewardbalance,
        'wallet': wallet,
        'depositwallet': depositwallet,
        'phone': phone,
        'teambalance': teambalance,
        'isthiswalletin': isthiswalletin
      };
}

class invitemodel {
  final int? invitecode;
  final int? id;
  invitemodel({this.invitecode, this.id});

  factory invitemodel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return invitemodel(invitecode: snapshot['invitecode'], id: snapshot['id']);
  }
  Map<String, dynamic> toJson() => {'invitecode': invitecode, 'id': id};
}

class UserData {
  final String name;
  final String email;
  final double balance;
  final int sid;
  final int vip;
  final String uid;
  final int id;
  final String active;
  final int invitecode;
  final int refcode;
  final bool isactivebounas;
  final double rewardbalance;
  final String wallet;
  final String depositwallet;
  final int phone;
  final double teambalance;
  final bool isthiswalletin;

  UserData({
    required this.name,
    required this.email,
    required this.balance,
    required this.sid,
    required this.uid,
    required this.vip,
    required this.id,
    required this.active,
    required this.invitecode,
    required this.refcode,
    required this.isactivebounas,
    required this.rewardbalance,
    required this.wallet,
    required this.depositwallet,
    required this.phone,
    required this.teambalance,
    required this.isthiswalletin,
  });
}

class vipModel {}
