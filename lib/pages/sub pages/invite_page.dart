import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../models/AppUser.dart';
import '../../service/database.dart';
import '../loader_page.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  _InvitePageState createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  final user = FirebaseAuth.instance.currentUser!;

  String _facebookUrl = "https://www.facebook.com/Cashbach.Jo/";

  void launchUrl(String urlString,
      {LaunchMode mode = LaunchMode.platformDefault,
      WebViewConfiguration webViewConfiguration = const WebViewConfiguration(),
      String? webonlyWindowName}) async {
    await canLaunchUrlString(
      urlString,
    )
        ? await launchUrlString(urlString)
        : throw "could't launch $urlString";
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).AppuserData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Scaffold(
                appBar: AppBar(
                  title: Row(children: [
                    Text('cashback '.toUpperCase(),
                        style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    Text(' Jo'.toUpperCase(),
                        style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 67, 247, 160)))
                  ]),
                  leading: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                  elevation: 10,
                  titleSpacing: 2,
                  actions: [
                    IconButton(
                        onPressed: () => launchUrl(_facebookUrl),
                        icon:
                            Icon(Icons.facebook, color: Colors.white, size: 30))
                  ],
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.greenAccent,
                        Color.fromARGB(255, 231, 150, 245)
                      ]),
                    ),
                  ),
                ),
                body: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
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
                              GestureDetector(
                                child: Container(
                                    width: 70,
                                    height: 50,
                                    child: Image.asset('icon/playstore.png')),
                                onTap: () async {
                                  final urlPreview =
                                      'https://instabridge.en.aptoide.com/app';
                                  await Share.share('Hi , use this code : ' +
                                      userData!.invitecode.toString() +
                                      ' and you will get 5\$ \n Cashback jo \n$urlPreview ');
                                },
                              ),
                              Text('Your invite code : ',
                                  style: GoogleFonts.bebasNeue(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20)),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white),
                                  child: Image.asset('icon/invite.png')),
                            ]),
                          )),
                    ],
                  ),
                ));
          } else {
            return LoaderPage();
          }
        });
  }
}
