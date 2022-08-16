import 'package:cashback/pages/sub%20pages/send_invite.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_five_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_four_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_three_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_two_tasks.dart';
import 'package:cashback/utility/task_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widget/custom_nav_bar.dart';
import '../../loader_page.dart';
import '../home_page_sub.dart';
import '../quetsion_page.dart';

class VipOneTasks extends StatefulWidget {
  const VipOneTasks({Key? key}) : super(key: key);

  @override
  _VipOneTasksState createState() => _VipOneTasksState();
}

class _VipOneTasksState extends State<VipOneTasks> {
  @override
  Widget build(BuildContext context) {
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
            double vip = double.parse(data['balance'].toString());
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
                                        color: Colors.white.withOpacity(0.25),
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
                              colors: [Color(0xff79fd7b), Color(0xff3dcd98)],
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
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 1.15,
                            color: const Color(0xff707070).withOpacity(0.28)),
                      ),
                    ),
                  ),
                  //
                  //
                  ///vip info
                  ///
                  ///

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            'VIP : 0 ',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.72),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'daily Tasks',
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'price',
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        '2 tasks  ',
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '  0.25',
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Monthly return : ',
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '15 USDT',
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ]),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    width: 413,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 1.15,
                            color: const Color(0xff707070).withOpacity(0.28)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    width: 413,
                    height: 270,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.15, color: Color(0xff79fd7b)),
                        top: BorderSide(width: 1.15, color: Color(0xff79fd7b)),
                      ),
                    ),
                    child: Container(
                      width: 413,
                      height: 60,
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          TaskCard(
                            price: '0.20',
                          ),
                          TaskCard(price: '0.20')
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //////// wns
              // Borrom bar

              floatingActionButton: Transform.scale(
                scale: 1,
                child: Transform.translate(
                  offset: Offset(0, 18),
                  child: GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
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
                            onPressed: () {
                              vip = double.parse(data['vip'].toString());
                              if (vip == 5) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VipFiveTasks()));
                              } else {
                                if (vip == 4) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VipFourTasks()));
                                } else {
                                  if (vip == 3) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const VipThreeTasks()));
                                  } else {
                                    if (vip == 2) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const VipTwoTasks()));
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const VipOneTasks()));
                                    }
                                  }
                                }
                              }
                            }),
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
