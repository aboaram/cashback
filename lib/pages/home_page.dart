import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //user from auth
  final user = FirebaseAuth.instance.currentUser!;
  //url

  String _telegramUrl = "https://t.me/+-MUc693m9xAwODdh";
  String _facebookUrl = "https://www.facebook.com/Cashbach.Jo/";
  String _Vip = "0";
  String _user_Name = 'yazan adra';
  String _user_Balance = '50';
  String _user_Team = '0';
  String _user_Id = '000252';
  String _user_Sid = '110011';

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
                //launchUrl(_telegramUrl)
                onPressed: () => launchUrl(_telegramUrl),
                icon: Icon(
                  Icons.telegram,
                  color: Colors.white,
                  size: 30,
                )),
            IconButton(
                onPressed: () => launchUrl(_facebookUrl),
                icon: Icon(Icons.facebook, color: Colors.white, size: 30))
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
        body: SafeArea(
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
                Text(_user_Name.toUpperCase(),
                    style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40)),
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
                            fontWeight: FontWeight.bold, color: Colors.white))
                  ],
                )
              ]),
            ),
          )
          // cards !!!
        ])));
  }
}
