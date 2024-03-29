import 'package:animate_gradient/animate_gradient.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/News/NewsStudio.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/bottom_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/btm_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/carousel.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/featured_heading.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/featured_tiles.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/floating_quick_access_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/main_heading.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/menu_drawer.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/running_text.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/top_bar_contents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _urlIG = Uri.parse('https://www.instagram.com/qunfilms/');
final Uri _urlInfo = Uri.parse('mailto:info@qunfilms.com/');
final Uri _urlWA = Uri.parse(
    'https://wa.me/6281312359233?text=Halo Admin, mau tanya-tanya dong!');

class HomePage extends StatefulWidget {
  static const routeName = '/HomeStudioPage';
  @override
  _HomePageState createState() => _HomePageState();
}

void _launchIG() async {
  if (!await launchUrl(_urlIG)) throw 'Could not launch $_urlIG';
}

void _launchUrl() async {
  if (!await launchUrl(_urlInfo)) throw 'Could not launch $_urlInfo';
}

void _launchWA() async {
  if (!await launchUrl(_urlWA)) throw 'Could not launch $_urlWA';
}

class _HomePageState extends State<HomePage> {
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
  ScrollToId? scrollToId;
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void _scrollLemeq() {
    print(scrollToId!.idPosition());
  }

  @override
  void initState() {
    item = List.generate(5, (index) => index.toDouble());
    super.initState();
    scrollToId = ScrollToId(scrollController: _scrollController);

    _scrollController.addListener(_scrollListener);
  }

