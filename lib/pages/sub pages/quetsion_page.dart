import 'package:cashback/pages/loader_page.dart';
import 'package:flutter/material.dart';
import 'package:cashback/service/questiondatabase.dart';

import '../../models/question_model.dart';

class QuetsionPage extends StatefulWidget {
  const QuetsionPage({Key? key}) : super(key: key);

  @override
  _QuetsionPageState createState() => _QuetsionPageState();
}

class _QuetsionPageState extends State<QuetsionPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<questionData>(
      stream: QuestiondService().AppquestionData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          questionData? qData = snapshot.data;
          return Scaffold(
            backgroundColor: const Color(0xff202227),
          );
        } else {
          return LoaderPage();
        }
      },
    );
  }
}
