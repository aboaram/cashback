class Appuser {
  final String uid;
  Appuser({required this.uid});
}

class UserData {
  final String firstname;
  final String balance;
  final String sid;
  final String team;
  final String vip;
  final String uid;
  final String id;

  UserData(
      {required this.firstname,
      required this.balance,
      required this.sid,
      required this.team,
      required this.uid,
      required this.vip,
      required this.id});
}