  CollectionReference ref = FirebaseFirestore.instance.collection('homeStudio');

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
        body: Container(
      height: screenSize.height,
      width: screenSize.width,
      child: StreamBuilder<QuerySnapshot>(
          stream: ref.orderBy('createdAt', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var homeInfo = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    String docId = snapshot.data!.docs[index].id;
                    String runText = homeInfo['runningText'];
                    String imageUrl = homeInfo['imageUrl1'];
                    String imageUrl2 = homeInfo['imageUrl2'];

                    return Container(
                      height: screenSize.height,
                      width: screenSize.width,
                      child: Stack(
                        children: [
                          InteractiveScrollViewer(
                              scrollToId: scrollToId,
                              children: <ScrollContent>[
                                ScrollContent(
                                  id: 'a',
                                  child: PreferredSize(
                                    preferredSize: Size(screenSize.width, 70),
                                    child: Container(
                                      width: screenSize.width,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 60),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (c) =>
                                                                  HomePage()));
                                                    },
                                                    child: Container(
                                                      height: 50.0,
                                                      width: 50.0,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/qun_studio_assets/logo_studio.png'),
                                                            fit:
                                                                BoxFit.contain),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/LineAppBar.png'),
                                                          fit: BoxFit.contain),
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    child: Text(
                                                      'Social, Digital & Content Creation',
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 12,
                                                        fontFamily: 'Work Sans',
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height: 70,
                                                    alignment: Alignment.center,
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
                                                      onTap: () {
                                                        scrollToId?.animateTo(
                                                            'd',
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease);

                                                        /// jump
                                                        scrollToId?.jumpTo('d');
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            'MENU',
                                                            style: TextStyle(
                                                                color: _isHovering[
                                                                        0]
                                                                    ? Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0)
                                                                    : Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Visibility(
                                                            maintainAnimation:
                                                                true,
                                                            maintainState: true,
                                                            maintainSize: true,
                                                            visible:
                                                                _isHovering[0],
                                                            child: Container(
                                                              height: 2,
                                                              width: 20,
                                                              color: Color(
                                                                  0xFF051441),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  Container(
                                                    height: 70,
                                                    alignment: Alignment.center,
                                                    child: IconButton(
                                                        onPressed: () =>
                                                            setState(() {
                                                              _launchIG();
                                                            }),
                                                        icon: const FaIcon(
                                                          FontAwesomeIcons
                                                              .instagram,
                                                          color: Colors.blue,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ScrollContent(
                                  id: 'b',
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 60, right: 60),
                                          height: 585,
                                          width: screenSize.width,
                                          alignment: Alignment.center,
                                          child: StyledText(
                                            maxLines: 70,
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                                fontFamily: 'Berghan',
                                                fontSize: 64),
                                            text:
                                                '''<bold>Welcome to your next stop in effective branding and design, a place where changes are made for a <dude><hover1/></dude> and <dude><hover2/>.</dude></bold>''',
                                            tags: {
                                              'hover1':
                                                  StyledTextWidgetTag(InkWell(
                                                onHover: (value) {
                                                  setState(() {
                                                    value
                                                        ? _isHovering[7] = true
                                                        : _isHovering[7] =
                                                            false;
                                                  });
                                                },
                                                onTap: () {},
                                                child: StyledText(
                                                  text: 'better result',
                                                  style: TextStyle(
                                                    fontFamily: 'Berghan',
                                                    fontSize: 56,
                                                    fontWeight: _isHovering[7]
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
                                                      ..strokeWidth = 1
                                                      ..color = Colors.black,
                                                  ),
                                                ),
                                              )),
                                              'hover2':
                                                  StyledTextWidgetTag(InkWell(
                                                onHover: (value) {
                                                  setState(() {
                                                    value
                                                        ? _isHovering[8] = true
                                                        : _isHovering[8] =
                                                            false;
                                                  });
                                                },
                                                onTap: () {},
                                                child: StyledText(
                                                  text: 'a great cause',
                                                  style: TextStyle(
                                                    fontFamily: 'Berghan',
                                                    fontSize: 56,
                                                    fontWeight: _isHovering[8]
                                                        ? FontWeight.bold
                                                        : FontWeight.normal,
                                                    foreground: Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
                                                      ..strokeWidth = 1
                                                      ..color = Colors.black,
                                                  ),
                                                ),
                                              )),
                                              'bold': StyledTextTag(
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              'italic': StyledTextTag(
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic)),
                                              'dude': StyledTextTag(
                                                style: TextStyle(
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 1
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                            },
                                          ),
                                        ),
                                        Container(
                                          child: RunningText(
                                            runText: runText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ScrollContent(
                                  id: 'c',
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: AnimateGradient(
                                      primaryBegin: Alignment.topLeft,
                                      primaryEnd: Alignment.bottomLeft,
                                      secondaryBegin: Alignment.bottomLeft,
                                      secondaryEnd: Alignment.topRight,
                                      primaryColors: const [
                                        Colors.pink,
                                        Colors.pinkAccent,
                                        Colors.white,
                                      ],
                                      secondaryColors: const [
                                        Colors.white,
                                        Colors.blueAccent,
                                        Colors.blue,
                                      ],
                                      child: Container(
                                        height: 989,
                                        width: screenSize.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 58,
                                                        vertical: 85),
                                                child: StyledText(
                                                  maxLines: 70,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontFamily: 'Berghan',
                                                      fontSize: 76,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color: Colors.white,
                                                      letterSpacing: 0.02),
                                                  text:
                                                      '''QUN STUDIOS is a creative design agency specializing in crafting unique brand identities and experiences. 
                                              
Our mission is to accompany brands and tell stories that deepen engagement through impactful design.''',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ScrollContent(
                                  id: 'd',
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 787,
                                        width: screenSize.width,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: const AssetImage(
                                                'assets/qun_studio_assets/bgMenuStudio.png'),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                                Color.fromARGB(
                                                        255, 138, 136, 136)
                                                    .withOpacity(0.7),
                                                BlendMode.dstATop),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 60, vertical: 100),
                                        child: Container(
                                          height: 127,
                                          width: 230,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/qun_studio_assets/PutihLogo.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                      ),
                                      Positioned(
                                        top: 300,
                                        left: 60,
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          width: 520,
                                          height: 300,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 510,
                                                height: 70,
                                                alignment: Alignment.centerLeft,
                                                child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/SpiritLoading'),
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: StyledText(
                                                      maxLines: 70,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'Physis-Black',
                                                        fontSize: 60,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          '<dude>Who We Are</dude>',
                                                      tags: {
                                                        'dude': StyledTextTag(
                                                          style: TextStyle(
                                                              foreground:
                                                                  Paint()
                                                                    ..style =
                                                                        PaintingStyle
                                                                            .stroke
                                                                    ..strokeWidth =
                                                                        1.5
                                                                    ..color = Colors
                                                                        .white),
                                                        ),
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 510,
                                                height: 70,
                                                alignment: Alignment.centerLeft,
                                                child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/ImaginationLoading'),
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: StyledText(
                                                      maxLines: 70,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'Physis-Black',
                                                        fontSize: 60,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          '<dude>Portfolio</dude>',
                                                      tags: {
                                                        'dude': StyledTextTag(
                                                          style: TextStyle(
                                                              foreground:
                                                                  Paint()
                                                                    ..style =
                                                                        PaintingStyle
                                                                            .stroke
                                                                    ..strokeWidth =
                                                                        1.5
                                                                    ..color = Colors
                                                                        .white),
                                                        ),
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 510,
                                                height: 70,
                                                alignment: Alignment.centerLeft,
                                                child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/BuildTogether'),
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: StyledText(
                                                      maxLines: 70,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'Physis-Black',
                                                        fontSize: 60,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          '<dude>News & Media</dude>',
                                                      tags: {
                                                        'dude': StyledTextTag(
                                                          style: TextStyle(
                                                              foreground:
                                                                  Paint()
                                                                    ..style =
                                                                        PaintingStyle
                                                                            .stroke
                                                                    ..strokeWidth =
                                                                        1.5
                                                                    ..color = Colors
                                                                        .white),
                                                        ),
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 510,
                                                height: 70,
                                                alignment: Alignment.centerLeft,
                                                child: TextButton(
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/EvolutionLoading'),
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: StyledText(
                                                      maxLines: 70,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                        fontSize: 60,
                                                        fontFamily:
                                                            'Physis-Black',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        color: Colors.white,
                                                      ),
                                                      text:
                                                          '<dude>Contact</dude>',
                                                      tags: {
                                                        'dude': StyledTextTag(
                                                          style: TextStyle(
                                                              foreground:
                                                                  Paint()
                                                                    ..style =
                                                                        PaintingStyle
                                                                            .stroke
                                                                    ..strokeWidth =
                                                                        1.5
                                                                    ..color = Colors
                                                                        .white),
                                                        ),
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 690),
                                        child: Container(
                                          width: screenSize.width,
                                          child: const Divider(
                                            color:
                                                Colors.white, //color of divider
                                            height:
                                                5, //height spacing of divider
                                            thickness:
                                                3, //thickness of divier line
                                            indent:
                                                0, //spacing at the start of divider
                                            endIndent:
                                                0, //spacing at the end of divider
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 730, left: 60),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Qun Studios',
                                              style: TextStyle(
                                                fontFamily: 'Physis-Black',
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 13,
                                            ),
                                            /* Container(
                                              height: 13,
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 13,
                                            ),
                                            InkWell(
                                              onTap: () => setState(() {
                                                _launchWA();
                                              }),
                                              child: const Text(
                                                '+62 813-1235-9233',
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontFamily: 'Physis-Light',
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                  letterSpacing: 1,
                                                ),
                                              ),
                                            ),
                                            */
                                            const SizedBox(
                                              width: 13,
                                            ),
                                            Container(
                                              height: 13,
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 13,
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: 250,
                                                alignment: Alignment.topLeft,
                                                child: TextButton(
                                                  onPressed: () => setState(() {
                                                    _launchUrl();
                                                  }),
                                                  child: const Text(
                                                    'hello@qunfilms.com',
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Physis-Light',
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ScrollContent(id: 'e', child: const BtmBar())
                              ]),
                          Positioned(
                            left: 400,
                            bottom: 300,
                            child: Container(
                                width: _isHovering[7] ? 400 : 0,
                                height: _isHovering[7] ? 300 : 0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    /*NetworkImage(imageUrl),*/
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                          ),
                          Positioned(
                            left: 800,
                            bottom: 300,
                            child: Container(
                                width: _isHovering[8] ? 400 : 0,
                                height: _isHovering[8] ? 300 : 0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl2),
                                    /*NetworkImage(imageUrl2),*/
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            );
          }),
    ));
  }
}
/*SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
              stream: ref.orderBy('createdAt', descending: true).snapshots(),
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
                      String runText = homeInfo['runningText'];
                      String imageUrl = homeInfo['imageUrl1'];
                      String imageUrl2 = homeInfo['imageUrl2'];

                      return Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 585,
                                width: screenSize.width,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            60, 120, 60, 120),
                                        child: StyledText(
                                          maxLines: 70,
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontFamily: 'Berghan',
                                              fontSize: 64),
                                          text:
                                              '''<bold>Welcome to your next stop in effective branding and design, a place where changes are made for a <dude><hover1/></dude> and <dude><hover2/>.</dude></bold>''',
                                          tags: {
                                            'hover1':
                                                StyledTextWidgetTag(InkWell(
                                              onHover: (value) {
                                                setState(() {
                                                  value
                                                      ? _isHovering[7] = true
                                                      : _isHovering[7] = false;
                                                });
                                              },
                                              onTap: () {},
                                              child: StyledText(
                                                text: 'better result',
                                                style: TextStyle(
                                                  fontFamily: 'Berghan',
                                                  fontSize: 56,
                                                  fontWeight: _isHovering[7]
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 1
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                            )),
                                            'hover2':
                                                StyledTextWidgetTag(InkWell(
                                              onHover: (value) {
                                                setState(() {
                                                  value
                                                      ? _isHovering[8] = true
                                                      : _isHovering[8] = false;
                                                });
                                              },
                                              onTap: () {},
                                              child: StyledText(
                                                text: 'a great cause',
                                                style: TextStyle(
                                                  fontFamily: 'Berghan',
                                                  fontSize: 56,
                                                  fontWeight: _isHovering[8]
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 1
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                            )),
                                            'bold': StyledTextTag(
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            'italic': StyledTextTag(
                                                style: TextStyle(
                                                    fontStyle:
                                                        FontStyle.italic)),
                                            'dude': StyledTextTag(
                                              style: TextStyle(
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 1
                                                  ..color = Colors.black,
                                              ),
                                            ),
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              RunningText(
                                runText: runText,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: AnimateGradient(
                                  primaryBegin: Alignment.topLeft,
                                  primaryEnd: Alignment.bottomLeft,
                                  secondaryBegin: Alignment.bottomLeft,
                                  secondaryEnd: Alignment.topRight,
                                  primaryColors: const [
                                    Colors.pink,
                                    Colors.pinkAccent,
                                    Colors.white,
                                  ],
                                  secondaryColors: const [
                                    Colors.white,
                                    Colors.blueAccent,
                                    Colors.blue,
                                  ],
                                  child: Container(
                                    height: 989,
                                    width: screenSize.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 58, vertical: 85),
                                            child: StyledText(
                                              maxLines: 70,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontFamily: 'Berghan',
                                                  fontSize: 76,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.white,
                                                  letterSpacing: 0.02),
                                              text:
                                                  '''QUN STUDIOS is a creative design agency specializing in crafting unique brand identities and experiences. 
                                        
Our mission is to accompany brands and tell stories that deepen engagement through impactful design.''',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    height: 787,
                                    width: screenSize.width,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/qun_studio_assets/bgMenuStudio.png'),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Color.fromARGB(255, 138, 136, 136)
                                                .withOpacity(0.7),
                                            BlendMode.dstATop),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 100),
                                    child: Container(
                                      height: 127,
                                      width: 230,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/qun_studio_assets/LogoQunStudio.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                  Positioned(
                                    top: 300,
                                    left: 60,
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      width: 520,
                                      height: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 510,
                                            height: 70,
                                            alignment: Alignment.centerLeft,
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pushNamed(context,
                                                      '/SpiritLoading'),
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
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
                                                  text:
                                                      '<dude>Who We Are</dude>',
                                                  tags: {
                                                    'dude': StyledTextTag(
                                                      style: TextStyle(
                                                          foreground: Paint()
                                                            ..style =
                                                                PaintingStyle
                                                                    .stroke
                                                            ..strokeWidth = 1.5
                                                            ..color =
                                                                Colors.white),
                                                    ),
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 510,
                                            height: 70,
                                            alignment: Alignment.centerLeft,
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pushNamed(context,
                                                      '/ImaginationLoading'),
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
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
                                                  text:
                                                      '<dude>Portfolio</dude>',
                                                  tags: {
                                                    'dude': StyledTextTag(
                                                      style: TextStyle(
                                                          foreground: Paint()
                                                            ..style =
                                                                PaintingStyle
                                                                    .stroke
                                                            ..strokeWidth = 1.5
                                                            ..color =
                                                                Colors.white),
                                                    ),
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 510,
                                            height: 70,
                                            alignment: Alignment.centerLeft,
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pushNamed(context,
                                                      '/BuildTogether'),
                                              child: FittedBox(
                                                fit: BoxFit.cover,
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
                                                  text:
                                                      '<dude>News & Media</dude>',
                                                  tags: {
                                                    'dude': StyledTextTag(
                                                      style: TextStyle(
                                                          foreground: Paint()
                                                            ..style =
                                                                PaintingStyle
                                                                    .stroke
                                                            ..strokeWidth = 1.5
                                                            ..color =
                                                                Colors.white),
                                                    ),
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 510,
                                            height: 70,
                                            alignment: Alignment.centerLeft,
                                            child: TextButton(
                                              onPressed: () =>
                                                  Navigator.pushNamed(context,
                                                      '/EvolutionLoading'),
                                              child: FittedBox(
                                                fit: BoxFit.fitWidth,
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
                                                    'dude': StyledTextTag(
                                                      style: TextStyle(
                                                          foreground: Paint()
                                                            ..style =
                                                                PaintingStyle
                                                                    .stroke
                                                            ..strokeWidth = 1.5
                                                            ..color =
                                                                Colors.white),
                                                    ),
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 690),
                                    child: Container(
                                      width: screenSize.width,
                                      child: Divider(
                                        color: Colors.white, //color of divider
                                        height: 5, //height spacing of divider
                                        thickness: 3, //thickness of divier line
                                        indent:
                                            0, //spacing at the start of divider
                                        endIndent:
                                            0, //spacing at the end of divider
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 730, left: 60),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                        InkWell(
                                          onTap: () => setState(() {
                                            _launchWA();
                                          }),
                                          child: Text(
                                            '+62 813-1235-9233',
                                            maxLines: 3,
                                            style: TextStyle(
                                              fontFamily: 'Physis-Light',
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 1,
                                            ),
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
                                        Expanded(
                                          child: InkWell(
                                            onTap: () => setState(() {
                                              _launchUrl();
                                            }),
                                            child: Text(
                                              'hello@qunstudio.com',
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontFamily: 'Physis-Light',
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              FittedBox(fit: BoxFit.cover, child: BtmBar()),
                            ],
                          ),
                          Container(
                            alignment: Alignment(-0.1, 0),
                            child: Container(
                                width: _isHovering[7] ? 400 : 0,
                                height: _isHovering[7] ? 300 : 0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                          ),
                          Container(
                            alignment: Alignment(0.8, 0),
                            child: Container(
                                width: _isHovering[8] ? 400 : 0,
                                height: _isHovering[8] ? 300 : 0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl2),
                                    fit: BoxFit.fitWidth,
                                  ),
                                )),
                          ),
                        ],
                      );
                    },
                  );
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
    */