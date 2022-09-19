import 'package:aplikasi_website_qun/Admin/main_screens/add_AboutStudio.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/about.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:aplikasi_website_qun/QunStudio/widgets/network_player.dart';

import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/qun_studio_assets/Rectangle 52.png',
  'assets/qun_studio_assets/Rectangle 52.png',
  'assets/qun_studio_assets/Rectangle 52.png',
];

class readAboutStudio extends StatefulWidget {
  const readAboutStudio({Key? key}) : super(key: key);

  @override
  State<readAboutStudio> createState() => _readAboutStudioState();
}

class _readAboutStudioState extends State<readAboutStudio> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('aboutStudio');
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

  void initState() {
    item = List.generate(5, (index) => index.toDouble());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      imgList.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();

    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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

                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 50,
                                  ),
                                  Container(
                                    child: Text(
                                      'About Studio',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
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
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) => addAboutStudio(
                                                      id: docId,
                                                      desc: desc,
                                                      imageHover1: imageHover1,
                                                      imageHover2: imageHover2,
                                                      imageHover3: imageHover3,
                                                      imageUrl: imageUrl1,
                                                      imageUrl2: imageUrl2,
                                                      imageUrl3: imageUrl3,
                                                      paragraf1: paragraf1,
                                                      paragraf2: paragraf2,
                                                      paragraf3: paragraf3,
                                                      title: title,
                                                      videoLink: videoLink,
                                                      title1: title1,
                                                      title2: title2,
                                                      title3: title3,
                                                    )));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Edit',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontFamily: 'Rubik',
                                                  fontSize: 16,
                                                  letterSpacing:
                                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                              Container(
                                width: 1086,
                                height: 160,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 311,
                                      height: 180,
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
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 311,
                                      height: 180,
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
                                      width: 332,
                                      height: 180,
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
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
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
                                height: 1030,
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
                                          decoration: TextDecoration.underline,
                                          fontSize: 42,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 128,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 14,
                                            child: Text(
                                              '01',
                                              maxLines: 70,
                                              style: TextStyle(
                                                fontFamily: 'Physis-Black',
                                                color: Color(0xff499fd6),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.3,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 116,
                                                    height: 100,
                                                    child: TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        title,
                                                        maxLines: 70,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Physis-Black',
                                                          color:
                                                              Color(0xff499fd6),
                                                          fontSize: 42,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          letterSpacing: 0.3,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Container(
                                                      width: 377,
                                                      height: 293,
                                                      child: Text(
                                                        desc,
                                                        maxLines: 70,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Physis-Light',
                                                          color:
                                                              Color(0xff499fd6),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          letterSpacing: 0.3,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          NetworkPlayerWidget(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                    ),
                  );
                })),
      ),
    );
  }
}
