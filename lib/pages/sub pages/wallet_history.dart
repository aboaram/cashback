import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../loader_page.dart';

class WalletHistory extends StatefulWidget {
  const WalletHistory({Key? key}) : super(key: key);

  @override
  _WalletHistoryState createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  @override
  Widget build(BuildContext context) {
    final Appuser = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    CollectionReference history =
        FirebaseFirestore.instance.collection('wallet_history');
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
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  'History',
                  style: TextStyle(
                    fontFamily: 'SF Rounded',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: const Color(0xff202227),
              body:
                  // user box

                  Column(children: [
                SizedBox(
                  width: 5,
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
                                  onDoubleTap: () {},
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
                  width: 25,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'balance',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'Team balance',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'Reward balance',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
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
                      Text(
                        '${balance}',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        data['teambalance'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        data['rewardbalance'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'weekly',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'monthly',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'last Mo',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
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
                      Text(
                        data['weeklyBalance'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        data['mounthlyBalance'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        data['lastmonthhbalance'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Team',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'vip team',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        'vip0',
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
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
                      Text(
                        data['team'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        data['vipteam'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Text(
                        data['normalteam'],
                        style: TextStyle(
                            fontFamily: 'SF Rounded',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'soon',
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.72),
                        ),
                      )),
                )
              ]),
            );
          } else {
            return LoaderPage();
          }
        });
  }
}

class ClipboardData {}
