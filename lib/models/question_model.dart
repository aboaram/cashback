class questionData {
  String? questionname;
  String? questionsubtitle;
  String? questionansur;

  questionData();

  Map<String, dynamic> tojson() => {
        'questionname': questionname,
        'questionsubtitle': questionsubtitle,
        'questionansur': questionansur
      };

  questionData.fromSnapshot(snapshot)
      : questionname = snapshot.data()['questionname'],
        questionsubtitle = snapshot.data()['questionsubtitle'],
        questionansur = snapshot.data()['questionansur'];
}
