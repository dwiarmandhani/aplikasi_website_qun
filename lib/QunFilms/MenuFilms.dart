import 'package:aplikasi_website_qun/QunFilms/AboutFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/Films.dart';
import 'package:aplikasi_website_qun/QunFilms/News/News.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:url_launcher/link.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:colorful_iconify_flutter/icons/emojione.dart';

final Uri _urlInfo = Uri.parse('mailto:info@qunfilms.com/');
final Uri _urlIG = Uri.parse('https://www.instagram.com/qunfilms/');
final Uri _urlLinkedIn =
    Uri.parse('https://www.linkedin.com/company/qun-creativehouse/');
final Uri _urlFacebook = Uri.parse('https://www.instagram.com/qunfilms/');
final Uri _urlMaps = Uri.parse(
    'https://www.google.com/maps/dir/-6.2265592,106.8532384/QUN+Headquarter+South+Jakarta+City/@-6.2216253,106.7839844,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x2e69f1cb459a6005:0x98a22f9845aca348!2m2!1d106.7913244!2d-6.2384708');

class MenuFilms extends StatefulWidget {
  static const routeName = '/MenuFilms';
  const MenuFilms({Key? key}) : super(key: key);

  @override
  State<MenuFilms> createState() => _MenuFilmsState();
}

void _launchUrl() async {
  if (!await launchUrl(_urlInfo)) throw 'Could not launch $_urlInfo';
}

void _launchMaps() async {
  if (!await launchUrl(_urlMaps)) throw 'Could not launch $_urlMaps';
}

void _launchIG() async {
  if (!await launchUrl(_urlIG)) throw 'Could not launch $_urlIG';
}

void _launchLinkedIn() async {
  if (!await launchUrl(_urlLinkedIn)) throw 'Could not launch $_urlLinkedIn';
}

void _launchFacebook() async {
  if (!await launchUrl(_urlFacebook)) throw 'Could not launch $_urlFacebook';
}

