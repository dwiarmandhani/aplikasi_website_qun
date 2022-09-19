import 'package:aplikasi_website_qun/QunFilms/Films.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/menuStudio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/btm_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/network_player.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/top_bar_contents.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:styled_text/styled_text.dart';
import 'dart:ui' as ui;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../Admin/services/global_method.dart';

final Uri _urlFilmsNewTab = Uri.parse('/#/homeFilmsPage');

void _launchNewTabFilm() async {
  if (!await launchUrl(_urlFilmsNewTab))
    throw 'Could not launch $_urlFilmsNewTab';
}

final List<String> imgList = [
  'assets/qun_studio_assets/Rectangle 50.png',
  'assets/qun_studio_assets/Rectangle 51.png',
  'assets/qun_studio_assets/Rectangle 48.png',
];

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

class AboutScreen extends StatefulWidget {
  static const routeName = '/WhoWeAre';
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  late YoutubePlayerController _controllerYoutube;
  late String videoLink;
  late bool _isLoading = false;

  // Future<String> getData() async {
  //   final ds = await FirebaseFirestore.instance
  //       .collection('aboutStudio')
  //       .doc('RlOuZmDoeEpZVv2MqVon')
  //       .get();
  //   videoLink =  ds['videoLink'];
  // }

  // initState() {
  //   super.initState();

  //   _controllerYoutube = YoutubePlayerController(
  //     initialVideoId: '',
  //     params: const YoutubePlayerParams(
  //       showControls: true,
  //       mute: false,
  //       showFullscreenButton: true,
  //       autoPlay: true,
  //     ),
  //   );
  // }

  void dispose() {
    _controllerYoutube.stop();
    super.dispose();
  }

  final CarouselController _controller = CarouselController();
  List<double> item = [];
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  /*void initState() {
    item = List.generate(5, (index) => index.toDouble());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      imgList.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });

    _controllerVideo = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    super.initState();

    _scrollController.addListener(_scrollListener);
  }*/

  @override
  Widget build(BuildContext context) {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('aboutStudio');
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
              stream: ref.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16.0,
                          ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var homeInfo = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        String docId = snapshot.data!.docs[index].id;
                        String title1 = homeInfo['title1'];
                        String title2 = homeInfo['title2'];
                        String title3 = homeInfo['title3'];
                        String paragraf1 = homeInfo['paragraf1'];
                        String paragraf2 = homeInfo['paragraf2'];
                        String paragraf3 = homeInfo['paragraf3'];
                        String imageUrl1 = homeInfo['imageUrl1'];
                        String imageUrl2 = homeInfo['imageUrl2'];
                        String imageUrl3 = homeInfo['imageUrl3'];
                        String imageHover1 = homeInfo['imageHover1'];
                        String imageHover2 = homeInfo['imageHover2'];
                        String imageHover3 = homeInfo['imageHover3'];
                        String title = homeInfo['title'];
                        String desc = homeInfo['desc'];
                        String videoLink = homeInfo['videoLink'];
                        List imgList2 = [imageUrl1, imageUrl2, imageUrl3];

                        return Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Container(
                                width: screenSize.width,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(1, 255, 255, 251)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 709,
                                      height: 178,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: StyledText(
                                          maxLines: 70,
                                          textAlign: TextAlign.center,
                                          text:
                                              '<text1>ABOUT</text1>\n\n<text2>Who is QUN Studios?</text2>',
                                          tags: {
                                            'text1': StyledTextTag(
                                              style: TextStyle(
                                                fontFamily: 'Physis-Black',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40,
                                                color: Color(0xff499fd6),
                                              ),
                                            ),
                                            'text2': StyledTextTag(
                                              style: new TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 60,
                                                fontFamily: 'Berghan',
                                                color: Color(0xff418f76),
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
                                            ),
                                          },
                                        ),
                                      ),
                                    ),

