import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

class _SendInviteState extends State<SendInvite> {
  final _ReferalCodeController = TextEditingController();
  @override
  void dispose() {
    _ReferalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _firstPress = true;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    final user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder<UserData>(
        stream: FirestoreHelper(uid: user.uid).userDta,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
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
                  if (!isKeyboard)
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
                                userData!.name,
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
                                    'ID : ' + userData.id.toString(),
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
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    width: 413,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 1.15,
                            color: const Color(0xff707070).withOpacity(0.28)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "to shere your invite code with friends click in share button :",
                      style: TextStyle(
                        fontFamily: 'SF Rounded',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(160, 45),
                          textStyle: TextStyle(fontSize: 22),
                          primary: Color(0xff79fd7b),
                          onPrimary: Colors.white),
                      onPressed: () async {
                        final invitelinkdone = userData!.invitecode + 12;
                        final urlPreview = 'https://t.me/+-MUc693m9xAwODdh';
                        await Share.share('Hi 👋  use this code :' +
                            invitelinkdone.toString() +
                            "and you will get 5\$ gift \n cashback jo channel: \n $urlPreview");
                      },
                      child: Text('Share'),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    width: 413,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 1.15,
                            color: const Color(0xff707070).withOpacity(0.28)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'If you have invite code please insert it here : ',
                      style: TextStyle(
                        fontFamily: 'SF Rounded',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    enabled: userData!.isactivebounas,
                    controller: _ReferalCodeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Color(0xff79fd7b),
                      ),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30),
                      ),
                    )),
                  )
                ],
              ),

              // Borrm bar
              floatingActionButton: Transform.scale(
                scale: 1,
                child: Transform.translate(
                  offset: Offset(0, 18),
                  child: GestureDetector(
                    onTap: () {
                      print('FAB tapped');
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.5, 0),
                          end: Alignment(0.5, 1),
                          colors: [Color(0xff7afc79), Color(0xff3ccb97)],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 18,
                            color: Color(0xff7afc79).withOpacity(0.26),
                          )
                        ],
                      ),
                      child: Image.asset(
                        'icon/spark.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              //
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: ClipPath(
                  clipper: NavbarClipper(),
                  child: BottomAppBar(
                    elevation: 0,
                    color: Color(0xff3f4144).withOpacity(0.31),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.person_pin,
                              color: Colors.white.withOpacity(0.1),
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomePageSub()));
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.work,
                              color: Colors.white.withOpacity(0.1),
                              size: 30,
                            ),
                            onPressed: null),
                        //
                        SizedBox(
                          height: 80,
                          width: 60,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.question_mark,
                              color: Colors.white.withOpacity(0.1),
                              size: 30,
                            ),
                            onPressed: null),
                        IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.white.withOpacity(0.1),
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SendInvite()));
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              //
            );
          } else {
            return LoaderPage();
          }
        });
  }
}
