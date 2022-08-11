import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
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

  void launchUrl(String urlString) async {
    await canLaunchUrlString(urlString)
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('signned is as: ' + user.email!),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.greenAccent,
            child: Text('sing out'),
          )
        ],
      )),
    );
  }
}
