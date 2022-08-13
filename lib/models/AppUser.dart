class Appuser {
  final String uid;
  Appuser({required this.uid});
}

class UserData {
  final String firstname;
  final String lastname;
  final String email;
  final int balance;
  final int sid;
  final int vip;
  final String uid;
  final int id;
  final String active;
  final int invitecode;
  final int refcode;
  final bool isactivebounas;

  UserData(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.balance,
      required this.sid,
      required this.uid,
      required this.vip,
      required this.id,
      required this.active,
      required this.invitecode,
      required this.refcode,
      required this.isactivebounas});
}
