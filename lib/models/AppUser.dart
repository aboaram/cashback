class Appuser {
  final String uid;
  Appuser({required this.uid});
}

class UserData {
  final String firstname;
  final int balance;
  final int sid;
  final int vip;
  final String uid;
  final int id;
  final String active;
  final int invitecode;
  final String refcode;

  UserData(
      {required this.firstname,
      required this.balance,
      required this.sid,
      required this.uid,
      required this.vip,
      required this.id,
      required this.active,
      required this.invitecode,
      required this.refcode});
}
