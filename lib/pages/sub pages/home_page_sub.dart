import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageSub extends StatefulWidget {
  const HomePageSub({Key? key}) : super(key: key);

  @override
  _HomePageSubState createState() => _HomePageSubState();
}

class _HomePageSubState extends State<HomePageSub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff202227),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "CashBack jo 💲",
                style: TextStyle(
                  fontSize: 32,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //  Balance section

            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    'icon/playstore.png',
                    scale: 0.99,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '20',
                              style: TextStyle(
                                  fontSize: 54,
                                  color: Color(0xffffffff).withOpacity(0.70),
                                  fontWeight: FontWeight.w200),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'USDT',
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white.withOpacity(0.7),
                                  fontFamily: 'SF Rounded',
                                  fontWeight: FontWeight.w200),
                            ),
                            Text(
                              'Your balance right now ',
                              style: TextStyle(
                                fontFamily: 'SF Rounded',
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0.72,
                                color: Colors.white.withOpacity(0.14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),

            // user box

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              width: 413,
              height: 106,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.15,
                  color: const Color(0xff707070).withOpacity(0.28),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            )
          ],
        ));
  }
}