                                    // Container(
                                    //   child: CarouselSlider.builder(
                                    //     itemCount: imgList.length,
                                    //     options: CarouselOptions(
                                    //         viewportFraction: 0.4,
                                    //         enlargeCenterPage: true,
                                    //         enlargeStrategy: CenterPageEnlargeStrategy.height,
                                    //         enableInfiniteScroll: true,
                                    //         height: 456),
                                    //     carouselController: _controller,
                                    //     itemBuilder:
                                    //         (BuildContext context, int index, int realIndex) {
                                    //       return Container(
                                    //         child: Center(
                                    //           child: Image.network(
                                    //             imgList[index],
                                    //             fit: BoxFit.none,
                                    //           ),
                                    //         ),
                                    //       );
                                    //     },
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(horizontal: 60),
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.end,
                                    //     children: <Widget>[
                                    //       Flexible(
                                    //         child: IconButton(
                                    //           icon: Icon(IconlyBold.arrow_left_3),
                                    //           iconSize: 50,
                                    //           onPressed: () => _controller.previousPage(),
                                    //         ),
                                    //       ),
                                    //       SizedBox(
                                    //         width: 20,
                                    //       ),
                                    //       Flexible(
                                    //         child: IconButton(
                                    //           icon: Icon(IconlyBold.arrow_right_3),
                                    //           iconSize: 50,
                                    //           onPressed: () => _controller.nextPage(),
                                    //         ),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      height: 600,
                                      width: 1100,
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: StyledText(
                                                  text:
                                                      '''<text1>A collection of <hover1/>
individuals with global
perspectives, <hover2/> to develop
the needs of our clientele
into <hover3/> solutions that benefit
all those around us.</text1>''',
                                                  textAlign: TextAlign.left,
                                                  tags: {
                                                    'text1': StyledTextTag(
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Physis-Black',
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 60,
                                                        color:
                                                            Color(0xff499fd6),
                                                      ),
                                                    ),
                                                    'text2': StyledTextTag(
                                                      style: new TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: 60,
                                                        fontFamily:
                                                            'Physis-Light',
                                                        color:
                                                            Color(0xff499fd6),
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
                                                    ),
                                                    'hover1':
                                                        StyledTextWidgetTag(
                                                            InkWell(
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
                                                      child: StyledText(
                                                        text: 'open-minded',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Physis-Light',
                                                          fontSize: 60,
                                                          fontStyle:
                                                              _isHovering[0]
                                                                  ? FontStyle
                                                                      .normal
                                                                  : FontStyle
                                                                      .italic,
                                                          fontWeight:
                                                              _isHovering[0]
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                          color:
                                                              Color(0xff499fd6),
                                                        ),
                                                      ),
                                                    )),
                                                    'hover2':
                                                        StyledTextWidgetTag(
                                                            InkWell(
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
                                                      child: StyledText(
                                                        text: 'we are here',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Physis-Light',
                                                          fontSize: 60,
                                                          fontStyle:
                                                              _isHovering[1]
                                                                  ? FontStyle
                                                                      .normal
                                                                  : FontStyle
                                                                      .italic,
                                                          fontWeight:
                                                              _isHovering[1]
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                          color:
                                                              Color(0xff499fd6),
                                                        ),
                                                      ),
                                                    )),
                                                    'hover3':
                                                        StyledTextWidgetTag(
                                                            InkWell(
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
                                                      child: StyledText(
                                                        text: 'inventive',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Physis-Light',
                                                          fontSize: 60,
                                                          fontStyle:
                                                              _isHovering[2]
                                                                  ? FontStyle
                                                                      .normal
                                                                  : FontStyle
                                                                      .italic,
                                                          fontWeight:
                                                              _isHovering[2]
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                          color:
                                                              Color(0xff499fd6),
                                                        ),
                                                      ),
                                                    )),
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment(-0.1, 0),
                                            child: Container(
                                                width: _isHovering[0] ? 400 : 0,
                                                height:
                                                    _isHovering[0] ? 300 : 0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/meme3.gif'),
                                                    /*NetworkImage(imageUrl),*/
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                )),
                                          ),
                                          Container(
                                            alignment: Alignment(0.8, 0),
                                            child: Container(
                                                width: _isHovering[1] ? 400 : 0,
                                                height:
                                                    _isHovering[1] ? 300 : 0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/meme3.gif'),
                                                    /*NetworkImage(imageUrl2),*/
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                )),
                                          ),
                                          Container(
                                            alignment: Alignment(0.8, 0),
                                            child: Container(
                                                width: _isHovering[2] ? 400 : 0,
                                                height:
                                                    _isHovering[2] ? 300 : 0,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/meme3.gif'),
                                                    /*NetworkImage(imageUrl2),*/
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Container(
                                      width: 1086,
                                      height: 2,
                                      color: Color(0xff499fd6),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      width: 1086,
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 311,
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title1,
                                                  style: TextStyle(
                                                    fontFamily: 'Berghan',
                                                    color: Color(0xff499fd6),
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  paragraf1,
                                                  maxLines: 70,
                                                  style: TextStyle(
                                                    fontFamily: 'Physis-Black',
                                                    color: Color(0xff499fd6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 311,
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title2,
                                                  style: TextStyle(
                                                    fontFamily: 'Berghan',
                                                    color: Color(0xff499fd6),
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  paragraf2,
                                                  maxLines: 70,
                                                  style: TextStyle(
                                                    fontFamily: 'Physis-Black',
                                                    color: Color(0xff499fd6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 331,
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  title3,
                                                  style: TextStyle(
                                                    fontFamily: 'Berghan',
                                                    color: Color(0xff499fd6),
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  paragraf3,
                                                  maxLines: 70,
                                                  style: TextStyle(
                                                    fontFamily: 'Physis-Black',
                                                    color: Color(0xff499fd6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                    letterSpacing: 0.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: screenSize.width,
                                      height: 600,
                                      child: CarouselSlider.builder(
                                        itemCount: imgList2.length,
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          viewportFraction: 4,
                                          enlargeCenterPage: true,
                                          enlargeStrategy:
                                              CenterPageEnlargeStrategy.height,
                                          enableInfiniteScroll: true,
                                          height: 600,
                                        ),
                                        carouselController: _controller,
                                        itemBuilder: (BuildContext context,
                                            int index, int realIndex) {
                                          return Container(
                                            child: Center(
                                              child: Image.network(
                                                imgList2[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: screenSize.width,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 128,
                                          right: 60,
                                          top: 80,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'SUBSDIARY',
                                              maxLines: 70,
                                              style: TextStyle(
                                                fontFamily: 'Physis-Black',
                                                color: Color(0xff418f76),
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 42,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.3,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            FittedBox(
                                                fit: BoxFit.fitWidth,
                                                child: Container(
                                                  height: 450,
                                                  width: screenSize.width,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
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
                                                                      child: FittedBox(
                                                                          fit: BoxFit.fitWidth,
                                                                          child: Text(
                                                                            '01',
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: TextStyle(
                                                                                color: Color(0xff499fd6),
                                                                                fontFamily: 'Rubik',
                                                                                fontSize: 14,
                                                                                letterSpacing: 4 /*percentages not used in flutter. defaulting to zero*/,
                                                                                fontWeight: FontWeight.bold,
                                                                                height: 1),
                                                                          ))),
                                                                  Container(
                                                                      alignment:
                                                                          Alignment(
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
                                                                                    _launchNewTabFilm();
                                                                                  }),
                                                                              child: Text(
                                                                                title,
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(color: Color(0xff499fd6), fontFamily: 'Rubik', fontSize: 42, letterSpacing: 4 /*percentages not used in flutter. defaulting to zero*/, fontWeight: FontWeight.w900, height: 1),
                                                                              )))),
                                                                  Container(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
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
                                                                              Divider(
                                                                            color:
                                                                                Color(0xff499fd6),
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
                                                                            style: TextStyle(
                                                                                color: Color(0xff499fd6),
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
                                                                  SizedBox(
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
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff499fd6),
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
                                                      SizedBox(
                                                        width: 120,
                                                      ),
                                                      Flexible(
                                                          flex: 1,
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            height: 422,
                                                            child:
                                                                YoutubePlayerIFrame(
                                                              controller:
                                                                  YoutubePlayerController(
                                                                initialVideoId:
                                                                    videoLink,
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
                                                                    child: _controllerVideo
                                                                            .value
                                                                            .isInitialized
                                                                        ? AspectRatio(
                                                                            aspectRatio:
                                                                                _controllerVideo.value.aspectRatio,
                                                                            child:
                                                                                VideoPlayer(_controllerVideo),
                                                                          )
                                                                        : Container(),
                                                                  ),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          _controllerVideo.value.isPlaying
                                                                              ? _controllerVideo.pause()
                                                                              : _controllerVideo.play();
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            125,
                                                                        height:
                                                                            125,
                                                                        child: Image.asset(_controllerVideo.value.isPlaying
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
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    BtmBar(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
