import 'package:aplikasi_website_qun/QunFilms/HomeFilmsPage.dart';
import 'package:aplikasi_website_qun/QunFilms/MenuFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/footerFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/theMindsWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

final Uri _urlStudiosNewTab = Uri.parse('/#/HomeStudioPage');

void _launchNewTabStudio() async {
  if (!await launchUrl(_urlStudiosNewTab))
    throw 'Could not launch $_urlStudiosNewTab';
}

late YoutubePlayerController _controller;
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
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class AboutFilms extends StatefulWidget {
  static const routeName = '/AboutFilmsPage';
  const AboutFilms({Key? key}) : super(key: key);

  @override
  State<AboutFilms> createState() => _AboutFilmsState();
}

class _AboutFilmsState extends State<AboutFilms> {
  late YoutubePlayerController _controller;
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'uofpZrmKt4c',
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        autoPlay: true,
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('aboutFilm');
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
            //_controller.stop();
            Navigator.popAndPushNamed(context, '/homeFilmsPage');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
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
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {
                      //_controller.stop();
                      Navigator.popAndPushNamed(context, '/MenuFilms');
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
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              child: StreamBuilder<QuerySnapshot>(
                  stream: ref.snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 16.0,
                              ),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var homeInfo = snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                            String docId = snapshot.data!.docs[index].id;
                            String title = homeInfo['title'];
                            String paragraf1 = homeInfo['paragraf1'];
                            String paragraf2 = homeInfo['paragraf2'];
                            String imageHover1 = homeInfo['imageHover1'];
                            String imageHover2 = homeInfo['imageHover2'];
                            String imageHover3 = homeInfo['imageHover3'];
                            String imageHover4 = homeInfo['imageHover4'];
                            String imageHover5 = homeInfo['imageHover5'];
                            String imageHover6 = homeInfo['imageHover6'];
                            String imageHover7 = homeInfo['imageHover7'];
                            String imageHover8 = homeInfo['imageHover8'];
                            String desc = homeInfo['desc'];
                            String videoUrl = homeInfo['videoUrl'];
                            String concept = homeInfo['concept'];
                            String photoProduction =
                                homeInfo['photoProduction'];
                            String postProduction = homeInfo['postProduction'];
                            String preProduction = homeInfo['preProduction'];
                            String videoProduction =
                                homeInfo['videoProduction'];

                            return Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 50,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'ABOUT',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(242, 255, 98, 1),
                                          fontFamily: 'Agentur',
                                          fontSize: 56,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                const SizedBox(
                                  height: 75,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      '''WHAT TO KNOW / HERE'S
A LITTLE SOMETHING
ABOUT US''',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(238, 238, 238, 1),
                                          fontFamily: 'Agentur',
                                          fontSize: 72,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                const SizedBox(
                                  height: 50,
                                ),
                                const SizedBox(
                                  width: 144,
                                  height: 144,
                                  child: VerticalDivider(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    thickness: 3,
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                SizedBox(
                                  width: screenSize.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 120,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: 778,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                child: Stack(
                                                  children: <Text>[
                                                    Text(
                                                      'QUN Films',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 64,
                                                        fontFamily: 'Agentur',
                                                        letterSpacing: 5,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height: 1.8,
                                                        foreground: Paint()
                                                          ..style =
                                                              PaintingStyle
                                                                  .stroke
                                                          ..strokeWidth = 6
                                                          ..color = const Color
                                                                  .fromRGBO(
                                                              242, 255, 98, 1),
                                                      ),
                                                    ),
                                                    const Text(
                                                      'QUN Films',
                                                      style: TextStyle(
                                                        fontSize: 64,
                                                        fontFamily: 'Agentur',
                                                        letterSpacing: 5,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        height: 1.8,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 35,
                                              ),
                                              Container(
                                                width: 778,
                                                child: Text(
                                                  paragraf1,
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontFamily: 'Rubik',
                                                      fontSize: 24,
                                                      letterSpacing:
                                                          2 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      height:
                                                          1.5 /*PERCENT not supported*/
                                                      ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 34,
                                              ),
                                              Container(
                                                  width: 778,
                                                  height: 36,
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: const DecorationImage(
                                                        image: const AssetImage(
                                                            'assets/images/Image1.png'),
                                                        fit: BoxFit.fitWidth),
                                                  )),
                                              const SizedBox(
                                                height: 55,
                                              ),
                                              Container(
                                                  width: 778,
                                                  padding: EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  child: StyledText(
                                                    text: paragraf2,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontFamily: 'Rubik',
                                                      fontSize: 40,
                                                      letterSpacing: 0,
                                                      height: 1.5,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    tags: {
                                                      'regular': StyledTextTag(
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      1),
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontSize: 40,
                                                              letterSpacing: 0,
                                                              height: 1.5)),
                                                      'yellow': StyledTextTag(
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          242,
                                                                          255,
                                                                          98,
                                                                          1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 40,
                                                                  letterSpacing:
                                                                      0,
                                                                  height: 1.5))
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              width: 503,
                                              height: 567,
                                              decoration: const BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    196, 196, 196, 1),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/Rectangle53.png'),
                                                    fit: BoxFit.fitHeight),
                                              ))),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                // What We Do
                                Container(
                                  width: screenSize.width,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 120),
                                        child: const Text(
                                          'WHAT WE DO',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  242, 255, 98, 1),
                                              fontFamily: 'Agentur',
                                              fontSize: 42,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Spacer()
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    width: 1267,
                                    height: 687,
                                    padding: const EdgeInsets.only(
                                        left: 50, right: 50),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: <Widget>[
                                            Container(
                                                alignment:
                                                    const Alignment(-0.5, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[6] =
                                                              true
                                                          : _isHovering[6] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Documentary',
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                        color: const Color
                                                                .fromRGBO(255,
                                                            255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                alignment:
                                                    const Alignment(0.8, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[7] =
                                                              true
                                                          : _isHovering[7] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Feature Film',
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                        color: const Color
                                                                .fromRGBO(255,
                                                            255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                alignment:
                                                    const Alignment(-1, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[8] =
                                                              true
                                                          : _isHovering[8] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Short Film',
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                        color: const Color
                                                                .fromRGBO(255,
                                                            255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                alignment:
                                                    const Alignment(-0.3, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[9] =
                                                              true
                                                          : _isHovering[9] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'TVC',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                alignment:
                                                    const Alignment(1, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[10] =
                                                              true
                                                          : _isHovering[10] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Campaign/Digital Campaign',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                alignment:
                                                    const Alignment(-0.7, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[11] =
                                                              true
                                                          : _isHovering[11] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Digital Advertising',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                alignment:
                                                    const Alignment(0.5, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[12] =
                                                              true
                                                          : _isHovering[12] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Branding',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Container(
                                                alignment:
                                                    const Alignment(-0.5, 0),
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[13] =
                                                              true
                                                          : _isHovering[13] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () {},
                                                  child: const Text(
                                                    'Music Video',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Agentur',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 40,
                                                        letterSpacing:
                                                            4 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Positioned(
                                          left: 180,
                                          top: 80,
                                          child: Container(
                                              width: _isHovering[6] ? 400 : 0,
                                              height: _isHovering[6] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover1),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                          left: 800,
                                          top: 250,
                                          child: Container(
                                              width: _isHovering[7] ? 400 : 0,
                                              height: _isHovering[7] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover2),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                          left: 250,
                                          top: 0,
                                          child: Container(
                                              width: _isHovering[8] ? 400 : 0,
                                              height: _isHovering[8] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover3),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                          left: 250,
                                          top: 380,
                                          child: Container(
                                              width: _isHovering[9] ? 400 : 0,
                                              height: _isHovering[9] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover4),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                          left: 700,
                                          top: 30,
                                          child: Container(
                                              width: _isHovering[10] ? 400 : 0,
                                              height: _isHovering[10] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover5),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                          left: 200,
                                          top: 100,
                                          child: Container(
                                              width: _isHovering[11] ? 400 : 0,
                                              height: _isHovering[11] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover6),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                          left: 700,
                                          top: 200,
                                          child: Container(
                                              width: _isHovering[12] ? 400 : 0,
                                              height: _isHovering[12] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover7),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                        Positioned(
                                          left: 200,
                                          top: 200,
                                          child: Container(
                                              width: _isHovering[13] ? 400 : 0,
                                              height: _isHovering[13] ? 300 : 0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(imageHover8),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Container(
                                        child: const Text(
                                            '''Our structure is unique. We are productions house where the owners of the business are
              also the creators of the work and serve as primary contact for every client.''',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 24,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height:
                                                    1.5 /*PERCENT not supported*/
                                                )))),
                                const SizedBox(
                                  height: 30,
                                ),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    child: const Text(
                                      '''This reflect our conviction that great work cannot passion, intelligence and - above all - personal commitment, and
              is demonstrated by our portfolio and our upcoming project.''',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'Rubik',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5 /*PERCENT not supported*/
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                const mindBehindsWidget(),
                                /*
                      //Man Behind
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              child: Text(
                                'MAN BEHIND',
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
                            SizedBox(
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
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
                                        child:
                                            Image.asset('assets/images/Layer15.png'),
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
                                        child:
                                            Image.asset('assets/images/Layer16.png'),
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
                                        child:
                                            Image.asset('assets/images/Layer11.png'),
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
                                        child:
                                            Image.asset('assets/images/Layer12.png'),
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
                                        child:
                                            Image.asset('assets/images/Layer13.png'),
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
                                        child:
                                            Image.asset('assets/images/Layer14.png'),
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
                      SizedBox(
                        height: 86,
                      ),
                      */
                                //SERVICE AND SUBSIDIARY
                                Container(
                                  width: screenSize.width,
                                  color: const Color.fromRGBO(238, 238, 238, 1),
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              alignment: const Alignment(-1, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      100, 100, 100, 50),
                                              child: const Text(
                                                'SERVICES',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: const Color.fromRGBO(
                                                        250, 89, 89, 1),
                                                    fontFamily: 'Agentur',
                                                    fontSize: 42,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              ),
                                            ),
                                            FittedBox(
                                              child: Container(
                                                  width: screenSize.width,
                                                  padding:
                                                      const EdgeInsets.all(33),
                                                  alignment:
                                                      const Alignment(-0.7, 0),
                                                  child: Container(
                                                    height: 50,
                                                    width: 500,
                                                    child: InkWell(
                                                      onHover: (value) {
                                                        setState(() {
                                                          value
                                                              ? _isHovering[0] =
                                                                  true
                                                              : _isHovering[0] =
                                                                  false;
                                                        });
                                                      },
                                                      onTap: () {},
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: const Text(
                                                              '01     ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: const TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            width:
                                                                _isHovering[0]
                                                                    ? 50
                                                                    : 0,
                                                            child:
                                                                const Divider(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255, 0, 0, 0),
                                                              thickness: 2,
                                                              indent: 5,
                                                              endIndent: 5,
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: // Figma Flutter Generator ConceptWidget - TEXT
                                                                const Text(
                                                              'Concepting',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 36,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            FittedBox(
                                              child: Container(
                                                  width: screenSize.width,
                                                  padding:
                                                      const EdgeInsets.all(33),
                                                  alignment:
                                                      const Alignment(-0.7, 0),
                                                  child: Container(
                                                    height: 50,
                                                    width: 500,
                                                    child: InkWell(
                                                      onHover: (value) {
                                                        setState(() {
                                                          value
                                                              ? _isHovering[1] =
                                                                  true
                                                              : _isHovering[1] =
                                                                  false;
                                                        });
                                                      },
                                                      onTap: () {},
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: const Text(
                                                              '02     ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            width:
                                                                _isHovering[1]
                                                                    ? 50
                                                                    : 0,
                                                            child:
                                                                const Divider(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255, 0, 0, 0),
                                                              thickness: 2,
                                                              indent: 5,
                                                              endIndent: 5,
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: // Figma Flutter Generator ConceptWidget - TEXT
                                                                const Text(
                                                              'Pre-Production',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: const TextStyle(
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 36,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            FittedBox(
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(33),
                                                  width: screenSize.width,
                                                  alignment:
                                                      const Alignment(-0.7, 0),
                                                  child: Container(
                                                    height: 50,
                                                    width: 500,
                                                    child: InkWell(
                                                      onHover: (value) {
                                                        setState(() {
                                                          value
                                                              ? _isHovering[2] =
                                                                  true
                                                              : _isHovering[2] =
                                                                  false;
                                                        });
                                                      },
                                                      onTap: () {},
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: const Text(
                                                              '03     ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            width:
                                                                _isHovering[2]
                                                                    ? 50
                                                                    : 0,
                                                            child:
                                                                const Divider(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255, 0, 0, 0),
                                                              thickness: 2,
                                                              indent: 5,
                                                              endIndent: 5,
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: // Figma Flutter Generator ConceptWidget - TEXT
                                                                const FittedBox(
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              child: Text(
                                                                'Photo Production',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    color: Color.fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        1),
                                                                    fontFamily:
                                                                        'Rubik',
                                                                    fontSize:
                                                                        36,
                                                                    letterSpacing:
                                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    height: 1),
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            FittedBox(
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(33),
                                                  width: screenSize.width,
                                                  alignment:
                                                      const Alignment(-0.7, 0),
                                                  child: Container(
                                                    height: 50,
                                                    width: 500,
                                                    child: InkWell(
                                                      onHover: (value) {
                                                        setState(() {
                                                          value
                                                              ? _isHovering[3] =
                                                                  true
                                                              : _isHovering[3] =
                                                                  false;
                                                        });
                                                      },
                                                      onTap: () {},
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: const Text(
                                                              '04     ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            width:
                                                                _isHovering[3]
                                                                    ? 50
                                                                    : 0,
                                                            child:
                                                                const Divider(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255, 0, 0, 0),
                                                              thickness: 2,
                                                              indent: 5,
                                                              endIndent: 5,
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: // Figma Flutter Generator ConceptWidget - TEXT
                                                                const Text(
                                                              'Video Production',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 36,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            FittedBox(
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(33),
                                                  width: screenSize.width,
                                                  alignment:
                                                      const Alignment(-0.7, 0),
                                                  child: Container(
                                                    height: 50,
                                                    width: 500,
                                                    child: InkWell(
                                                      onHover: (value) {
                                                        setState(() {
                                                          value
                                                              ? _isHovering[4] =
                                                                  true
                                                              : _isHovering[4] =
                                                                  false;
                                                        });
                                                      },
                                                      onTap: () {},
                                                      child: Row(
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: const Text(
                                                              '05     ',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            width:
                                                                _isHovering[4]
                                                                    ? 50
                                                                    : 0,
                                                            child:
                                                                const Divider(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255, 0, 0, 0),
                                                              thickness: 2,
                                                              indent: 5,
                                                              endIndent: 5,
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: // Figma Flutter Generator ConceptWidget - TEXT
                                                                const Text(
                                                              'Post-Production',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromRGBO(0, 0,
                                                                          0, 1),
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 36,
                                                                  letterSpacing:
                                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  height: 1),
                                                              overflow:
                                                                  TextOverflow
                                                                      .visible,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                            const SizedBox(
                                              height: 200,
                                            ),
                                            Container(
                                              alignment: const Alignment(-1, 0),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      100, 100, 100, 50),
                                              child: const FittedBox(
                                                  child: const Text(
                                                'SUBSIDIARY',
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        250, 89, 89, 1),
                                                    fontFamily: 'Agentur',
                                                    fontSize: 42,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              )),
                                            ),
                                            FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Container(
                                                  width: screenSize.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Flexible(
                                                          flex: 1,
                                                          fit: FlexFit.loose,
                                                          child: Container(
                                                              height: 422,
                                                              width: 410,
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child: const FittedBox(
                                                                          fit: BoxFit.fitWidth,
                                                                          child: const Text(
                                                                            '01',
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: TextStyle(
                                                                                color: Color.fromRGBO(0, 0, 0, 1),
                                                                                fontFamily: 'Rubik',
                                                                                fontSize: 14,
                                                                                letterSpacing: 4 /*percentages not used in flutter. defaulting to zero*/,
                                                                                fontWeight: FontWeight.bold,
                                                                                height: 1),
                                                                          ))),
                                                                  Container(
                                                                      alignment:
                                                                          const Alignment(
                                                                              -0.8,
                                                                              0),
                                                                      child: FittedBox(
                                                                          fit: BoxFit.fitWidth,
                                                                          child: InkWell(
                                                                              onHover: (value) {
                                                                                setState(() {
                                                                                  value ? _isHovering[5] = true : _isHovering[5] = false;
                                                                                });
                                                                              },
                                                                              onTap: () => setState(() {
                                                                                    _launchNewTabStudio();
                                                                                  }),
                                                                              child: Text(
                                                                                title,
                                                                                textAlign: TextAlign.left,
                                                                                style: const TextStyle(color: const Color.fromRGBO(0, 0, 0, 1), fontFamily: 'Rubik', fontSize: 42, letterSpacing: 4 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w900, height: 1),
                                                                              )))),
                                                                  Container(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            35,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          width: _isHovering[5]
                                                                              ? 150
                                                                              : 0,
                                                                          child:
                                                                              const Divider(
                                                                            color: const Color.fromARGB(
                                                                                255,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            thickness:
                                                                                2,
                                                                            indent:
                                                                                0,
                                                                            endIndent:
                                                                                20,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Text(
                                                                            _isHovering[5]
                                                                                ? 'GO TO WEBSITE'
                                                                                : '',
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: const TextStyle(
                                                                                color: const Color.fromRGBO(0, 0, 0, 1),
                                                                                fontFamily: 'Rubik',
                                                                                fontSize: 10,
                                                                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                                fontWeight: FontWeight.normal,
                                                                                height: 1),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 29,
                                                                  ),
                                                                  Container(
                                                                      width:
                                                                          380,
                                                                      child:
                                                                          Text(
                                                                        desc,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            100,
                                                                        style: const TextStyle(
                                                                            color: const Color.fromRGBO(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                1),
                                                                            fontFamily:
                                                                                'Rubik',
                                                                            fontSize:
                                                                                16,
                                                                            letterSpacing:
                                                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            height: 1),
                                                                      )),
                                                                ],
                                                              ))),
                                                      const SizedBox(
                                                        width: 120,
                                                      ),
                                                      Flexible(
                                                          flex: 1,
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            width: 800,
                                                            height: 422,
                                                            child:
                                                                YoutubePlayerIFrame(
                                                              controller:
                                                                  YoutubePlayerController(
                                                                initialVideoId:
                                                                    videoUrl,
                                                                params:
                                                                    const YoutubePlayerParams(
                                                                  showControls:
                                                                      true,
                                                                  mute: false,
                                                                  showFullscreenButton:
                                                                      true,
                                                                  autoPlay:
                                                                      true,
                                                                ),
                                                              ),
                                                              aspectRatio:
                                                                  16 / 9,
                                                            ),
                                                            /*Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    child: _controller
                                                                            .value
                                                                            .isInitialized
                                                                        ? AspectRatio(
                                                                            aspectRatio:
                                                                                _controller.value.aspectRatio,
                                                                            child:
                                                                                VideoPlayer(_controller),
                                                                          )
                                                                        : Container(),
                                                                  ),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          _controller.value.isPlaying
                                                                              ? _controller.pause()
                                                                              : _controller.play();
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            125,
                                                                        height:
                                                                            125,
                                                                        child: Image.asset(_controller.value.isPlaying
                                                                            ? 'assets/images/PauseIcon.png'
                                                                            : 'assets/images/PlayIcon.png'),
                                                                      )
                                                                      // Icon(_controller.value.isPlaying
                                                                      //     ? Icons.pause
                                                                      //     : Icons.play_arrow),
                                                                      ),
                                                                ]),*/
                                                          )),
                                                    ],
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 150,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          left: 800,
                                          top: 150,
                                          width: screenSize.width,
                                          child: Text(
                                            _isHovering[0] ? concept : '',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.625),
                                          ),
                                        ),
                                        Positioned(
                                          left: 800,
                                          top: 150,
                                          width: screenSize.width,
                                          child: Text(
                                            _isHovering[1] ? preProduction : '',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.625),
                                          ),
                                        ),
                                        Positioned(
                                          left: 800,
                                          top: 150,
                                          width: screenSize.width,
                                          child: Text(
                                            _isHovering[2]
                                                ? photoProduction
                                                : '',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.625),
                                          ),
                                        ),
                                        Positioned(
                                          left: 800,
                                          top: 150,
                                          width: screenSize.width,
                                          child: Text(
                                            _isHovering[3]
                                                ? videoProduction
                                                : '',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.625),
                                          ),
                                        ),
                                        Positioned(
                                          left: 800,
                                          top: 150,
                                          width: screenSize.width,
                                          child: Text(
                                            _isHovering[4]
                                                ? postProduction
                                                : '',
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.625),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.black,
                                  height: 285,
                                ),
                                //Footer
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 1440,
                                        height: 10,
                                        child: const Divider(
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1),
                                          thickness: 2,
                                        ),
                                      ),
                                      Container(
                                          width: 1184,
                                          height: 75,
                                          child: Container(
                                              child: Row(
                                            children: <Widget>[
                                              const Expanded(
                                                child: const Text(
                                                  '-QUIET UNDER NONE-',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          238, 238, 238, 1),
                                                      fontFamily: 'Agentur',
                                                      fontSize: 24,
                                                      letterSpacing:
                                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height: 1),
                                                ),
                                              ),
                                              const Expanded(
                                                  child: const Text(
                                                '© QUN 2022',
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    color: const Color.fromRGBO(
                                                        238, 238, 238, 1),
                                                    fontFamily: 'Lato',
                                                    fontSize: 16,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              )),
                                              InkWell(
                                                  onTap: () {
                                                    // _controller.stop();
                                                    Navigator.popAndPushNamed(
                                                        context, '/MenuFilms');
                                                  },
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft: const Radius
                                                            .circular(15),
                                                        topRight: const Radius
                                                            .circular(15),
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            const Radius
                                                                .circular(15),
                                                      ),
                                                      color:
                                                          const Color.fromRGBO(
                                                              238, 238, 238, 1),
                                                    ),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: <Widget>[
                                                        const Text(
                                                          'Contact',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: const TextStyle(
                                                              color:
                                                                  Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontSize: 16,
                                                              letterSpacing:
                                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
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
                            );
                          });
                    }
                    return const Center(
                      child: const CircularProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.orangeAccent),
                      ),
                    );
                  }),
            )),
      ),
    );
  }
}