class _MenuFilmsState extends State<MenuFilms> {
  final List _isHovering = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Color.fromRGBO(238, 238, 238, 1),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Stack(children: [
            Row(
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      width: 680,
                      height: screenSize.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.fromLTRB(27, 20, 0, 10),
                              child: FittedBox(
                                child: Text(
                                  'Navigate',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5 /*PERCENT not supported*/
                                      ),
                                ),
                              )),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[0] = true
                                    : _isHovering[0] = false;
                              });
                            },
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (c) => Films()));
                            },
                            child: FittedBox(
                                child: Container(
                              height: 125,
                              width: 620,
                              padding: EdgeInsets.fromLTRB(50, 20, 0, 10),
                              child: Row(
                                children: [
                                  Container(
                                    color: _isHovering[0]
                                        ? Color.fromRGBO(243, 255, 99, 1)
                                        : Color.fromRGBO(238, 238, 238, 1),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '01',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Rubik',
                                          fontSize: 32,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1),
                                    ),
                                  ),
                                  Container(
                                    width: 40,
                                    color: _isHovering[0]
                                        ? Color.fromRGBO(243, 255, 99, 1)
                                        : Color.fromRGBO(238, 238, 238, 1),
                                  ),
                                  Container(
                                    color: _isHovering[0]
                                        ? Color.fromRGBO(243, 255, 99, 1)
                                        : Color.fromRGBO(238, 238, 238, 1),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      'FILMS',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Agentur',
                                          fontSize: 80,
                                          decoration: _isHovering[0]
                                              ? TextDecoration.lineThrough
                                              : TextDecoration.none,
                                          letterSpacing:
                                              5 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[1] = true
                                      : _isHovering[1] = false;
                                });
                              },
                              onTap: () {
                                Navigator.pushNamed(context, '/AboutFilmsPage');
                              },
                              child: FittedBox(
                                  child: Container(
                                height: 125,
                                width: 620,
                                padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                                child: Row(
                                  children: [
                                    Container(
                                      color: _isHovering[1]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '02',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Rubik',
                                            fontSize: 32,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      color: _isHovering[1]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                    ),
                                    Container(
                                      color: _isHovering[1]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'ABOUT',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Agentur',
                                            decoration: _isHovering[1]
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            fontSize: 80,
                                            letterSpacing:
                                                5 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                          InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[2] = true
                                      : _isHovering[2] = false;
                                });
                              },
                              onTap: () {
                                Navigator.pushNamed(context, '/NewsPage');
                              },
                              child: FittedBox(
                                  child: Container(
                                height: 125,
                                width: 620,
                                padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                                child: Row(
                                  children: [
                                    Container(
                                      color: _isHovering[2]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '03',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Rubik',
                                            fontSize: 32,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ),
                                    ),
                                    Container(
                                      color: _isHovering[2]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      width: 40,
                                    ),
                                    Container(
                                      color: _isHovering[2]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'NEWS',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Agentur',
                                            decoration: _isHovering[2]
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            fontSize: 80,
                                            letterSpacing:
                                                5 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                          InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[3] = true
                                      : _isHovering[3] = false;
                                });
                              },
                              onTap: () {},
                              child: FittedBox(
                                  child: Container(
                                height: 125,
                                width: 620,
                                padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
                                child: Row(
                                  children: [
                                    Container(
                                      color: _isHovering[3]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '04',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Rubik',
                                            fontSize: 32,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ),
                                    ),
                                    Container(
                                      color: _isHovering[3]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      width: 40,
                                    ),
                                    Container(
                                      color: _isHovering[3]
                                          ? Color.fromRGBO(243, 255, 99, 1)
                                          : Color.fromRGBO(238, 238, 238, 1),
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        'CONTACT',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Agentur',
                                            decoration: _isHovering[3]
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            fontSize: 80,
                                            letterSpacing:
                                                5 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    )
                                  ],
                                ),
                              ))),
                          SizedBox(
                            height: 20,
                          ),
                          FittedBox(
                              child: Container(
                            padding: EdgeInsets.fromLTRB(190, 0, 0, 20),
                            child: Text(
                              '-QUIET UNDER NONE-',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Agentur',
                                  fontSize: 24,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          )),
                          FittedBox(
                              child: Container(
                            padding: EdgeInsets.fromLTRB(260, 0, 0, 10),
                            child: Text(
                              '© QUN 2022',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          )),
                        ],
                      ),
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      width: 680,
                      child: FittedBox(
                          child: Stack(
                        children: [
                          Container(
                              child: FittedBox(
                                  child: Container(
                                      width: 680,
                                      height: screenSize.height,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/vidMenu.gif'),
                                            fit: BoxFit.cover),
                                      )))),
                          FittedBox(
                              child: Container(
                            child: Column(
                              children: [
                                FittedBox(
                                  child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(580, 10, 0, 20),
                                      child: IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: Container(
                                          child: Image.asset(
                                              'assets/images/ButtonCross.png'),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.white)),
                                        ),
                                        iconSize: 50,
                                      )),
                                ),
                                FittedBox(
                                    child: Container(
                                  width: 500,
                                  height: 600,
                                  child: Row(
                                    children: [
                                      FittedBox(
                                          child: Container(
                                        width: 39,
                                        height: 650,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 600),
                                        child: Image.asset(
                                            'assets/images/logo_films.png',
                                            fit: BoxFit.fitWidth),
                                      )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              child: Container(
                                                  child: Text(
                                                'QUN FILMS',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontFamily: 'Rubik',
                                                    fontSize: 24,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.4166666666666667),
                                              )),
                                            ),
                                            FittedBox(
                                                child: Container(
                                              child: Text(
                                                '''Jl. Dempo I no 76
Jakarta Selatan, DKI Jakarta
Indonesia
+62 811 227 324''',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontFamily: 'Rubik',
                                                    fontSize: 24,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1.4166666666666667),
                                              ),
                                            )),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            FittedBox(
                                                child: Container(
                                              width: 320,
                                              child: Text(
                                                'SOCIAL',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontFamily: 'Rubik',
                                                    fontSize: 24,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.4166666666666667),
                                              ),
                                            )),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            FittedBox(
                                                child: Container(
                                              width: 320,
                                              child: InkWell(
                                                onTap: () => setState(() {
                                                  _launchIG();
                                                }),
                                                child: Text(
                                                  'INSTAGRAM',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontFamily: 'Rubik',
                                                      fontSize: 24,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height:
                                                          1.4166666666666667),
                                                ),
                                              ),
                                            )),
                                            FittedBox(
                                                child: Container(
                                              width: 320,
                                              child: InkWell(
                                                onTap: () => setState(() {
                                                  _launchFacebook();
                                                }),
                                                child: Text(
                                                  'FACEBOOK',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontFamily: 'Rubik',
                                                      fontSize: 24,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height:
                                                          1.4166666666666667),
                                                ),
                                              ),
                                            )),
                                            FittedBox(
                                                child: Container(
                                              width: 320,
                                              child: InkWell(
                                                onTap: () => setState(() {
                                                  _launchLinkedIn();
                                                }),
                                                child: Text(
                                                  'LINKEDIN',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontFamily: 'Rubik',
                                                      fontSize: 24,
                                                      decoration: TextDecoration
                                                          .underline,
                                                      letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height:
                                                          1.4166666666666667),
                                                ),
                                              ),
                                            )),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            InkWell(
                                              onHover: (value) {
                                                setState(() {
                                                  value
                                                      ? _isHovering[4] = true
                                                      : _isHovering[4] = false;
                                                });
                                              },
                                              onTap: () => setState(() {
                                                _launchUrl();
                                              }),
                                              child: FittedBox(
                                                  child: Container(
                                                width: 275,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 2,
                                                        color: _isHovering[4]
                                                            ? Color.fromRGBO(
                                                                238,
                                                                238,
                                                                238,
                                                                1)
                                                            : Colors.black)),
                                                child: Container(
                                                  color: _isHovering[4]
                                                      ? Colors.black
                                                      : Color.fromRGBO(
                                                          238, 238, 238, 1),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              14.664917945861816,
                                                          height:
                                                              14.664917945861816,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/mail.svg',
                                                            semanticsLabel:
                                                                'mail',
                                                            color: _isHovering[
                                                                    4]
                                                                ? Color
                                                                    .fromRGBO(
                                                                        238,
                                                                        238,
                                                                        238,
                                                                        1)
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            'info@qunfilms.com',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: _isHovering[
                                                                        4]
                                                                    ? Color
                                                                        .fromRGBO(
                                                                            238,
                                                                            238,
                                                                            238,
                                                                            1)
                                                                    : Colors
                                                                        .black,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize:
                                                                    16.759904861450195,
                                                                letterSpacing:
                                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                height:
                                                                    1.4166667709872418),
                                                          ),
                                                        )
                                                      ]),
                                                ),
                                              )),
                                            ),
                                            SizedBox(
                                              height: 46,
                                            ),
                                            InkWell(
                                              onHover: (value) {
                                                setState(() {
                                                  value
                                                      ? _isHovering[5] = true
                                                      : _isHovering[5] = false;
                                                });
                                              },
                                              onTap: () => setState(() {
                                                _launchMaps();
                                              }),
                                              child: FittedBox(
                                                child: Container(
                                                    width: 220,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: _isHovering[
                                                                    5]
                                                                ? Color
                                                                    .fromRGBO(
                                                                        238,
                                                                        238,
                                                                        238,
                                                                        1)
                                                                : Colors
                                                                    .black)),
                                                    child: Container(
                                                      color: _isHovering[5]
                                                          ? Colors.black
                                                          : Color.fromRGBO(
                                                              238, 238, 238, 1),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  9.776611328125,
                                                              height:
                                                                  13.09697151184082,
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/maps.svg',
                                                                semanticsLabel:
                                                                    'maps',
                                                                color: _isHovering[
                                                                        5]
                                                                    ? Color
                                                                        .fromRGBO(
                                                                            238,
                                                                            238,
                                                                            238,
                                                                            1)
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                'Get Direction',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    color: _isHovering[
                                                                            5]
                                                                        ? Color.fromRGBO(
                                                                            238,
                                                                            238,
                                                                            238,
                                                                            1)
                                                                        : Colors
                                                                            .black,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        16.759904861450195,
                                                                    letterSpacing:
                                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    height:
                                                                        1.4166667709872418),
                                                              ),
                                                            )
                                                          ]),
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          )),
                        ],
                      )),
                    )),
              ],
            ),
            Visibility(
                maintainAnimation: false,
                maintainState: false,
                maintainSize: false,
                visible: _isHovering[3],
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  alignment: Alignment(-0.025, 0.1),
                  child: Image.asset(
                      'assets/images/Group68.png'), /*const Iconify(
                    Bi.arrow_right,
                    size: 131,
                    color: Colors.black87,
                  ),*/
                )),
          ]),
        ),
      ),
    );
  }
}
