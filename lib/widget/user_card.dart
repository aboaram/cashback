import 'package:cashback/models/AppUser.dart';

import 'package:cashback/pages/loader_page.dart';

import 'package:cashback/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).AppuserData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return SafeArea(
                child: Column(children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  padding: EdgeInsets.all(40),
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(colors: [
                        Colors.greenAccent,
                        Color.fromARGB(255, 231, 150, 245)
                      ])),
                  child: Column(children: [
                    Text(userData!.firstname.toUpperCase(),
                        style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 60)),
                    Text('ID: ' + userData.id,
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Text('SID: ' + userData.sid,
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 15,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.amber),
                      child: Text(
                        ' VIP : ' + userData.vip + " ",
                        style: GoogleFonts.salsa(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Balance : \$ ' + userData.balance,
                          style: GoogleFonts.salsa(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                        Text(
                          'Team M : ' + userData.team,
                          style: GoogleFonts.salsa(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ],
                    )
                  ]),
                ),
              )
              // cards !!!
            ]));
          } else {
            return LoaderPage();
          }
        });
  }
}
