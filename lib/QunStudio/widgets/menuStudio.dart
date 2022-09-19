import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:styled_text/styled_text.dart';

class menuStudio extends StatefulWidget {
  const menuStudio({Key? key}) : super(key: key);

  @override
  State<menuStudio> createState() => _menuStudioState();
}

class _menuStudioState extends State<menuStudio> {
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
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 201, 18, 218),
                image: DecorationImage(
                  image:
                      AssetImage('assets/qun_studio_assets/bgMenuStudio.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(60, 50, 0, 50),
                    child: Container(
                      height: 127,
                      width: 230,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/qun_studio_assets/PutihLogo.png'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(60, 0, 0, 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 510,
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[0] = true
                                    : _isHovering[0] = false;
                              });
                            },
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/PositifChangeLoading'),
                            child: StyledText(
                              maxLines: 70,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Physis-Black',
                                fontSize: 60,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                              text: '<dude>Who We Are</dude>',
                              tags: {
                                'dude': _isHovering[0]
                                    ? StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'Physis-Black',
                                            fontWeight: FontWeight.w900),
                                      )
                                    : StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2
                                              ..color = Color.fromARGB(
                                                  255, 255, 255, 255)),
                                      )
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 510,
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[1] = true
                                    : _isHovering[1] = false;
                              });
                            },
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/RevolutionaryLoading'),
                            child: StyledText(
                              maxLines: 70,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Physis-Black',
                                fontSize: 60,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                              text: '<dude>Portfolio</dude>',
                              tags: {
                                'dude': _isHovering[1]
                                    ? StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'Physis-Black',
                                            fontWeight: FontWeight.w900),
                                      )
                                    : StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2
                                              ..color = Color.fromARGB(
                                                  255, 255, 255, 255)),
                                      )
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 510,
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[2] = true
                                    : _isHovering[2] = false;
                              });
                            },
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/FreshIdeaLoading'),
                            child: StyledText(
                              maxLines: 70,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Physis-Black',
                                fontSize: 60,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                              text: '<dude>News & Media</dude>',
                              tags: {
                                'dude': _isHovering[2]
                                    ? StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'Physis-Black',
                                            fontWeight: FontWeight.w900),
                                      )
                                    : StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2
                                              ..color = Color.fromARGB(
                                                  255, 255, 255, 255)),
                                      )
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 510,
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[3] = true
                                    : _isHovering[3] = false;
                              });
                            },
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/PeaceOfMindLoading'),
                            child: StyledText(
                              maxLines: 70,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Physis-Black',
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                              text: '<dude>Contact</dude>',
                              tags: {
                                'dude': _isHovering[3]
                                    ? StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontFamily: 'Physis-Black',
                                            fontWeight: FontWeight.w900),
                                      )
                                    : StyledTextTag(
                                        style: TextStyle(
                                            fontSize: 60,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 2
                                              ..color = Color.fromARGB(
                                                  255, 255, 255, 255)),
                                      )
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    child: Column(
                      children: [
                        Container(
                          width: screenSize.width,
                          child: Divider(
                            color: Colors.white, //color of divider
                            height: 5, //height spacing of divider
                            thickness: 3, //thickness of divier line
                            indent: 0, //spacing at the start of divider
                            endIndent: 0, //spacing at the end of divider
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(60, 20, 0, 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Qun Studios',
                                style: TextStyle(
                                  fontFamily: 'Physis-Black',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Container(
                                height: 13,
                                width: 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Text(
                                'hello@qunfilms.com',
                                style: TextStyle(
                                  fontFamily: 'Physis-Light',
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height,
              alignment: Alignment(0.9, -0.9),
              child: TextButton(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[5] = true : _isHovering[5] = false;
                  });
                },
                onPressed: () => Scaffold.of(context).closeEndDrawer(),
                child: StyledText(
                  maxLines: 70,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Physis-Black',
                    fontSize: 80,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                  text: '<dude>X</dude>',
                  tags: {
                    'dude': _isHovering[5]
                        ? StyledTextTag(
                            style: TextStyle(
                                fontSize: 60,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'Physis-Black',
                                fontWeight: FontWeight.w900),
                          )
                        : StyledTextTag(
                            style: TextStyle(
                                fontSize: 60,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Color.fromARGB(255, 255, 255, 255)),
                          )
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
