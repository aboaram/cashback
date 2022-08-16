import 'package:cashback/pages/loader_page.dart';
import 'package:cashback/pages/sub%20pages/withdrawl_r.dart/withdrawl_.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'connect_phone.dart';

class WithdrawlRoot extends StatefulWidget {
  const WithdrawlRoot({Key? key}) : super(key: key);

  @override
  _WithdrawlRootState createState() => _WithdrawlRootState();
}

class _WithdrawlRootState extends State<WithdrawlRoot> {
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
          if (data['phone'] == 0) {
            return ConnectPhone();
          } else {
            return Withdrawl();
          }
        } else {
          return LoaderPage();
        }
      },
    );
  }
}
