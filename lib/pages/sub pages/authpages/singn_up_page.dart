import 'dart:math';
import 'package:cashback/models/AppUser.dart';
import 'package:cashback/pages/sub%20pages/send_invite.dart';
import 'package:cashback/service/firebase_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUp({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _NameController = TextEditingController();
  final _giftController = TextEditingController();
  @override
  //todo
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _NameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    //auth user
    try {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        final UserCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim());
        final user = UserCredential.user;
        var rng = new Random();
        var idcode = rng.nextInt(900000) + 100000;

        var sog = new Random();
        var invcode = sog.nextInt(900000) + 100000;

        await FirebaseAuth.instance
            .authStateChanges()
            .listen((User? user) async {
          if (user != null) {
            final Appuser = FirebaseAuth.instance.currentUser;
            await FirebaseFirestore.instance
                .collection('invitecode')
                .doc(Appuser!.uid)
                .update({'refcode': refcode, 'id': idcode});
            await FirebaseFirestore.instance
                .collection('users')
                .doc(Appuser.uid)
                .collection('question')
                .doc('history')
                .set({'paytoyou': '', 'paytous': '', 'problim': ''});
          }
        });

        await FirestoreHelper(uid: user!.uid).creatUser(UserModel(
          uid: user.uid,
          name: _NameController.text.trim(),
          email: _emailController.text.trim(),
          balance: 0.0,
          sid: invcode,
          vip: 0,
          id: idcode,
          active: false,
          invitecode: 'https://cashbackjoo.page.link/Ref?refcode=${idcode}',
          refcode: _giftController.text.trim(),
          isactivebounas: true,
          rewardbalance: 0.0,
          wallet: '0',
          depositwallet: '0',
          phone: 0,
          teambalance: 0.0,
          isthiswalletin: false,
          team: '0',
          weeklyBalance: 0,
          mounthlyBalance: 0,
          lastmonthhbalance: 0,
          vipteam: 0,
          normalteam: 0,
          vipreq: '',
          withdrawlreq: '',
          depositreq: '',
          notficone: '',
          notfictwo: '',
          notficthree: '',
        ));
      }
      ;
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString() + " your passord wrong "),
            );
          });
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 40),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontFamily: 'Cardo',
                            fontSize: 35,
                            color: Color(0xff0C2551),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),

                  //
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, top: 5),
                      child: Text(
                        'CashBack',
                        style: TextStyle(
                            fontFamily: 'Nunito sans',
                            fontSize: 15,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //
                  //
                  ///
                  //////
                  ////////
                  ///
                  ///
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          color: Color(0xff8f9db5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                    child: TextField(
                        controller: _NameController,
                        style: TextStyle(
                            fontSize: 19,
                            color: Color(0xff0962ff),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 27, horizontal: 25),
                          focusColor: Color(0xff0962ff),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff0962ff)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          color: Color(0xff8f9db5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                    child: TextField(
                        controller: _emailController,
                        style: TextStyle(
                            fontSize: 19,
                            color: Color(0xff0962ff),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 27, horizontal: 25),
                          focusColor: Color(0xff0962ff),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff0962ff)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          color: Color(0xff8f9db5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                    child: TextField(
                        controller: _passwordController,
                        style: TextStyle(
                            fontSize: 19,
                            color: Color(0xff0962ff),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "password",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 27, horizontal: 25),
                          focusColor: Color(0xff0962ff),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff0962ff)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          color: Color(0xff8f9db5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                    child: TextField(
                        controller: _confirmpasswordController,
                        style: TextStyle(
                            fontSize: 19,
                            color: Color(0xff0962ff),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "Confirm password",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 27, horizontal: 25),
                          focusColor: Color(0xff0962ff),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff0962ff)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                      child: Text(
                        'Vp code from ?',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          color: Color(0xff8f9db5),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 15),
                    child: TextField(
                        controller: _giftController,
                        style: TextStyle(
                            fontSize: 19,
                            color: Color(0xff0962ff),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: "vp code ..",
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[350],
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 27, horizontal: 25),
                          focusColor: Color(0xff0962ff),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xff0962ff)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ),
                  Text(
                    "Creating an account means you're okay with\nour Terms of Service and Privacy Policy",
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8f9db5).withOpacity(0.45),
                    ),
                    //
                  ),
                  GestureDetector(
                    onTap: () {
                      signUp();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: scrWidth * 0.85,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Color(0xff0962ff),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Create an Account',
                          style: TextStyle(
                            fontFamily: 'ProductSans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8f9db5).withOpacity(0.45),
                          ),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff90b7ff),
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              widget.showLoginPage();
                            },
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ClipPath(
                clipper: OuterClippedPart(),
                child: Container(
                  color: Color(0xff0962ff),
                  width: scrWidth,
                  height: scrHeight,
                ),
              ),
              //
              ClipPath(
                clipper: InnerClippedPart(),
                child: Container(
                  color: Color(0xff0c2551),
                  width: scrWidth,
                  height: scrHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
