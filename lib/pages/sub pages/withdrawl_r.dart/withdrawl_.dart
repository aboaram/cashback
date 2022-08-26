import 'package:cashback/pages/loader_page.dart';
import 'package:cashback/pages/sub%20pages/send_invite.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_five_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_one_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_three_tasks.dart';
import 'package:cashback/pages/sub%20pages/vip_tasks_pages/vip_two_tasks.dart';
import 'package:cashback/pages/sub%20pages/withdrawl_r.dart/withdrawl_history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../widget/custom_nav_bar.dart';
import '../home_page_sub.dart';
import '../quetsion_page.dart';
import '../vip_tasks_pages/vip_four_tasks.dart';

class Withdrawl extends StatefulWidget {
  const Withdrawl({Key? key}) : super(key: key);

  @override
  _WithdrawlState createState() => _WithdrawlState();
}

final wallet = TextEditingController();
final walletbalance = TextEditingController();

@override
//todo
void dispose() {
  wallet.dispose();
}

class _WithdrawlState extends State<Withdrawl> {
  //if not active
  bool showfirst = false;

  //if not have 10$
  bool showsec = false;

  //if all good
  bool showthird = false;

  bool showfour = false;

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
            double vip = double.parse(data['vip'].toString());
            bool active = data['active'];

            return Scaffold(
              backgroundColor: const Color(0xff202227),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
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
                        height: 5,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 1.15,
                                color:
                                    const Color(0xff707070).withOpacity(0.28)),
                          ),
                        ),
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Text(
                                'Balance',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              'Reward',
                              style: TextStyle(
                                fontFamily: 'SF Rounded',
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Text(
                                (balance + rewardbalance).toString(),
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              teambalance.toString(),
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

                      SizedBox(
                        height: 10,
                      ),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (active == false) {
                                    setState(() {
                                      showfirst = !showfirst;
                                    });
                                  } else {
                                    if (balance < 10) {
                                      setState(() {
                                        showsec = !showsec;
                                      });
                                    } else {
                                      setState(() {
                                        showthird = !showthird;
                                      });
                                    }
                                  }
                                },
                                child: Text('Withdrawl')),
                            ElevatedButton(
                                onPressed: () {
                                  FirebaseAuth.instance
                                      .authStateChanges()
                                      .listen((User? user) async {
                                    if (user != null) {
                                      final Appuser =
                                          FirebaseAuth.instance.currentUser;
                                      await FirebaseFirestore.instance
                                          .collection('teamrewardbalance')
                                          .doc(Appuser!.uid)
                                          .update(
                                              {'wallet': wallet.text.trim()});
                                    }
                                  });
                                  FirebaseAuth.instance
                                      .authStateChanges()
                                      .listen((User? user) async {
                                    if (user != null) {
                                      final Appuser =
                                          FirebaseAuth.instance.currentUser;
                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(Appuser!.uid)
                                          .update({'withdrawlreq': 'wating'});
                                    }
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Container(
                                            height: 200,
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Center(
                                                    child: Icon(
                                                      Icons.wallet,
                                                      color: Colors.greenAccent,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Center(
                                                      child: Text(
                                                    'Team reward Withdrawl success',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                        'don\'t forget you can ask for your team reward once every month '),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Text('Withdrawl')),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Withdrawl History',
                          style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WithdrawlHistory()));
                              },
                              child: Text('History'))),

                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 413,
                        height: 5,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 1.15,
                                color:
                                    const Color(0xff707070).withOpacity(0.28)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Visibility(
                            visible: showfirst,
                            child: Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                'Opps!! \nYour account not active yet from space man,\n try again latar')),
                      ),
                      Center(
                        child: Visibility(
                          visible: showfirst,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showfirst = !showfirst;
                                });
                              },
                              child: Text('Okay')),
                        ),
                        //second
                      ),
                      Center(
                        child: Visibility(
                            visible: showsec,
                            child: Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                'Opps!! \n Minimum withdrawal = 10 usdt,\n your balance: $balance\n try again later')),
                      ),
                      Center(
                        child: Visibility(
                          visible: showsec,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  showsec = !showsec;
                                });
                              },
                              child: Text('Okay')),
                        ),
                      ),
                      Center(
                        child: Visibility(
                          visible: showthird,
                          child: SizedBox(
                            height: 65,
                            width: 340,
                            child: TextField(
                              controller: wallet,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  labelText: 'wallet ',
                                  filled: true,
                                  fillColor: Color.fromARGB(229, 230, 232, 255),
                                  hintText: 'Enter your wallet ....',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Visibility(
                          visible: showthird,
                          child: SizedBox(
                            height: 65,
                            width: 340,
                            child: TextField(
                              controller: walletbalance,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.send),
                                    onPressed: () async {
                                      FirebaseAuth.instance
                                          .authStateChanges()
                                          .listen((User? user) async {
                                        if (user != null) {
                                          final Appuser =
                                              FirebaseAuth.instance.currentUser;
                                          await FirebaseFirestore.instance
                                              .collection('withdrawlRequast')
                                              .doc(Appuser!.uid)
                                              .set({
                                            'wallet': wallet.text.trim(),
                                            'walletbalance':
                                                walletbalance.text.trim()
                                          });
                                        }
                                      });
                                      FirebaseAuth.instance
                                          .authStateChanges()
                                          .listen((User? user) async {
                                        if (user != null) {
                                          final Appuser =
                                              FirebaseAuth.instance.currentUser;
                                          await FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(Appuser!.uid)
                                              .update({
                                            'wallet': wallet.text.trim()
                                          });
                                        }
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              child: Container(
                                                height: 200,
                                                child: Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Center(
                                                        child: Icon(
                                                          Icons.wallet,
                                                          color: Colors
                                                              .greenAccent,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      Center(
                                                          child: Text(
                                                        'Withdrawl success',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      Center(
                                                        child: Text(
                                                            'your withdrawl request has been complet,\n Expect the withdrawl to reach your wallet within 24 hours'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });

                                      setState(() {
                                        showfour = !showfour;
                                      });
                                    },
                                  ),
                                  labelText: 'balance ',
                                  filled: true,
                                  fillColor: Color.fromARGB(229, 230, 232, 255),
                                  hintText:
                                      'how much you want to withdrawl ....',
                                  border: OutlineInputBorder()),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 413,
                        height: 5,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                width: 1.15,
                                color:
                                    const Color(0xff707070).withOpacity(0.28)),
                          ),
                        ),
                      ),
                    ]),
              ),

              floatingActionButton: Transform.scale(
                scale: 1,
                child: Transform.translate(
                  offset: Offset(0, 18),
                  child: GestureDetector(
                    // onTap: () {
                    // Navigator.push(
                    //   context,
                    //     MaterialPageRoute(
                    //        builder: (context) => const VipsPage()));
                    // },
                    onLongPress: () {
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VipOneTasks(
                                      vip: vip,
                                    ),
                                  ));
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
            );
          } else {
            return LoaderPage();
          }
        });
  }
}
