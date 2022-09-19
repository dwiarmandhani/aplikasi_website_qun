import 'package:aplikasi_website_qun/Data/headerFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/MenuFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/filmWidget.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/footerFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/theMindsWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marquee/marquee.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styled_text/styled_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeFilmsPage extends StatefulWidget {
  static const routeName = '/homeFilmsPage';
  const HomeFilmsPage({Key? key}) : super(key: key);

  @override
  State<HomeFilmsPage> createState() => _HomeFilmsPageState();
}

class _HomeFilmsPageState extends State<HomeFilmsPage> {
  final CarouselController _sliderImage = CarouselController();
  final List _isHovering = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/homeFilmsPage');
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Image.asset(
              "assets/images/logo_films.png",
              height: 500,
              width: 500,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/MenuFilms');
                    },
                    icon: Container(
                      child: Image.asset('assets/images/buttonMenuRadius.png'),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                    ),
                    iconSize: 50,
                  ))
            ],
          ),
        ],
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.black,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              // Text Manifestor
              FittedBox(
                fit: BoxFit.fitWidth,
                child: RichText(
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        style: TextStyle(
                          height: 1,
                          fontSize: 72,
                          fontFamily: 'Agentur',
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        children: [
                          TextSpan(text: '''
MANIFESTORS
OF
PURE IMAGINATION
                            ''')
                        ])),
              ),

              Container(
                  width: 912,
                  height: 42,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Image1.png'),
                        fit: BoxFit.fitWidth),
                  )),
              SizedBox(
                height: 60,
              ),
              Container(
                  width: 113,
                  height: 159,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo_films.png'),
                        fit: BoxFit.fitWidth),
                  )),
              SizedBox(
                height: 20,
              ),
              // bumper
              FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: 1435,
                  height: 819,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bumper.gif'),
                        fit: BoxFit.fitWidth),
                  ),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topCenter,
                          width: 1438,
                          height: 94,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(0, 0, 0, 1),
                                  Color.fromRGBO(0, 0, 0, 0)
                                ]),
                          )),
                      SizedBox(
                        height: 606,
                      ),
                      Container(
                          alignment: Alignment.bottomCenter,
                          width: 1438,
                          height: 115,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(0, 0, 0, 0),
                                  Color.fromRGBO(0, 0, 0, 1),
                                ]),
                          ))
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              // running text
              Container(
                  alignment: Alignment.topCenter,
                  width: 1745.0,
                  height: 50,
                  child: Marquee(
                    text:
                        'INTERWEAVES THE RELATIONSHIPS BETWEEN MOVING IMAGES, EDUCATION, CULTURE, ASESTHETIC, AND PURE IMAGINATION.',
                    style: const TextStyle(
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontSize: 36,
                      color: Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 4,
                    ),
                    scrollAxis: Axis.horizontal, //scroll direction
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 50.0, //speed
                    pauseAfterRound: const Duration(seconds: 5),
                    startPadding: 10.0,
                    accelerationDuration: const Duration(seconds: 3),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  )),
              SizedBox(
                height: 50,
              ),

              // ABOUT
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Text(
                        'ABOUT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(242, 255, 98, 1),
                            fontFamily: 'Agentur',
                            fontSize: 42,
                            decoration: TextDecoration.underline,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: TextButton(
                        child: Text(
                          'ABOUT+',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              fontFamily: 'Agentur',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/AboutFilmsPage'),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              // CONTENT ABOUT
              Container(
                width: 1440,
                height: 1100,
                child: Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: Stack(children: [
                    Container(
                      child: Column(
                        children: [
                          Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                width: 1291,
                                child: Text(
                                  '''An Indonesian production house dedicated towards
paving a way in the domestic and international
audio-visual industry, QUN Films is motivated
in showcasing what bright, young Indonesian
minds can bring towards the global sphere. With a
range of services and qualified minds, our mission is
to create audio-visual works of art for the satisfaction
of everybody; moving together as one, for all.''',
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 100,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontFamily: 'Rubik',
                                      fontSize: 36,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 /*PERCENT not supported*/
                                      ),
                                ),
                              )),
                          SizedBox(
                            height: 100,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              width: 1291,
                              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Text(
                                '''Our structure is unique:
we are an organization where those
behind the business are also, the creators
of the craft. This reflects a strong
conviction that we believe in, where
great work is generated via passion,
intelligence, and above all, personal commitment.''',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 100,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: 'Rubik',
                                    fontSize: 36,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment(1.2, 0),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Container(
                              height: 500,
                              width: 530,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/QunGlobe.png'),
                                    fit: BoxFit.cover,
                                    opacity: 0.5),
                              )),
                        ))
                  ]),
                ),
              ),
