import 'package:flutter/material.dart';

class SendInvite extends StatefulWidget {
  const SendInvite({Key? key}) : super(key: key);

  @override
  _SendInviteState createState() => _SendInviteState();
}

class _SendInviteState extends State<SendInvite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202227),
      body: Column(
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
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            width: 413,
            height: 106,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.15,
                  color: const Color(0xff707070).withOpacity(0.28)),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(children: [
              SizedBox(
                width: 15,
              ),
              Image.asset('icon/profilesircal.png'),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 2, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your name',
                      style: TextStyle(
                        fontFamily: 'SF Rounded',
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.account_box,
                          color: Colors.white.withOpacity(0.25),
                        ),
                        Text(
                          'ID: yout id is ',
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.25),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              //

              Container(
                width: 77,
                height: 29,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0.01, 0.13),
                    end: Alignment(0.97, 0.84),
                    colors: [Color(0xff79fd7b), Color(0xff3dcd98)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'VIP:',
                    style: TextStyle(
                      fontFamily: 'SF Rounded',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black.withOpacity(0.72),
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
