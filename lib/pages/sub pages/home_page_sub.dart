import 'package:cashback/pages/loader_page.dart';
import 'package:cashback/pages/sub%20pages/quetsion_page.dart';
import 'package:cashback/pages/sub%20pages/send_invite.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import '../../models/AppUser.dart';
import '../../service/database.dart';
import '../../widget/custom_nav_bar.dart';

class HomePageSub extends StatefulWidget {
  const HomePageSub({Key? key}) : super(key: key);

  @override
  _HomePageSubState createState() => _HomePageSubState();
}

class _HomePageSubState extends State<HomePageSub> {
  // user from aut

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).AppuserData,
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

                  //  Balance section

                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'icon/lightning.png',
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
                                    userData!.balance.toString(),
                                    style: TextStyle(
                                        fontSize: 54,
                                        color:
                                            Color(0xffffffff).withOpacity(0.70),
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
                                userData.firstname + ' ' + userData.lastname,
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
                              colors: [Color(0xff79fd7b), Color(0xff3dcd98)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'VIP : ' + userData.vip.toString(),
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
                            color: const Color(0xff707070).withOpacity(0.28)),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // first button

                          GestureDetector(
                            child: Container(
                              width: 90,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.01, 0.13),
                                  end: Alignment(0.97, 0.84),
                                  colors: [
                                    Color(0xff79fd7b),
                                    Color(0xff3dcd98)
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 18,
                                    color: Color(0xff7afc79).withOpacity(0.26),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Deposit',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.92),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // secound button
                          GestureDetector(
                            child: Container(
                              width: 120,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.01, 0.13),
                                  end: Alignment(0.97, 0.84),
                                  colors: [
                                    Color(0xff79fd7b),
                                    Color(0xff3dcd98)
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 18,
                                    color: Color(0xff7afc79).withOpacity(0.26),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Withdrawal',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.92),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //third button

                          GestureDetector(
                            child: Container(
                              width: 90,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.01, 0.13),
                                  end: Alignment(0.97, 0.84),
                                  colors: [
                                    Color(0xff79fd7b),
                                    Color(0xff3dcd98)
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 18,
                                    color: Color(0xff7afc79).withOpacity(0.26),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'History',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white.withOpacity(0.92),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                  Center(
                    child: Text(
                      'be sure to invita as mush as you can frinds to your team\n        and you will get rewarded for ther works',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.80,
                        color: Colors.white.withOpacity(0.30),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [LikeButton()],
                                    backgroundColor: const Color(0xff202227),
                                    elevation: 24.5,
                                    title: Center(
                                      child: Text(
                                        'Sorry !!',
                                        style: TextStyle(
                                          fontFamily: 'SF Rounded',
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    content: Center(
                                      child: Text(
                                        ' Team sheet not available ,You need to wait for next update to get the cheat inside the app.\n if you want to get the sheet , contact with Support in telegram group',
                                        style: TextStyle(
                                          fontFamily: 'SF Rounded',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            'Team',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          'Reward',
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '0 ',
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ]),
                      Row(
                        children: [
                          Icon(
                            Icons.upcoming,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),

              // Borrom bar
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuetsionPage()));
                            }),
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
