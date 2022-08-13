import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
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
  final _ReferalCodeController = TextEditingController();

  @override
  void dispose() {
    _ReferalCodeController.dispose();
    super.dispose();
  }

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
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

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
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    if (!isKeyboard)
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
                              Text('Your invite code : ',
                                  style: GoogleFonts.bebasNeue(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20)),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final invitelinkdone =
                                      userData!.invitecode + 12;
                                  final urlPreview =
                                      'https://t.me/+-MUc693m9xAwODdh';
                                  await Share.share('Hi , use this code : ' +
                                      invitelinkdone.toString() +
                                      ' and you will get 5\$ gift \n Cashback jo channel :\n$urlPreview ');
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 40,
                                            spreadRadius: 10,
                                          )
                                        ]),
                                    child: Image.asset('icon/invite.png')),
                              ),
                            ]),
                          )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Image.asset('icon/reward.png'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                        child: Text(
                      'you already have been invited with friend ? \n Put the invite code you have get \n to get 5 \$ gift right now',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(fontWeight: FontWeight.w200),
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.greenAccent),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            enabled: userData!.isactivebounas,
                            controller: _ReferalCodeController,
                            obscureText: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'invite code',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    FloatingActionButton(
                      backgroundColor: Colors.greenAccent,
                      child: Icon(Icons.done),
                      onPressed: () async {
                        int sidqq = int.parse(_ReferalCodeController.text) - 12;
                        int refcode = int.parse(_ReferalCodeController.text);
                        bool yesitsactive = false;
                        await DatabaseService(uid: userData.uid)
                            .updateUserDettails(
                                userData.firstname,
                                userData.lastname,
                                userData.email,
                                userData.balance + 5,
                                userData.vip,
                                sidqq,
                                userData.active,
                                userData.id,
                                userData.invitecode,
                                refcode,
                                yesitsactive);
                      },
                    )
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
