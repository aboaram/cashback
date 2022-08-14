import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff202227),
        body: Center(
            child: SpinKitSpinningLines(
          size: 140,
          itemCount: 7,
          color: Colors.greenAccent,
        )));
  }
}
