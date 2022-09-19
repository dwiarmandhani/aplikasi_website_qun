import 'package:aplikasi_website_qun/QunStudio/widgets/menuStudio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/btm_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/top_bar_contents.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  static const routeName = '/ContactPage';
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

final Uri _urlIG = Uri.parse('https://www.instagram.com/qunfilms/');
final Uri _urlInfo = Uri.parse('mailto:info@qunfilms.com/');
final Uri _urlWA = Uri.parse(
    'https://wa.me/6281312359233?text=Halo Admin, mau tanya-tanya dong!');
final Uri _urlMaps = Uri.parse(
    'https://www.google.com/maps/dir/-6.2265592,106.8532384/QUN+Headquarter+South+Jakarta+City/@-6.2216253,106.7839844,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x2e69f1cb459a6005:0x98a22f9845aca348!2m2!1d106.7913244!2d-6.2384708');
void _launchUrl() async {
  if (!await launchUrl(_urlInfo)) throw 'Could not launch $_urlInfo';
}

void _launchMaps() async {
  if (!await launchUrl(_urlMaps)) throw 'Could not launch $_urlMaps';
}

void _launchIG() async {
  if (!await launchUrl(_urlIG)) throw 'Could not launch $_urlIG';
}

void _launchWA() async {
  if (!await launchUrl(_urlWA)) throw 'Could not launch $_urlWA';
}

class _ContactState extends State<Contact> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<double> item = [];
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
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: TopBarContents(_opacity),
      ),
      endDrawer: menuStudio(),
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          height: 1790,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 60, right: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width,
                      height: 70,
                      child: StyledText(
                        maxLines: 70,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'Physis-Black',
                            fontWeight: FontWeight.w900),
                        text: '<bold>Contact</bold>',
                        tags: {
                          'bold': StyledTextTag(
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 60,
                                letterSpacing: 0.02,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                wordSpacing: 2),
                          ),
                          'italic': StyledTextTag(
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          'dude': StyledTextTag(
                            style: TextStyle(
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1.5
                                ..color = Colors.black,
                            ),
                          ),
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: screenSize.width,
                      height: 70,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        focusColor: Colors.transparent,
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[0] = true
                                : _isHovering[0] = false;
                          });
                        },
                        onTap: () => setState(() {
                          _launchWA();
                        }),
                        child: StyledText(
                          maxLines: 70,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'Physis-Black',
                              fontWeight: FontWeight.w900),
                          text: '<dude>\u002b62 813\u002d1235\u002d9233</dude>',
                          tags: {
                            'bold': StyledTextTag(
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 60,
                                  letterSpacing: 0.02,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  wordSpacing: 2),
                            ),
                            'italic': StyledTextTag(
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            'dude': _isHovering[0]
                                ? StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        color: Colors.black,
                                        fontFamily: 'Physis-Black',
                                        fontWeight: FontWeight.w900),
                                  )
                                : StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = Colors.black),
                                  )
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: screenSize.width,
                      height: 80,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        focusColor: Colors.transparent,
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[1] = true
                                : _isHovering[1] = false;
                          });
                        },
                        onTap: () => setState(() {
                          _launchUrl();
                        }),
                        child: StyledText(
                          maxLines: 70,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'Physis-Black',
                              fontWeight: FontWeight.w900),
                          text: '<dude>info\u0040qunstudio.com</dude>',
                          tags: {
                            'bold': StyledTextTag(
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 60,
                                  letterSpacing: 0.02,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  wordSpacing: 2),
                            ),
                            'italic': StyledTextTag(
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            'dude': _isHovering[1]
                                ? StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        color: Colors.black,
                                        fontFamily: 'Physis-Black',
                                        fontWeight: FontWeight.w900),
                                  )
                                : StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = Colors.black),
                                  )
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: screenSize.width,
                      height: 70,
                      child: StyledText(
                        maxLines: 70,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'Physis-Black',
                            fontWeight: FontWeight.w900),
                        text: '<bold>Address</bold>',
                        tags: {
                          'bold': StyledTextTag(
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 60,
                                letterSpacing: 0.02,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                wordSpacing: 2),
                          ),
                          'italic': StyledTextTag(
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          'dude': StyledTextTag(
                            style: TextStyle(
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1.5
                                ..color = Colors.black,
                            ),
                          ),
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: screenSize.width,
                      height: 350,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        focusColor: Colors.transparent,
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[2] = true
                                : _isHovering[2] = false;
                          });
                        },
                        onTap: () => setState(() {
                          _launchMaps();
                        }),
                        child: StyledText(
                          maxLines: 70,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Physis-Black',
                              fontWeight: FontWeight.w900),
                          text:
                              '<dude>JL Dempo I No. 76\nJakarta selatan, DKI\nJakarta\nIndonesia</dude>',
                          tags: {
                            'bold': StyledTextTag(
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 60,
                                  letterSpacing: 0.02,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  wordSpacing: 2),
                            ),
                            'italic': StyledTextTag(
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            'dude': _isHovering[2]
                                ? StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        color: Colors.black,
                                        fontFamily: 'Physis-Black',
                                        fontWeight: FontWeight.w900),
                                  )
                                : StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = Colors.black),
                                  )
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: screenSize.width,
                      height: 80,
                      child: StyledText(
                        maxLines: 70,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: 'Physis-Black',
                            fontWeight: FontWeight.w900),
                        text: '<bold>Social Media</bold>',
                        tags: {
                          'bold': StyledTextTag(
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 60,
                                letterSpacing: 0.02,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                wordSpacing: 2),
                          ),
                          'italic': StyledTextTag(
                              style: TextStyle(fontStyle: FontStyle.italic)),
                          'dude': StyledTextTag(
                            style: TextStyle(
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1.5
                                ..color = Colors.black,
                            ),
                          ),
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: screenSize.width,
                      height: 80,
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        focusColor: Colors.transparent,
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[3] = true
                                : _isHovering[3] = false;
                          });
                        },
                        onTap: () => setState(() {
                          _launchIG();
                        }),
                        child: StyledText(
                          maxLines: 70,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'Physis-Black',
                              fontWeight: FontWeight.w900),
                          text: '<dude>instagram</dude>',
                          tags: {
                            'bold': StyledTextTag(
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 60,
                                  letterSpacing: 0.02,
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  wordSpacing: 2),
                            ),
                            'italic': StyledTextTag(
                                style: TextStyle(fontStyle: FontStyle.italic)),
                            'dude': _isHovering[3]
                                ? StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        color: Colors.black,
                                        fontFamily: 'Physis-Black',
                                        fontWeight: FontWeight.w900),
                                  )
                                : StyledTextTag(
                                    style: TextStyle(
                                        fontSize: 60,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color = Colors.black),
                                  )
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              BtmBar(),
            ],
          ),
        ),
      ),
    );
  }
}
