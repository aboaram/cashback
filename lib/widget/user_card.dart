import 'package:cashback/models/AppUser.dart';
import 'package:cashback/pages/loader_page.dart';
import 'package:cashback/service/database.dart';
import 'package:cashback/utility/buttons/my_button.dart';
import 'package:cashback/utility/buttons/my_button_two.dart';
import 'package:cashback/utility/my_button_three.dart';
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
                    Container(
                        width: 70,
                        height: 50,
                        child: Image.asset('icon/playstore.png')),
                    Text(userData!.firstname.toUpperCase(),
                        style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40)),
                    Text('ID: ' + userData.id.toString(),
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Text(
                      'SID: ' + userData.sid.toString(),
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.pinkAccent),
                      child: Text(
                        ' VIP : ' + userData.vip.toString() + " ",
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
                          'Balance : \$ ' + userData.balance.toString(),
                          style: GoogleFonts.salsa(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // invite button
                  MyButton(),
                  // team button
                  MyButtonTwo(),
                  // reports
                  MyButtonThree()
                ],
              )
              // cards !!!
            ]));
          } else {
            return LoaderPage();
          }
        });
  }
}
