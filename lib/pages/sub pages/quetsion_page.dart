import 'package:cashback/models/question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuetsionPage extends StatefulWidget {
  const QuetsionPage({Key? key}) : super(key: key);

  @override
  _QuetsionPageState createState() => _QuetsionPageState();
}

class _QuetsionPageState extends State<QuetsionPage> {
  List<Object> _questiononeList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _questiononeList.length,
          itemBuilder: (context, index) {
            return Text('$index');
          },
        ),
      ),
    );
  }

  Future getQusetionListone() async {
    var dataOne = await FirebaseFirestore.instance.collection('question').get();

    setState(() {
      _questiononeList = List.from(
          dataOne.docs.map((docOne) => questionData.fromSnapshot(docOne)));
    });
  }
}
