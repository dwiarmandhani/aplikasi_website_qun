import 'package:animate_gradient/animate_gradient.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/bottom_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/btm_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/carousel.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/featured_heading.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/featured_tiles.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/floating_quick_access_bar.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/main_heading.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/menuStudio.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/menu_drawer.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/running_text.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/top_bar_contents.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:styled_text/styled_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPortoStudio extends StatefulWidget {
  static const routeName = '/DetailPortoStudio';
  const DetailPortoStudio(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.deliverable,
      required this.client,
      required this.challenge,
      required this.solution,
      required this.desc,
      required this.imageUrl,
      required this.imageUrl1,
      required this.imageUrl2,
      required this.imageUrl3,
      required this.imageUrl4,
      required this.imageUrl5,
      required this.imageUrl6,
      required this.imageUrl7,
      required this.id})
      : super(key: key);

  final String id,
      title,
      subtitle,
      deliverable,
      client,
      challenge,
      solution,
      desc,
      imageUrl,
      imageUrl1,
      imageUrl2,
      imageUrl3,
      imageUrl4,
      imageUrl5,
      imageUrl6,
      imageUrl7;

  @override
  State<DetailPortoStudio> createState() => _DetailPortoStudioState();
}

final List<Stack> portoList = [
  Stack(),
  Stack(),
];

class _DetailPortoStudioState extends State<DetailPortoStudio> {
  final CarouselController _sliderImage = CarouselController();
  final List _isHovering = [
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
  void initState() {
    super.initState();
  }

  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('portfolioStudio');
    final CarouselController _controller = CarouselController();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: TopBarContents(_opacity),
      ),
      endDrawer: const menuStudio(),
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                        width: screenSize.width,
                        height: 822,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl),
                              fit: BoxFit.cover),
                        )),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 75,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                            child: InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, '/PortfolioQunStudio'),
                              child: const Text(
                                '< Back',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        255, 255, 255, 0.6000000238418579),
                                    fontFamily: 'Rubik',
                                    fontSize: 20,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
                                    height: 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 250,
                          ),
                          /*Container(
                            padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                            child: StyledText(
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontFamily: 'Physis-Black',
                                  fontSize: 64,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                text: widget.title,
                                tags: {
                                  'bold': StyledTextTag(
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  'dude': StyledTextTag(
                                    style: TextStyle(
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 1
                                        ..color = Colors.white,
                                    ),
                                  ),
                                }),
                          ),
                        */
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width,
                padding: const EdgeInsets.all(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: const Text(
                                'Client',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(57, 118, 66, 1),
                                    fontFamily: 'Physis-Black',
                                    fontSize: 24,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.2916666666666667),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                widget.client,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color:
                                        const Color.fromRGBO(63, 157, 206, 1),
                                    fontFamily: 'Physis-Black',
                                    fontSize: 36,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 0.8611111111111112),
                              ),
                            )),
                            const SizedBox(
                              height: 180,
                            ),
                            Container(
                              child: const Text(
                                'Deliverables',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: const Color.fromRGBO(57, 118, 66, 1),
                                    fontFamily: 'Physis-Black',
                                    fontSize: 24,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.2916666666666667),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  '''${widget.deliverable}''',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      color:
                                          const Color.fromRGBO(66, 153, 194, 1),
                                      fontFamily: 'Physis-Light',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.9375),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 605,
                              child: Text(
                                '''${widget.desc}''',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    color: Color.fromRGBO(66, 153, 194, 1),
                                    fontFamily: 'Physis-Light',
                                    fontSize: 16,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5625),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 605,
                              child: const Text(
                                'Challenges',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(57, 118, 66, 1),
                                    fontFamily: 'Physis-Black',
                                    fontSize: 24,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.2916666666666667),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 605,
                                child: Text(
                                  '''${widget.challenge}''',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(66, 153, 194, 1),
                                      fontFamily: 'Physis-Light',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5625),
                                )),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              width: 605,
                              child: const Text(
                                'Solution',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: const Color.fromRGBO(57, 118, 66, 1),
                                    fontFamily: 'Physis-Black',
                                    fontSize: 24,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.2916666666666667),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: 605,
                                child: Text(
                                  '''${widget.solution}''',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      color:
                                          const Color.fromRGBO(66, 153, 194, 1),
                                      fontFamily: 'Physis-Light',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5625),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 400,
                        width: 750,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl1),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl2),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl3),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 400,
                        width: 750,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl4),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 599,
                        width: 1166,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl5),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 400,
                        width: 750,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl6),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(196, 196, 196, 1),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl7),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //
              const BtmBar()
            ],
          ),
        ),
      ),
    );
  }
}

// TextStyle(
//                     color: Color.fromRGBO(255, 255, 255, 1),
//                     fontFamily: 'Archivo',
//                     fontSize: 64,
//                     letterSpacing:
//                         0 /*percentages not used in flutter. defaulting to zero*/,
//                     fontWeight: FontWeight.normal,
//                     height: 0.484375),
