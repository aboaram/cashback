import 'package:flutter/material.dart';

class QuetsionPage extends StatefulWidget {
  const QuetsionPage({Key? key}) : super(key: key);

  @override
  _QuetsionPageState createState() => _QuetsionPageState();
}

class _QuetsionPageState extends State<QuetsionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff202227),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  "CashBack jo 💸 ",
                  style: TextStyle(
                    fontFamily: 'SF Rounded',
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
