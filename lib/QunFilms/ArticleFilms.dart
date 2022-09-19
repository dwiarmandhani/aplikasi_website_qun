import 'dart:developer';
import 'package:aplikasi_website_qun/QunFilms/HomeFilmsPage.dart';
import 'package:aplikasi_website_qun/QunFilms/MenuFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/footerFilms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

final List<String> imgList = [];

class ArticleFilms extends StatefulWidget {
  static const routeName = '/FilmsDetail';
  const ArticleFilms(
      {Key? key,
      required this.id,
      required this.title,
      required this.desc,
      required this.imageUrl,
      required this.cat,
      required this.year,
      required this.synopsis,
      required this.trailerLink,
      required this.starring1,
      required this.starring2,
      required this.starring3,
      required this.starring4,
      required this.starring5,
      required this.starring6,
      required this.imageUrl2,
      required this.imageUrl3,
      required this.imageUrl4,
      required this.imageUrl5,
      required this.imageUrl6,
      required this.imageUrl7,
      required this.imageUrl8,
      required this.imageUrl9,
      required this.imageUrl10,
      required this.starring7,
      required this.starring8,
      required this.starring9,
      required this.starring10})
      : super(key: key);

  final String id,
      title,
      desc,
      imageUrl,
      imageUrl2,
      imageUrl3,
      imageUrl4,
      imageUrl5,
      imageUrl6,
      imageUrl7,
      imageUrl8,
      imageUrl9,
      imageUrl10,
      cat,
      year,
      synopsis,
      trailerLink,
      starring1,
      starring2,
      starring3,
      starring4,
      starring5,
      starring6,
      starring7,
      starring8,
      starring9,
      starring10;

  @override
  State<ArticleFilms> createState() => _ArticleFilmsState();
}

