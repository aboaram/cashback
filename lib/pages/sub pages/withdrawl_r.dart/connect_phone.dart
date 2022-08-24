import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';

class ConnectPhone extends StatefulWidget {
  const ConnectPhone({Key? key}) : super(key: key);

  @override
  _ConnectPhoneState createState() => _ConnectPhoneState();
}

final phone = TextEditingController();

@override
//todo
void dispose() {
  phone.dispose();
}

class _ConnectPhoneState extends State<ConnectPhone> {
  bool showFirst = true;
  bool showSec = true;
  bool shownex = false;
  bool showlabel = false;
  bool firsttalk = true;
  bool secoundtalk = false;
  bool thirdtalk = false;
  bool showafternext = false;
  bool fourtalk = false;
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: Color.fromRGBO(23, 21, 35, 255),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 60,
          ),
          Visibility(
            visible: firsttalk,
            child: Center(
                child: Text(
              'Opps!! \n you are not avtive yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(229, 230, 232, 255),
                fontFamily: 'SF Rounded',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
          ),
          Visibility(
            visible: secoundtalk,
            child: Center(
                child: Text(
              'okay \n space man need  your phone nubmer to active your account\n okay ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(229, 230, 232, 255),
                fontFamily: 'SF Rounded',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
          ),
          Visibility(
            visible: thirdtalk,
            child: Center(
                child: Text(
              'Fact! \n space man System need 24H to active user under vip3 \n when i finsh from activate your account\n i will send active code use one time only to your phone number ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(229, 230, 232, 255),
                fontFamily: 'SF Rounded',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )),
          ),
          Visibility(
            visible: fourtalk,
            child: Center(
                child: Text(
              'Okay!! \n now all what you need to do is back to home page and wait the sms ! ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(229, 230, 232, 255),
                fontFamily: 'SF Rounded',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
          ),
          Container(
            child: Image.asset('icon/spaceman.png'),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 50,
              width: 100,
              child: Visibility(
                visible: firsttalk,
                child: GestureDetector(
                  onTap: (() {
                    setState(() {
                      firsttalk = !firsttalk;

                      secoundtalk = !secoundtalk;
                      shownex = !shownex;
                    });
                  }),
                  child: Container(
                    child: Center(
                      child: Text(
                        'okay',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Rounded',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    color: Color.fromARGB(229, 230, 232, 255),
                  ),
                ),
              )),
          SizedBox(
              height: 50,
              width: 100,
              child: Visibility(
                visible: shownex,
                child: GestureDetector(
                  onTap: (() {
                    setState(() {
                      secoundtalk = !secoundtalk;
                      thirdtalk = !thirdtalk;
                      showlabel = !showlabel;
                      shownex = !shownex;
                    });
                  }),
                  child: Container(
                    child: Center(
                      child: Text(
                        'NEXT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SF Rounded',
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    color: Color.fromARGB(229, 230, 232, 255),
                  ),
                ),
              )),
          Visibility(
            visible: showlabel,
            child: SizedBox(
              height: 60,
              width: 340,
              child: TextField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () async {
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) async {
                          if (user != null) {
                            final Appuser = FirebaseAuth.instance.currentUser;
                            await FirebaseFirestore.instance
                                .collection('withdrawl activate')
                                .doc(Appuser!.uid)
                                .set({'withdrawl': phone.text.trim()});
                          }
                        });
                        FirebaseAuth.instance
                            .authStateChanges()
                            .listen((User? user) async {
                          if (user != null) {
                            final Appuser = FirebaseAuth.instance.currentUser;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(Appuser!.uid)
                                .update({'phone': phone.text.trim()});
                          }
                        });

                        setState(() {
                          thirdtalk = !thirdtalk;
                          showlabel = !showlabel;
                          fourtalk = !fourtalk;
                        });
                      },
                    ),
                    labelText: 'phone ',
                    filled: true,
                    fillColor: Color.fromARGB(229, 230, 232, 255),
                    hintText: 'Enter your phone number ....',
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          Visibility(
            visible: click,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    showFirst = true;
                    showSec = true;
                    shownex = false;
                    showlabel = false;
                    firsttalk = true;
                    secoundtalk = false;
                    thirdtalk = false;
                    showafternext = false;
                    fourtalk = false;
                    click = false;
                  });
                },
                child: LikeButton()),
          )
        ]),
      ),
    );
  }
}
