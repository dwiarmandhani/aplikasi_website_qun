import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:styled_text/styled_text.dart';

class RunningText extends StatelessWidget {
  const RunningText({Key? key, required this.runText}) : super(key: key);

  final String runText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 4,
            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Marquee(
                text: runText,
                style: const TextStyle(
                  fontFamily: 'Berghan',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  letterSpacing: 4,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 0),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 3),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 4,
            decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
    );
  }
}
