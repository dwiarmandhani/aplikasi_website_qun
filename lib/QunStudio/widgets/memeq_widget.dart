import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/btm_bar.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class MemeqWidget extends StatelessWidget {
  const MemeqWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Divider(
              thickness: 3,
              color: Color(0xff17A0DA),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 60),
            child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/ContactPage'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xff4198C0),
                      Color(0xff397642),
                    ]),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: 356,
                  height: 99,
                  alignment: Alignment.center,
                  child: Text(
                    'Contact Us',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.archivo(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          BtmBar(),
        ],
      ),
    );
  }
}
