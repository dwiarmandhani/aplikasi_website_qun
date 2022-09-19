import 'package:aplikasi_website_qun/Admin/main_screens/add_AboutFilms.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/portfolio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

late VideoPlayerController _controller;
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

class readAboutFilmsInput extends StatefulWidget {
  const readAboutFilmsInput({Key? key}) : super(key: key);

  @override
  State<readAboutFilmsInput> createState() => _readAboutFilmsInputState();
}

class _readAboutFilmsInputState extends State<readAboutFilmsInput> {
  CollectionReference ref = FirebaseFirestore.instance.collection('aboutFilm');
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 179, 151, 255),
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
                        String photoProduction = homeInfo['photoProduction'];
                        String postProduction = homeInfo['postProduction'];
                        String preProduction = homeInfo['preProduction'];
                        String videoProduction = homeInfo['videoProduction'];

                        return Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 50,
                                  ),
                                  Container(
                                    child: Text(
                                      'About Films',
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
                                                builder: (c) => addAboutFilms(
                                                      id: docId,
                                                      concept: concept,
                                                      desc: desc,
                                                      imageHover1: imageHover1,
                                                      imageHover2: imageHover2,
                                                      imageHover3: imageHover3,
                                                      imageHover4: imageHover4,
                                                      imageHover5: imageHover5,
                                                      imageHover6: imageHover6,
                                                      imageHover7: imageHover7,
                                                      imageHover8: imageHover8,
                                                      paragraf1: paragraf1,
                                                      paragraf2: paragraf2,
                                                      photoProduction:
                                                          photoProduction,
                                                      postProduction:
                                                          postProduction,
                                                      preProduction:
                                                          preProduction,
                                                      title: title,
                                                      videoProduction:
                                                          videoProduction,
                                                      videoUrl: videoUrl,
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
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'Paragraf 1 (QUN FILMS)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 1291,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    paragraf1,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Rubik',
                                        fontSize: 24,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  ),
                                )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 16),
                              child: Text(
                                'Paragraf 2 (SUB PARAGRAF)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 1291,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    paragraf2,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Rubik',
                                        fontSize: 24,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  ),
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'WHAT WE DO',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 48,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 200, right: 200),
                              child: Row(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 16),
                                          child: Text(
                                            'Documentary (Hover)',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontFamily: 'Agentur',
                                                fontSize: 24,
                                                decoration:
                                                    TextDecoration.underline,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ),
                                        ),
                                        Container(
                                            width: 133,
                                            height: 199,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  2, 0, 2, 0),
                                              child: Image.asset(
                                                  'assets/images/Layer11.png'),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: Text(
                                          'Feature Film (Hover)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Agentur',
                                              fontSize: 24,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          width: 133,
                                          height: 199,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Image.asset(
                                                'assets/images/Layer11.png'),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: Text(
                                          'Short Films (Hover)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Agentur',
                                              fontSize: 24,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          width: 133,
                                          height: 199,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Image.asset(
                                                'assets/images/Layer11.png'),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: Text(
                                          'TVC (Hover)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Agentur',
                                              fontSize: 24,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          width: 133,
                                          height: 199,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Image.asset(
                                                'assets/images/Layer11.png'),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 200, right: 200),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: Text(
                                          'Campaign/Digital\nCampaign (Hover)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Agentur',
                                              fontSize: 24,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          width: 133,
                                          height: 199,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Image.asset(
                                                'assets/images/Layer11.png'),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: Text(
                                          'Digital\nAdvertising (Hover)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Agentur',
                                              fontSize: 24,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          width: 133,
                                          height: 199,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Image.asset(
                                                'assets/images/Layer11.png'),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: Text(
                                          'Branding (Hover)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Agentur',
                                              fontSize: 24,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          width: 133,
                                          height: 199,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Image.asset(
                                                'assets/images/Layer11.png'),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 16),
                                        child: Text(
                                          'Music Video (Hover)',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontFamily: 'Agentur',
                                              fontSize: 24,
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      Container(
                                          width: 133,
                                          height: 199,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Image.asset(
                                                'assets/images/Layer11.png'),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'SERVICES',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 48,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'Concept',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 1291,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    concept,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Rubik',
                                        fontSize: 24,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  ),
                                )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'Pre-Production',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 1291,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    preProduction,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Rubik',
                                        fontSize: 24,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'Photo Production',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 1291,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    photoProduction,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Rubik',
                                        fontSize: 24,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'Video Production',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 1291,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    videoProduction,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Rubik',
                                        fontSize: 24,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'Post Production',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 1291,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    border: Border.all(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    postProduction,
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 100,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Rubik',
                                        fontSize: 24,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 /*PERCENT not supported*/
                                        ),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'SUBSIDIARY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 48,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ),
                            FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  height: 442,
                                  width: screenSize.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(
                                          flex: 1,
                                          fit: FlexFit.loose,
                                          child: Container(
                                              height: 422,
                                              width: 410,
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                            '01',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(0,
                                                                        0, 0, 1),
                                                                fontFamily:
                                                                    'Rubik',
                                                                fontSize: 14,
                                                                letterSpacing:
                                                                    4 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                height: 1),
                                                          ))),
                                                  Container(
                                                      alignment:
                                                          Alignment(-0.8, 0),
                                                      child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: TextButton(
                                                              onHover: (value) {
                                                                setState(() {
                                                                  value
                                                                      ? _isHovering[
                                                                              5] =
                                                                          true
                                                                      : _isHovering[
                                                                              5] =
                                                                          false;
                                                                });
                                                              },
                                                              onPressed: () {},
                                                              child: Text(
                                                                title,
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
                                                                        42,
                                                                    letterSpacing:
                                                                        4 /*percentages not used in flutter. defaulting to zero*/,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900,
                                                                    height: 1),
                                                              )))),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            35, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: _isHovering[5]
                                                              ? 150
                                                              : 0,
                                                          child: Divider(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            thickness: 2,
                                                            indent: 0,
                                                            endIndent: 20,
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            _isHovering[5]
                                                                ? 'GO TO WEBSITE'
                                                                : '',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(0,
                                                                        0, 0, 1),
                                                                fontFamily:
                                                                    'Rubik',
                                                                fontSize: 10,
                                                                letterSpacing:
                                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                      child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      desc,
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 100,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                          fontFamily: 'Rubik',
                                                          fontSize: 16,
                                                          letterSpacing:
                                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height: 1),
                                                    ),
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
                                            width: 800,
                                            height: 422,
                                            child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    child: _controller
                                                            .value.isInitialized
                                                        ? AspectRatio(
                                                            aspectRatio:
                                                                _controller
                                                                    .value
                                                                    .aspectRatio,
                                                            child: VideoPlayer(
                                                                _controller),
                                                          )
                                                        : Container(),
                                                  ),
                                                  InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _controller.value
                                                                  .isPlaying
                                                              ? _controller
                                                                  .pause()
                                                              : _controller
                                                                  .play();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 125,
                                                        height: 125,
                                                        child: Image.asset(_controller
                                                                .value.isPlaying
                                                            ? 'assets/images/PauseIcon.png'
                                                            : 'assets/images/PlayIcon.png'),
                                                      )
                                                      // Icon(_controller.value.isPlaying
                                                      //     ? Icons.pause
                                                      //     : Icons.play_arrow),
                                                      ),
                                                ]),
                                          )),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 100,
                            )
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
              }),
        ),
      ),
    );
  }
}