class _ArticleFilmsState extends State<ArticleFilms> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('portfoliofilm');
  late YoutubePlayerController _controller;
  final CarouselController _sliderImage = CarouselController();
  final List _isHovering = [false, false, false, false, false, false];
  final List _isHoveringg = [false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.trailerLink,
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.stop();

    super.dispose();
  }

  /*void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }*/

  Widget build(BuildContext context) {
    final List<String> imageNaise = [
      widget.imageUrl,
      widget.imageUrl2,
      widget.imageUrl3,
      widget.imageUrl4,
      widget.imageUrl5,
      widget.imageUrl6,
      widget.imageUrl7,
      widget.imageUrl8,
      widget.imageUrl9,
      widget.imageUrl10,
    ];
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
            _controller.stop();
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
                      _controller.stop();
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(30, 75, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/FilmsPage'),
                    child: Text(
                      '<- Back To Films',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Rubik',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 2.066666666666667),
                    ),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(150, 50, 0, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                        widget.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(242, 255, 98, 1),
                            fontFamily: 'Agentur',
                            fontSize: 64,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 125,
                              height: 10,
                              child: Divider(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.year + ', ' + widget.cat,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Rubik',
                                    fontSize: 14,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5 /*PERCENT not supported*/
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          '''${widget.synopsis} ''',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Rubik',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 60,
              ),

              //PlayerYoutube
              Container(
                width: 1080,
                height: 720,
                child: YoutubePlayerIFrame(
                  controller: YoutubePlayerController(
                    initialVideoId: widget.trailerLink,
                    params: const YoutubePlayerParams(
                      showControls: true,
                      mute: false,
                      showFullscreenButton: true,
                      autoPlay: true,
                    ),
                  ),
                  aspectRatio: 16 / 9,
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(150, 25, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 125,
                      height: 10,
                      child: Divider(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Trailer: ' + widget.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Rubik',
                            fontSize: 14,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(150, 60, 0, 0),
                width: screenSize.width,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            width: 275,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Directed by",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 20,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5 /*PERCENT not supported*/
                                      ),
                                ),
                                Text(
                                  '''${widget.desc}''',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 20,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5 /*PERCENT not supported*/
                                      ),
                                )
                              ],
                            ),
                          )),
                      Flexible(
                          fit: FlexFit.loose,
                          flex: 1,
                          child: Container(
                            width: 275,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'Year',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(238, 238, 238, 1),
                                          fontFamily: 'Rubik',
                                          fontSize: 20,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    )),
                                FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      widget.year,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(238, 238, 238, 1),
                                          fontFamily: 'Rubik',
                                          fontSize: 20,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ))
                              ],
                            ),
                          )),
                      Spacer()
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(150, 50, 0, 0),
                width: screenSize.width,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Starring',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        )),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Container(
                              width: 275,
                              height: 110,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        widget.starring1,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                238, 238, 238, 1),
                                            fontFamily: 'Rubik',
                                            fontSize: 20,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.bold,
                                            height:
                                                1.5 /*PERCENT not supported*/
                                            ),
                                      )),
                                  FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        widget.starring2,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                238, 238, 238, 1),
                                            fontFamily: 'Rubik',
                                            fontSize: 20,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.bold,
                                            height:
                                                1.5 /*PERCENT not supported*/
                                            ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Container(
                                width: 275,
                                height: 110,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring3,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring4,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        ))
                                  ],
                                ),
                              )),
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Container(
                                width: 275,
                                height: 110,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                    ),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring5,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring6,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        ))
                                  ],
                                ),
                              )),
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Container(
                                width: 275,
                                height: 110,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                    ),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring7,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring8,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        ))
                                  ],
                                ),
                              )),
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Container(
                                width: 275,
                                height: 110,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                    ),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring9,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        )),
                                    FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          widget.starring10,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  238, 238, 238, 1),
                                              fontFamily: 'Rubik',
                                              fontSize: 20,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.bold,
                                              height:
                                                  1.5 /*PERCENT not supported*/
                                              ),
                                        ))
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 600,
                  width: screenSize.width,
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          aspectRatio: 2.5,
                          enlargeCenterPage: false,
                          viewportFraction: 0.4,
                        ),
                        carouselController: _sliderImage,
                        itemCount: (imageNaise.length).round(),
                        itemBuilder: (context, index, realIdx) {
                          final int first = index;
                          return Container(
                            child: Center(
                              child: Image.network(
                                imageNaise[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: InkWell(
                                  onTap: () => _sliderImage.previousPage(),
                                  child: Icon(
                                    Icons.arrow_back_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: InkWell(
                                  onTap: () => _sliderImage.nextPage(),
                                  child: Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  )),
              Container(
                alignment: Alignment.topRight,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 125,
                        alignment: Alignment.topRight,
                        child: Text(
                          '''${widget.synopsis} ''',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Rubik',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.5 /*PERCENT not supported*/
                              ),
                        ),
                      )),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         width: 300,
//                         height: 125,
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           '''Setelah melalui proses panjang, film "Orpa"
// yang disutradarai Theogracia Rumansara
// kini sedang dalam perjalanannya
// untuk bertemu penonton.
// “Orpa” mengisahkan perjuangan seorang
// gadis Papua dalam mengejar mimpinya
// untuk memperoleh pendidikan. ''',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               fontFamily: 'Rubik',
//                               fontSize: 14,
//                               letterSpacing:
//                                   0 /*percentages not used in flutter. defaulting to zero*/,
//                               fontWeight: FontWeight.normal,
//                               height: 1.5 /*PERCENT not supported*/
//                               ),
//                         ),
//                       )),
//                   SizedBox(
//                     width: 25,
//                   ),
//                   Flexible(
//                       flex: 1,
//                       child: Container(
//                         width: 300,
//                         height: 125,
//                         child: Text(
//                           '''Tentang harapan, tentang impian di tanah
// Papua.
// Dari sutradara dan penulis Theogracia
// Rumansara (@thexiiieast )''',
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               fontFamily: 'Rubik',
//                               fontSize: 14,
//                               letterSpacing:
//                                   0 /*percentages not used in flutter. defaulting to zero*/,
//                               fontWeight: FontWeight.normal,
//                               height: 1.5 /*PERCENT not supported*/
//                               ),
//                         ),
//                       )),
                  SizedBox(
                    width: 150,
                  )
                ]),
              ),
              SizedBox(
                height: 101,
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  width: screenSize.width,
                  height: 1000,
                  color: Color.fromRGBO(238, 238, 238, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(128, 85, 0, 20),
                          child: Text(
                            'MORE',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Rubik',
                                fontSize: 64,
                                decoration: TextDecoration.underline,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.fromLTRB(300, 20, 0, 0),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: ref
                                .orderBy('createdAt', descending: true)
                                .limit(5)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              } else if (snapshot.hasData ||
                                  snapshot.data != null) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var portInfo = snapshot.data!.docs[index]
                                          .data() as Map<String, dynamic>;
                                      String docId =
                                          snapshot.data!.docs[index].id;
                                      String title = portInfo['title'];
                                      String desc = portInfo['directedBy'];
                                      String imageUrl = portInfo['imageUrl'];
                                      String imageUrl2 = portInfo['imageUrl2'];
                                      String imageUrl3 = portInfo['imageUrl3'];
                                      String imageUrl4 = portInfo['imageUrl4'];
                                      String imageUrl5 = portInfo['imageUrl5'];
                                      String imageUrl6 = portInfo['imageUrl6'];
                                      String imageUrl7 = portInfo['imageUrl7'];
                                      String imageUrl8 = portInfo['imageUrl8'];
                                      String imageUrl9 = portInfo['imageUrl9'];
                                      String imageUrl10 =
                                          portInfo['imageUrl10'];
                                      String cat = portInfo['cat'];
                                      String year = portInfo['year'];
                                      String synopsis = portInfo['synopsis'];
                                      String trailerLink = portInfo['trailer'];
                                      String starring1 = portInfo['starring1'];
                                      String starring2 = portInfo['starring2'];
                                      String starring3 = portInfo['starring3'];
                                      String starring4 = portInfo['starring4'];
                                      String starring5 = portInfo['starring5'];
                                      String starring6 = portInfo['starring6'];
                                      String starring7 = portInfo['starring7'];
                                      String starring8 = portInfo['starring8'];
                                      String starring9 = portInfo['starring9'];
                                      String starring10 =
                                          portInfo['starring10'];

                                      return Row(
                                        children: [
                                          Flexible(
                                              fit: FlexFit.tight,
                                              flex: 2,
                                              child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHoveringg[index
                                                              .bitLength] = true
                                                          : _isHoveringg[index
                                                                  .bitLength] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ArticleFilms(
                                                                  id: docId,
                                                                  title: title,
                                                                  desc: desc,
                                                                  imageUrl:
                                                                      imageUrl,
                                                                  cat: cat,
                                                                  year: year,
                                                                  synopsis:
                                                                      synopsis,
                                                                  trailerLink:
                                                                      trailerLink,
                                                                  starring1:
                                                                      starring1,
                                                                  starring2:
                                                                      starring2,
                                                                  starring3:
                                                                      starring3,
                                                                  starring4:
                                                                      starring4,
                                                                  starring5:
                                                                      starring5,
                                                                  starring6:
                                                                      starring6,
                                                                  imageUrl2:
                                                                      imageUrl2,
                                                                  imageUrl3:
                                                                      imageUrl3,
                                                                  imageUrl4:
                                                                      imageUrl4,
                                                                  imageUrl5:
                                                                      imageUrl5,
                                                                  imageUrl6:
                                                                      imageUrl6,
                                                                  imageUrl7:
                                                                      imageUrl7,
                                                                  imageUrl8:
                                                                      imageUrl8,
                                                                  imageUrl9:
                                                                      imageUrl9,
                                                                  imageUrl10:
                                                                      imageUrl10,
                                                                  starring7:
                                                                      starring7,
                                                                  starring8:
                                                                      starring8,
                                                                  starring9:
                                                                      starring9,
                                                                  starring10:
                                                                      starring10)),
                                                    );
                                                  },
                                                  child: Container(
                                                      color: _isHoveringg[
                                                              index.bitLength]
                                                          ? Color.fromRGBO(
                                                              243, 255, 99, 1)
                                                          : Color.fromRGBO(
                                                              238, 238, 238, 1),
                                                      child: Text(
                                                        title,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    0, 0, 0, 1),
                                                            fontFamily:
                                                                'Agentur',
                                                            fontSize: 64,
                                                            letterSpacing:
                                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            height: 1),
                                                      )))),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            flex: 1,
                                            child: Container(
                                              width: 100,
                                              child: Divider(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                thickness: 1,
                                                indent: 10,
                                                endIndent: 10,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            flex: 1,
                                            child: Text(
                                              cat,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(0, 0, 0,
                                                      0.6000000238418579),
                                                  fontFamily: 'Rubik',
                                                  fontSize: 16,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 150,
                                          )
                                        ],
                                      );
                                    });
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.orangeAccent),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 1440,
                      height: 10,
                      child: Divider(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        thickness: 2,
                      ),
                    ),
                    Container(
                        width: 1184,
                        height: 75,
                        child: Container(
                            child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                '-QUIET UNDER NONE-',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(238, 238, 238, 1),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              '© QUN 2022',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                            InkWell(
                                onTap: () {
                                  _controller.reset();
                                  Navigator.pushNamed(context, '/MenuFilms');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    color: Color.fromRGBO(238, 238, 238, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Contact',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                            fontFamily: 'Rubik',
                                            fontSize: 16,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
