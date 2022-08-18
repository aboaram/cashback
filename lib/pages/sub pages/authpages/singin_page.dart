import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SinginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const SinginPage({Key? key, required this.showRegisterPage})
      : super(key: key);

  @override
  _SinginPageState createState() => _SinginPageState();
}

// controllat
class _SinginPageState extends State<SinginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
// stop controllar
  @override
  //todo
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  // singin future
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
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

                  GestureDetector(
                    onTap: () {
                      signIn();
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
                          'Log In',
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
                          text: 'Not a member ? ',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8f9db5).withOpacity(0.45),
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff90b7ff),
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              widget.showRegisterPage();
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
  Path getClip(Size size) {
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
  Path getClip(Size size) {
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
