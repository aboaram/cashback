import 'package:cashback/models/AppUser.dart';
import 'package:cashback/pages/Login_page.dart';
import 'package:cashback/pages/forgot_pw_page.dart';
import 'package:cashback/pages/register_page.dart';
import 'package:cashback/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  String _Vip = "0";
  String _user_Name = 'yazan';
  String _user_Balance = '50';
  String _user_Team = '0';
  String _user_Id = '000252';
  String _user_Sid = '110011';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
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
                      borderRadius: BorderRadius.circular(12),
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
                    Text('ID: ' + _user_Id,
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 10,
                        )),
                    Text('SID: ' + _user_Sid,
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 10,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Row(children: [
                      Text(
                        'Balance: ',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$' + _user_Balance,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VIP: ' + _Vip,
                          style: GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text('Team M: ' + _user_Team,
                            style: GoogleFonts.bebasNeue(
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                    )
                  ]),
                ),
              )
              // cards !!!
            ]));
          } else {
            return ForgotPwPage();
          }
        });
  }
}
