import 'package:cashback/pages/loader_page.dart';
import 'package:cashback/pages/sub%20pages/deposit/deposite_page.dart';
import 'package:cashback/pages/sub%20pages/home_page_sub.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class VipList extends StatefulWidget {
  const VipList({Key? key}) : super(key: key);

  @override
  _VipListState createState() => _VipListState();
}

class _VipListState extends State<VipList> {
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

            return Scaffold(
              appBar: AppBar(backgroundColor: Colors.transparent),
              backgroundColor: const Color(0xff202227),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "CashBack jo 💸 ",
                        style: TextStyle(
                          fontFamily: 'SF Rounded',
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 45),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('you are about to buy vip 1'),
                                  content: Text('are you sure?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          if (balance >= 150) {
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({'vip': 1});
                                              }
                                            });
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({
                                                  'balance': balance - 150
                                                });
                                              }
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePageSub()));
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const DepositePage()));
                                                                },
                                                                child: Text(
                                                                    'recharge account'))
                                                          ],
                                                          title: Text(
                                                              'you dont have the price of vip 1'),
                                                          content: Text(
                                                              'your balance now ${data['balance']} \n recharge your account'),
                                                        ));
                                          }
                                        },
                                        child: Text('sure'))
                                  ],
                                ));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 413,
                        height: 160,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.01, 0.13),
                            end: Alignment(0.97, 0.84),
                            colors: [Color(0xff79fd7b), Color(0xff3dcd98)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vip 1: ',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '150usdt',
                              style: TextStyle(
                                fontFamily: 'SF Rounded',
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Daily tasks',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'task price',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'monthly return',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Center(
                                    child: Text(
                                      ' 5',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Center(
                                    child: Text(
                                      '1.1',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Center(
                                    child: Text(
                                      '165',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (() {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('you are about to buy vip 2'),
                                  content: Text('are you sure?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          if (balance >= 400) {
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({'vip': 2});
                                              }
                                            });
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({
                                                  'balance': balance - 400
                                                });
                                              }
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePageSub()));
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const DepositePage()));
                                                                },
                                                                child: Text(
                                                                    'recharge account'))
                                                          ],
                                                          title: Text(
                                                              'you dont have the price of vip 2'),
                                                          content: Text(
                                                              'your balance now ${data['balance']} \n recharge your account'),
                                                        ));
                                          }
                                        },
                                        child: Text('sure'))
                                  ],
                                ));
                      }),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 413,
                        height: 160,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.01, 0.13),
                            end: Alignment(0.97, 0.84),
                            colors: [
                              Color.fromARGB(255, 245, 166, 49),
                              Color.fromARGB(255, 230, 109, 109)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vip 2: ',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '400usdt',
                              style: TextStyle(
                                fontFamily: 'SF Rounded',
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Daily tasks',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'task price',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'monthly return',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Center(
                                    child: Text(
                                      ' 8',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Center(
                                    child: Text(
                                      '480',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center()
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (() {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('you are about to buy vip 3'),
                                  content: Text('are you sure?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          if (balance >= 1200) {
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({'vip': 3});
                                              }
                                            });
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({
                                                  'balance': balance - 1200
                                                });
                                              }
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePageSub()));
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const DepositePage()));
                                                                },
                                                                child: Text(
                                                                    'recharge account'))
                                                          ],
                                                          title: Text(
                                                              'you dont have the price of vip 1'),
                                                          content: Text(
                                                              'your balance now ${data['balance']} \n recharge your account'),
                                                        ));
                                          }
                                        },
                                        child: Text('sure'))
                                  ],
                                ));
                      }),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 413,
                        height: 160,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.01, 0.13),
                            end: Alignment(0.97, 0.84),
                            colors: [
                              Color.fromARGB(255, 68, 136, 214),
                              Color.fromARGB(255, 203, 207, 206)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vip 3: ',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '1200usdt',
                              style: TextStyle(
                                fontFamily: 'SF Rounded',
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Daily tasks',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'task price',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'monthly return',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Center(
                                    child: Text(
                                      ' 18',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Center(
                                    child: Text(
                                      '2.8',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Center(
                                    child: Text(
                                      '1512',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center()
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('you are about to buy vip 1'),
                                  content: Text('are you sure?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          if (balance >= 2500) {
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({'vip': 4});
                                              }
                                            });
                                            FirebaseAuth.instance
                                                .authStateChanges()
                                                .listen((User? user) async {
                                              if (user != null) {
                                                final Appuser = FirebaseAuth
                                                    .instance.currentUser;
                                                await FirebaseFirestore.instance
                                                    .collection('users')
                                                    .doc(Appuser!.uid)
                                                    .update({
                                                  'balance': balance - 2500
                                                });
                                              }
                                            });
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePageSub()));
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (context) => AlertDialog(
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              const DepositePage()));
                                                                },
                                                                child: Text(
                                                                    'recharge account'))
                                                          ],
                                                          title: Text(
                                                              'you dont have the price of vip 4'),
                                                          content: Text(
                                                              'your balance now ${data['balance']} \n recharge your account'),
                                                        ));
                                          }
                                        },
                                        child: Text('sure'))
                                  ],
                                ));
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: 413,
                        height: 160,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.01, 0.13),
                            end: Alignment(0.97, 0.84),
                            colors: [
                              Color.fromARGB(255, 212, 15, 230),
                              Color.fromARGB(255, 233, 187, 229)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(children: [
                          Row(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Vip 4: ',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '2500usdt',
                              style: TextStyle(
                                fontFamily: 'SF Rounded',
                                fontSize: 26,
                                color: Colors.white,
                              ),
                            )
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Daily tasks',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'task price',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'monthly return',
                                  style: TextStyle(
                                    fontFamily: 'SF Rounded',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Center(
                                    child: Text(
                                      ' 32',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Center(
                                    child: Text(
                                      '3.5',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Center(
                                    child: Text(
                                      '3360',
                                      style: TextStyle(
                                        fontFamily: 'SF Rounded',
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Center()
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      width: 413,
                      height: 160,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.01, 0.13),
                          end: Alignment(0.97, 0.84),
                          colors: [
                            Color.fromARGB(255, 231, 255, 16),
                            Color.fromARGB(255, 247, 196, 196)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(children: [
                        Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Vip 5: ',
                              style: TextStyle(
                                fontFamily: 'SF Rounded',
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '5000usdt',
                            style: TextStyle(
                              fontFamily: 'SF Rounded',
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          )
                        ]),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Daily tasks',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'task price',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'monthly return',
                                style: TextStyle(
                                  fontFamily: 'SF Rounded',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Center(
                                  child: Text(
                                    'soon',
                                    style: TextStyle(
                                      fontFamily: 'SF Rounded',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Center(
                                  child: Text(
                                    'soon',
                                    style: TextStyle(
                                      fontFamily: 'SF Rounded',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Center(
                                  child: Text(
                                    '7500',
                                    style: TextStyle(
                                      fontFamily: 'SF Rounded',
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center()
                      ]),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return LoaderPage();
          }
        });
  }
}
