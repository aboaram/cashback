import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/AppUser.dart';

import '../../service/firebase_helper.dart';
import '../../widget/custom_nav_bar.dart';
import '../loader_page.dart';
import 'home_page_sub.dart';

class SendInvite extends StatefulWidget {
  const SendInvite({Key? key}) : super(key: key);

  @override
  _SendInviteState createState() => _SendInviteState();
}

final refcode = TextEditingController();

@override
//todo
void dispose() {
  refcode.dispose();
}

class _SendInviteState extends State<SendInvite> {
  final _ReferalCodeController = TextEditingController();
  @override
  void dispose() {
    _ReferalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool firstpress = true;
    bool nexr = false;
    bool thied = false;
    bool r;

    final Appuser = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(Appuser!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // double
            double balance = double.parse(data['balance'].toString());
            double teambalance = double.parse(data['teambalance'].toString());
            double rewardbalance =
                double.parse(data['rewardbalance'].toString());
            double allbalance = balance + teambalance + rewardbalance;
            double vip = double.parse(data['vip'].toString());

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

                      //  Balance section

                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            /// secreat room
                            GestureDetector(
                              child: Image.asset(
                                'icon/lightning.png',
                                scale: 0.99,
                              ),
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
                                        allbalance.toString(),
                                        // userData!.name.toString(),
                                        style: TextStyle(
                                            fontSize: 54,
                                            color: Color(0xffffffff)
                                                .withOpacity(0.70),
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
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontFamily: 'SF Rounded',
                                            fontWeight: FontWeight.w200),
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'your balnce now',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0.72,
                                      color: Colors.white.withOpacity(0.11),
                                    ),
                                  )
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
                        child: Row(
                          children: [
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
                                    //name
                                    data['name'],
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

                                      // id copied

                                      GestureDetector(
                                        onDoubleTap: () {
                                          Clipboard.setData(ClipboardData(
                                                  text: data['id'].toString()))
                                              .then((_) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'your Id number copied to clipboard'),
                                            ));
                                          });
                                        },
                                        child: Text(
                                          'ID :  ${data['id']} ',
                                          style: TextStyle(
                                            fontFamily: 'SF Rounded',
                                            fontSize: 16,
                                            color:
                                                Colors.white.withOpacity(0.25),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
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
                                  colors: [
                                    Color(0xff79fd7b),
                                    Color(0xff3dcd98)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'VIP : ${data['vip']} ',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.72),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 413,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 1.15,
                                color:
                                    const Color(0xff707070).withOpacity(0.28)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.message,
                                color: Colors.white.withOpacity(0.25),
                                size: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Your invaite code is :',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.25),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 60,
                          width: 340,
                          child: GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                      text:
                                          ' your invite code is : ${data['invitecode'].toString()} \ vp activate is  ${data['id']}'))
                                  .then((_) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      'your invite code copied to clipboard'),
                                ));
                              });
                            },
                            child: TextField(
                              enabled: false,
                              //
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: data['invitecode'].toString(),
                                  filled: true,
                                  fillColor: Color.fromARGB(229, 230, 232, 255),
                                  hintText: '',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            );
          } else {
            return LoaderPage();
          }
        });
  }
}