// Header Films and View More
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          'FILMS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(242, 255, 98, 1),
                              fontFamily: 'Agentur',
                              fontSize: 42,
                              decoration: TextDecoration.underline,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                        child: TextButton(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          'VIEW MORE+',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              fontFamily: 'Agentur',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/FilmsPage'),
                    )),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              // Content Films
              FilmWidget(),
              // Container(
              //   width: 1107,
              //   alignment: Alignment.topCenter,
              //   child: Column(
              //     children: [
              //       //gambar judul
              //       Container(
              //           height: 582,
              //           width: 1107,
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //                 image: AssetImage(
              //                     'assets/images/Screenshot20220327at11341.png'),
              //                 fit: BoxFit.fitWidth),
              //           ),
              //           child: Container(
              //             alignment: Alignment(1, 1.15),
              //             child: Text(
              //               'ORPA',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                   color: Color.fromRGBO(242, 255, 98, 1),
              //                   fontFamily: 'Agentur',
              //                   fontSize: 84,
              //                   letterSpacing:
              //                       5 /*percentages not used in flutter. defaulting to zero*/,
              //                   fontWeight: FontWeight.normal,
              //                   height: 1),
              //             ),
              //           )),

              //       //text judul
              //       Container(
              //         width: 1107,
              //         child: Row(
              //           children: [
              //             Container(
              //               child: Text(
              //                 '01',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(255, 255, 255, 1),
              //                     fontFamily: 'Rubik',
              //                     fontSize: 14,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1.5 /*PERCENT not supported*/
              //                     ),
              //               ),
              //             ),
              //             // Figma Flutter Generator Line3Widget - LINE
              //             Container(
              //               width: 125,
              //               height: 10,
              //               child: Divider(
              //                 color: Color.fromRGBO(255, 255, 255, 1),
              //                 thickness: 2,
              //                 indent: 10,
              //                 endIndent: 10,
              //               ),
              //             ),
              //             Container(
              //               child: Text(
              //                 '2022, Movie',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(255, 255, 255, 1),
              //                     fontFamily: 'Rubik',
              //                     fontSize: 14,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1.5 /*PERCENT not supported*/
              //                     ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),

              //       SizedBox(
              //         height: 50,
              //       ),
              //       Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           // MANDALA
              //           Expanded(
              //             child: Container(
              //               width: 395,
              //               height: 410,
              //               alignment: Alignment(-1, 0),
              //               child: Column(
              //                 children: [
              //                   // Gambar dan Judul
              //                   FittedBox(
              //                     fit: BoxFit.cover,
              //                     child: Container(
              //                       width: 395,
              //                       height: 335,
              //                       child: Stack(children: [
              //                         Container(
              //                             width: 296.9004821777344,
              //                             height: 296.9004821777344,
              //                             decoration: BoxDecoration(
              //                               image: DecorationImage(
              //                                   image: AssetImage(
              //                                       'assets/images/Screenshot20220327at11371.png'),
              //                                   fit: BoxFit.fitWidth),
              //                             )),
              //                         Container(
              //                           alignment: Alignment.bottomLeft,
              //                           child: Text(
              //                             'MANDALA',
              //                             textAlign: TextAlign.left,
              //                             style: TextStyle(
              //                                 color: Color.fromRGBO(
              //                                     242, 255, 98, 1),
              //                                 fontFamily: 'Agentur',
              //                                 fontSize: 64,
              //                                 letterSpacing:
              //                                     0 /*percentages not used in flutter. defaulting to zero*/,
              //                                 fontWeight: FontWeight.normal,
              //                                 height: 1),
              //                           ),
              //                         )
              //                       ]),
              //                     ),
              //                   ),
              //                   Container(
              //                     height: 30,
              //                     width: 400,
              //                     alignment: Alignment.bottomLeft,
              //                     child: FittedBox(
              //                       fit: BoxFit.cover,
              //                       child: Text(
              //                         'RESSURANCE OF THE DAWN',
              //                         textAlign: TextAlign.left,
              //                         overflow: TextOverflow.ellipsis,
              //                         maxLines: 2,
              //                         style: TextStyle(
              //                             color:
              //                                 Color.fromRGBO(255, 255, 255, 1),
              //                             fontFamily: 'Agentur',
              //                             fontSize: 24,
              //                             letterSpacing:
              //                                 0 /*percentages not used in flutter. defaulting to zero*/,
              //                             fontWeight: FontWeight.normal,
              //                             height: 1),
              //                       ),
              //                     ),
              //                   ),
              //                   Container(
              //                     height: 25,
              //                     width: 410,
              //                     child: Row(
              //                       children: [
              //                         Container(
              //                           alignment: Alignment.bottomLeft,
              //                           child: FittedBox(
              //                             fit: BoxFit.cover,
              //                             child: Text(
              //                               '03',
              //                               textAlign: TextAlign.left,
              //                               style: TextStyle(
              //                                   color: Color.fromRGBO(
              //                                       255, 255, 255, 1),
              //                                   fontFamily: 'Rubik',
              //                                   fontSize: 14,
              //                                   letterSpacing:
              //                                       0 /*percentages not used in flutter. defaulting to zero*/,
              //                                   fontWeight: FontWeight.normal,
              //                                   height:
              //                                       1.5 /*PERCENT not supported*/
              //                                   ),
              //                             ),
              //                           ),
              //                         ),
              //                         Container(
              //                           height: 10,
              //                           width: 125,
              //                           child: Divider(
              //                             color:
              //                                 Color.fromRGBO(255, 255, 255, 1),
              //                             thickness: 1,
              //                             indent: 10,
              //                             endIndent: 10,
              //                           ),
              //                         ),
              //                         Expanded(
              //                             child: Container(
              //                                 alignment: Alignment.bottomLeft,
              //                                 child: FittedBox(
              //                                   fit: BoxFit.cover,
              //                                   child: Text(
              //                                     '2022, Short Movie',
              //                                     textAlign: TextAlign.left,
              //                                     style: TextStyle(
              //                                         color: Color.fromRGBO(
              //                                             255, 255, 255, 1),
              //                                         fontFamily: 'Rubik',
              //                                         fontSize: 14,
              //                                         letterSpacing:
              //                                             0 /*percentages not used in flutter. defaulting to zero*/,
              //                                         fontWeight:
              //                                             FontWeight.normal,
              //                                         height:
              //                                             1.5 /*PERCENT not supported*/
              //                                         ),
              //                                   ),
              //                                 ))),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),

              //           // MEMORI DIA
              //           Expanded(
              //               child: Container(
              //             width: 554,
              //             height: 650,
              //             child: Column(
              //               children: [
              //                 SizedBox(
              //                   height: 250,
              //                 ),
              //                 Container(
              //                   width: 554,
              //                   height: 280,
              //                   child: Stack(children: [
              //                     Container(
              //                         width: 553,
              //                         height: 259,
              //                         decoration: BoxDecoration(
              //                           image: DecorationImage(
              //                               image: AssetImage(
              //                                   'assets/images/Screenshot20220403at2451.png'),
              //                               fit: BoxFit.fitWidth),
              //                         )),
              //                     Container(
              //                       alignment: Alignment.bottomLeft,
              //                       child: Text(
              //                         'MEMORI DIA',
              //                         textAlign: TextAlign.left,
              //                         overflow: TextOverflow.ellipsis,
              //                         maxLines: 100,
              //                         style: TextStyle(
              //                             color:
              //                                 Color.fromRGBO(242, 255, 98, 1),
              //                             fontFamily: 'Agentur',
              //                             fontSize: 64,
              //                             letterSpacing:
              //                                 0 /*percentages not used in flutter. defaulting to zero*/,
              //                             fontWeight: FontWeight.normal,
              //                             height: 1),
              //                       ),
              //                     )
              //                   ]),
              //                 ),
              //                 Container(
              //                   height: 25,
              //                   width: 554,
              //                   child: Row(
              //                     children: [
              //                       Container(
              //                         alignment: Alignment.bottomLeft,
              //                         child: Text(
              //                           '03',
              //                           textAlign: TextAlign.left,
              //                           style: TextStyle(
              //                               color: Color.fromRGBO(
              //                                   255, 255, 255, 1),
              //                               fontFamily: 'Rubik',
              //                               fontSize: 14,
              //                               letterSpacing:
              //                                   0 /*percentages not used in flutter. defaulting to zero*/,
              //                               fontWeight: FontWeight.normal,
              //                               height:
              //                                   1.5 /*PERCENT not supported*/
              //                               ),
              //                         ),
              //                       ),
              //                       Container(
              //                           height: 10,
              //                           width: 125,
              //                           child: Divider(
              //                             color:
              //                                 Color.fromRGBO(255, 255, 255, 1),
              //                             thickness: 1,
              //                             indent: 10,
              //                             endIndent: 10,
              //                           )),
              //                       Expanded(
              //                           child: Container(
              //                               alignment: Alignment.bottomLeft,
              //                               child: Text(
              //                                 '2022, Short Movie',
              //                                 textAlign: TextAlign.left,
              //                                 overflow: TextOverflow.ellipsis,
              //                                 maxLines: 100,
              //                                 style: TextStyle(
              //                                     color: Color.fromRGBO(
              //                                         255, 255, 255, 1),
              //                                     fontFamily: 'Rubik',
              //                                     fontSize: 14,
              //                                     letterSpacing:
              //                                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                                     fontWeight: FontWeight.normal,
              //                                     height:
              //                                         1.5 /*PERCENT not supported*/
              //                                     ),
              //                               ))),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           )),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(height: 50),
              mindBehindsWidget(),
              // MAN BEHIND
              /*Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                        child: Flexible(
                      fit: FlexFit.loose,
                      child: Text(
                        'THE MINDS BEHIND',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                            color: Color.fromRGBO(242, 255, 98, 1),
                            fontFamily: 'Agentur',
                            fontSize: 42,
                            decoration: TextDecoration.underline,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    )),
                    Spacer(),
                    SizedBox(
                      width: 100,
                    ),
                  ],
                ),
              ),

              Container(
                  height: 550,
                  width: screenSize.width,
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          aspectRatio: 3,
                          enlargeCenterPage: false,
                          viewportFraction: 0.175,
                        ),
                        carouselController: _sliderImage,
                        itemCount: (roleList.length).round(),
                        itemBuilder: (context, index, realIdx) {
                          final int first = index;
                          return Row(
                            children: [first].map((idx) {
                              return Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Container(
                                    child: roleList[idx],
                                    height: 260,
                                    width: 260,
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  )),
*/
              /*Container(
                width: 1260,
                alignment: Alignment(0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 133,
                              height: 199,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Image.asset('assets/images/Layer15.png'),
                              )),
                          Text(
                            'AXEL HADININGRAT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 16.649999618530273,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.699999942722262),
                          ),
                          Text(
                            'CEO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 11.654999732971191,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.4285713467460885),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 133,
                              height: 199,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Image.asset('assets/images/Layer16.png'),
                              )),
                          Text(
                            'DANI HUDA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 16.649999618530273,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.699999942722262),
                          ),
                          Text(
                            'DIRECTOR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 11.654999732971191,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.4285713467460885),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 133,
                              height: 199,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Image.asset('assets/images/Layer11.png'),
                              )),
                          Text(
                            'GIOVANNI RAHMADEVA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 16.649999618530273,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.699999942722262),
                          ),
                          Text(
                            'MANAGING DIRECTOR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 11.654999732971191,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.4285713467460885),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 133,
                              height: 199,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Image.asset('assets/images/Layer12.png'),
                              )),
                          Text(
                            'DENYS PRAYOGA',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 16.649999618530273,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.699999942722262),
                          ),
                          Text(
                            'FINANCE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 11.654999732971191,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.4285713467460885),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 133,
                              height: 199,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Image.asset('assets/images/Layer13.png'),
                              )),
                          Text(
                            'JODY AGUS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 16.649999618530273,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.699999942722262),
                          ),
                          Text(
                            'CREATIVE DIRECTOR',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 11.654999732971191,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.4285713467460885),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 133,
                              height: 199,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: Image.asset('assets/images/Layer14.png'),
                              )),
                          Text(
                            'ADAM WIKEL',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 16.649999618530273,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.699999942722262),
                          ),
                          Text(
                            'SR. COPYWRITER',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Rubik',
                                fontSize: 11.654999732971191,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 2.4285713467460885),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              */
              // FOOTER

              // Contact
              footerFilms(),

              // Container(
              //   width: 1440,
              //   height: 10,
              //   child: Divider(
              //     color: Color.fromRGBO(255, 255, 255, 1),
              //     thickness: 2,
              //   ),
              // ),
              // Container(
              //     width: 1184,
              //     height: 75,
              //     child: Container(
              //         child: Row(
              //       children: <Widget>[
              //         Expanded(
              //             child: Text(
              //           '-QUIET UNDER NONE-',
              //           textAlign: TextAlign.left,
              //           style: TextStyle(
              //               color: Color.fromRGBO(238, 238, 238, 1),
              //               fontFamily: 'Agentur',
              //               fontSize: 24,
              //               letterSpacing:
              //                   0 /*percentages not used in flutter. defaulting to zero*/,
              //               fontWeight: FontWeight.normal,
              //               height: 1),
              //         )),
              //         Expanded(
              //             child: Text(
              //           '© QUN 2022',
              //           textAlign: TextAlign.left,
              //           style: TextStyle(
              //               color: Color.fromRGBO(238, 238, 238, 1),
              //               fontFamily: 'Lato',
              //               fontSize: 16,
              //               letterSpacing:
              //                   0 /*percentages not used in flutter. defaulting to zero*/,
              //               fontWeight: FontWeight.normal,
              //               height: 1),
              //         )),
              //         InkWell(
              //             onTap: () {
              //               Navigator.push(context,
              //                   MaterialPageRoute(builder: (c) => MenuFilms()));
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(15),
              //                   topRight: Radius.circular(15),
              //                   bottomLeft: Radius.circular(15),
              //                   bottomRight: Radius.circular(15),
              //                 ),
              //                 color: Color.fromRGBO(238, 238, 238, 1),
              //               ),
              //               padding: EdgeInsets.symmetric(
              //                   horizontal: 10, vertical: 10),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.min,
              //                 children: <Widget>[
              //                   Text(
              //                     'Contact',
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(
              //                         color: Color.fromRGBO(0, 0, 0, 1),
              //                         fontFamily: 'Rubik',
              //                         fontSize: 16,
              //                         letterSpacing:
              //                             0 /*percentages not used in flutter. defaulting to zero*/,
              //                         fontWeight: FontWeight.normal,
              //                         height: 1),
              //                   ),
              //                 ],
              //               ),
              //             ))
              //       ],
              //     ))),
            ],
          ),
        ),
      ),
    );
  }
}
