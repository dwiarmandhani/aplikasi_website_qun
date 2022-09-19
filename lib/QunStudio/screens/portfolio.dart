import 'package:aplikasi_website_qun/QunStudio/widgets/menuStudio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/btm_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/memeq_widget.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/port_square.dart';
import 'package:styled_text/styled_text.dart';

import '../widgets/top_bar_contents.dart';

class Portfoliio extends StatefulWidget {
  static const routeName = '/PortfolioQunStudio';
  @override
  State<Portfoliio> createState() => _PortfoliioState();
}

class _PortfoliioState extends State<Portfoliio> {
  final List _posts = [
    'post 1',
    'post 2',
    'post 3',
  ];
  final Shader _linearGradient = const LinearGradient(
    colors: [Color(0xff4198C0), Color(0xff397642)],
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 70),
          child: TopBarContents(_opacity),
        ),
        endDrawer: menuStudio(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              width: screenSize.width,
              child: Column(
                children: [
                  Container(
                    width: screenSize.width,
                    height: 75,
                    child: Text(
                      'Curated Work:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Physis-Black',
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff418f76)),
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    height: 75,
                    child: StyledText(
                      text:
                          '<text1>Fresh From</text1> <text2>The Studio</text2>',
                      textAlign: TextAlign.center,
                      tags: {
                        'text1': StyledTextTag(
                          style: TextStyle(
                            fontFamily: 'Physis-Light',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                            color: Color(0xff499fd6),
                          ),
                        ),
                        'text2': StyledTextTag(
                          style: new TextStyle(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 60,
                            fontFamily: 'Berghan',
                            color: Color(0xff499fd6),
                            // foreground: Paint()
                            //   ..shader = ui.Gradient.linear(
                            //     const Offset(0, 20),
                            //     const Offset(150, 20),
                            //     <Color>[
                            //       Color(0xff4198C0),
                            //       Color(0xff397642),
                            //     ],
                            //   ),
                          ),
                        )
                      },
                    ),
                  ),
                  PortSquare(),
                  MemeqWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}
