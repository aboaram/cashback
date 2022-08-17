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
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: Color.fromRGBO(23, 21, 35, 255),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 190,
                ),
                Container(
                  height: 100,
                  width: 350,
                  child: FittedBox(
                    child: Image.asset(
                      'icon/elians.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  alignment: Alignment.center,
                ),
                Center(
                  child: Text(
                    'Opps!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(229, 230, 232, 255),
                      fontFamily: 'SF Rounded',
                      fontWeight: FontWeight.bold,
                      fontSize: 33,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'There is Nothing to help you with right now. \n come back latter if you have any questin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(229, 230, 232, 255),
                      fontFamily: 'SF Rounded',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
