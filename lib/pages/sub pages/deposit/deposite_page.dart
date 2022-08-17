import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';

class DepositePage extends StatefulWidget {
  const DepositePage({Key? key}) : super(key: key);

  @override
  _DepositePageState createState() => _DepositePageState();
}

final wallet = TextEditingController();

@override
//todo
void dispose() {
  wallet.dispose();
}

class _DepositePageState extends State<DepositePage> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Visibility(
              visible: firsttalk,
              child: Center(
                  child: Text(
                'Tell space man!! \n how much you want to deposit ?',
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
                'Cool \n space man coppied the wallet addres to your clipboard\n click next!',
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
                'Fact! \n space man System for cashback App have\n his own payment gateaway\n and dont use any company payment system\n now i need from you to complet your trasfer to input \n your deposit addres!',
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
                'Okay!! \n we update your deposite addres and wating for your payment now ',
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
            Column(children: [
              Visibility(
                visible: showFirst,
                child: SizedBox(
                  height: 60,
                  width: 340,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 100,
                            child: Visibility(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    firsttalk = !firsttalk;
                                    secoundtalk = !secoundtalk;
                                    showFirst = !showFirst;
                                    showSec = !showSec;
                                    shownex = !shownex;
                                  });

                                  Clipboard.setData(ClipboardData(
                                          text:
                                              'TREmatgrYaXtgFfuWffGrgYLQ3ZRZSyggg'))
                                      .then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Wallet addres copied to clipboard'),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '150\$',
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
                              child: GestureDetector(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '400\$',
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
                              child: GestureDetector(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '1200\$',
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
                      ],
                    ),
                  ),
                ),
              ),
            ]),
            Column(children: [
              Visibility(
                visible: showSec,
                child: SizedBox(
                  height: 60,
                  width: 340,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 100,
                            child: Visibility(
                              child: GestureDetector(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '2500\$',
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
                              child: GestureDetector(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '5000\$',
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
                      ],
                    ),
                  ),
                ),
              ),
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
                    controller: wallet,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () async {
                            FirebaseAuth.instance
                                .authStateChanges()
                                .listen((User? user) async {
                              if (user != null) {
                                for (final providerProfile
                                    in user.providerData) {
                                  final uid = providerProfile.uid;
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(uid)
                                      .set({
                                    'depositwallet': wallet.text.trim()
                                  });
                                }
                              }
                            });

                            setState(() {
                              thirdtalk = !thirdtalk;
                              showlabel = !showlabel;
                              fourtalk = !fourtalk;
                              click = !click;
                            });
                          },
                        ),
                        labelText: 'wallet ',
                        filled: true,
                        fillColor: Color.fromARGB(229, 230, 232, 255),
                        hintText: 'Enter your wallet ....',
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
                      child: LikeButton()))
            ]),
          ],
        ),
      ),
    );
  }
}
