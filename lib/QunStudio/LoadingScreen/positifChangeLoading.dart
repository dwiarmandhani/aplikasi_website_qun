import 'dart:async';

import 'package:aplikasi_website_qun/QunStudio/screens/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:styled_text/styled_text.dart';

class positifCangeLoadingScreen extends StatefulWidget {
  static const routeName = '/PositifChangeLoading';
  const positifCangeLoadingScreen({Key? key}) : super(key: key);

  @override
  State<positifCangeLoadingScreen> createState() =>
      _positifCangeLoadingScreenState();
}

class _positifCangeLoadingScreenState extends State<positifCangeLoadingScreen> {
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(context, '/WhoWeAre');
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Color.fromRGBO(115, 106, 125, 100),
            width: screenSize.width,
            height: screenSize.height - 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledText(
                  maxLines: 70,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Physis-Black',
                    fontSize: 60,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                  text: '<dude>POSITIF CHANGE</dude>',
                  tags: {
                    'dude': StyledTextTag(
                      style: TextStyle(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.white),
                    ),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
