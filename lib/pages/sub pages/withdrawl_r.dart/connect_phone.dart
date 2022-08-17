import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ConnectPhone extends StatefulWidget {
  const ConnectPhone({Key? key}) : super(key: key);

  @override
  _ConnectPhoneState createState() => _ConnectPhoneState();
}

final Appuser = FirebaseAuth.instance.currentUser;

final _phone = TextEditingController();
final _pinOne = TextEditingController();
final _pinTwo = TextEditingController();
final _pinThree = TextEditingController();
final _pinFour = TextEditingController();
final _pinFive = TextEditingController();
final _pinSix = TextEditingController();

@override
//todo
void dispose() {
  _phone.dispose();
  _pinOne.dispose();
  _pinTwo.dispose();
  _pinThree.dispose();
  _pinFour.dispose();
  _pinFive.dispose();
  _pinSix.dispose();
}

//
class _ConnectPhoneState extends State<ConnectPhone> {
  @override
  Widget build(BuildContext context) {
    bool showphoneinput = true;
    bool showotpinput = false;
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: Color.fromRGBO(23, 21, 35, 255),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Center(
                  child: Text(
                'Lets make space man check \n you phone number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(229, 230, 232, 255),
                  fontFamily: 'SF Rounded',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
              Container(
                child: Image.asset('icon/spaceman.png'),
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 2,
              ),
              Column(children: [
                Visibility(
                  visible: showphoneinput,
                  child: SizedBox(
                    height: 60,
                    width: 340,
                    child: TextField(
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {},
                          ),
                          labelText: 'phone ',
                          filled: true,
                          fillColor: Color.fromARGB(229, 230, 232, 255),
                          hintText: 'Enter your phone number ....',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                Visibility(
                  visible: showotpinput,
                  child: SizedBox(
                      height: 60,
                      width: 340,
                      child: Form(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextFormField(
                                    controller: _pinOne,
                                    onChanged: (value) {
                                      FocusScope.of(context).nextFocus();
                                    },
                                    onSaved: (pin1) {},
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '0',
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(229, 230, 232, 255),
                                        border: OutlineInputBorder())),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextFormField(
                                    controller: _pinTwo,
                                    onChanged: (value) {
                                      FocusScope.of(context).nextFocus();
                                    },
                                    onSaved: (pin2) {},
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '0',
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(229, 230, 232, 255),
                                        border: OutlineInputBorder())),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextFormField(
                                    controller: _pinThree,
                                    onChanged: (value) {
                                      FocusScope.of(context).nextFocus();
                                    },
                                    onSaved: (pin3) {},
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '0',
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(229, 230, 232, 255),
                                        border: OutlineInputBorder())),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextFormField(
                                    controller: _pinFour,
                                    onChanged: (value) {
                                      FocusScope.of(context).nextFocus();
                                    },
                                    onSaved: (pin4) {},
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '0',
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(229, 230, 232, 255),
                                        border: OutlineInputBorder())),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextFormField(
                                    controller: _pinFive,
                                    onChanged: (value) {
                                      FocusScope.of(context).nextFocus();
                                    },
                                    onSaved: (pin5) {},
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintText: '0',
                                        fillColor:
                                            Color.fromARGB(229, 230, 232, 255),
                                        border: OutlineInputBorder())),
                              ),
                              SizedBox(
                                height: 68,
                                width: 50,
                                child: TextFormField(
                                    controller: _pinSix,
                                    onChanged: (value) {
                                      FocusScope.of(context).nextFocus();
                                    },
                                    onSaved: (pin6) {},
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textAlign: TextAlign.center,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: '0',
                                        filled: true,
                                        fillColor:
                                            Color.fromARGB(229, 230, 232, 255),
                                        border: OutlineInputBorder())),
                              ),
                            ]),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    'by link you phone number you accept \n that if we found you have another account we will panned you with out return to you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(229, 230, 232, 255),
                      fontFamily: 'SF Rounded',
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 65,
                      width: 300,
                      child: SlideAction(
                        borderRadius: 12,
                        innerColor: Colors.black,
                        outerColor: Color.fromARGB(229, 230, 232, 255),
                        elevation: 0,
                        sliderButtonIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        text: 'Send to space',
                        onSubmit: () {},
                      ),
                    ),
                  ),
                )
              ]),
            ],
          ),
        ));
  }
}
