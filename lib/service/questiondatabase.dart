import 'package:cashback/models/question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestiondService {
  final CollectionReference _questionCollection =
      FirebaseFirestore.instance.collection('question');

  // question data from snapshot
  questionData _questionDataFromSnapShot(DocumentSnapshot snapshot) {
    return questionData(
        questionname: snapshot['questionname'],
        questionsubtitle: snapshot['questionsubtitle'],
        questionansur: snapshot['questionanur']);
  }

  Stream<questionData> get AppquestionData {
    return _questionCollection.doc().snapshots().map(_questionDataFromSnapShot);
  }
}
