import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String price;

  const TaskCard({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Image.asset('icon/fc.png'),
          SizedBox(
            width: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 2, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    //name
                    'Facebook',
                    style: TextStyle(
                      fontFamily: 'SF Rounded',
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    // id copied

                    RichText(
                      text: TextSpan(
                          text: '0.2   ',
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.25),
                          ),
                          children: <TextSpan>[
                            (TextSpan(
                                text: 'USDT',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 16,
                                  color: Color(0xff79fd7b),
                                )))
                          ]),
                    ),
                  ]),
                ],
              ))
        ],
      ),
    );
  }
}
