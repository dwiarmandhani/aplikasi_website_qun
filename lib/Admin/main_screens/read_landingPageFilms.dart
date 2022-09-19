import 'package:aplikasi_website_qun/Admin/main_screens/add_LandingPageStudio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/add_contactInput.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:video_player/video_player.dart';

import 'add_LandingPageFilms.dart';

late VideoPlayerController _controller;

class LandingPageFilmsRead extends StatefulWidget {
  const LandingPageFilmsRead({Key? key}) : super(key: key);

  @override
  State<LandingPageFilmsRead> createState() => _LandingPageFilmsReadState();
}

class _LandingPageFilmsReadState extends State<LandingPageFilmsRead> {
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
    CollectionReference ref =
        FirebaseFirestore.instance.collection('landingFilm');
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                        String desc = homeInfo['desc'];
                        String imageUrl = homeInfo['imageUrl'];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Landing Page Film Editor',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontFamily: 'Rubik',
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
                                                builder: (c) =>
                                                    LandingPageFilmsAdd(
                                                      id: docId,
                                                      desc: desc,
                                                      imageUrl: imageUrl,
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
                            SizedBox(
                              width: 100,
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 8, vertical: 16),
                            //   child: Text(
                            //     'Video Landing Page',
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(
                            //         color: Color.fromARGB(255, 0, 0, 0),
                            //         fontFamily: 'Agentur',
                            //         fontSize: 24,
                            //         decoration: TextDecoration.underline,
                            //         letterSpacing:
                            //             0 /*percentages not used in flutter. defaulting to zero*/,
                            //         fontWeight: FontWeight.bold,
                            //         height: 1),
                            //   ),
                            // ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Container(
                            //     width: 1291,
                            //     alignment: Alignment.center,
                            //     padding: EdgeInsets.all(10),
                            //     decoration: BoxDecoration(
                            //       color: Color.fromARGB(255, 255, 255, 255),
                            //       border: Border.all(
                            //           color: Color.fromARGB(255, 0, 0, 0),
                            //           width: 2.0,
                            //           style: BorderStyle.solid),
                            //       borderRadius: BorderRadius.all(
                            //         Radius.circular(10),
                            //       ),
                            //     ),
                            //     child: Stack(
                            //         alignment: Alignment.center,
                            //         children: [
                            //           Container(
                            //             child: _controller.value.isInitialized
                            //                 ? AspectRatio(
                            //                     aspectRatio: _controller
                            //                         .value.aspectRatio,
                            //                     child: VideoPlayer(_controller),
                            //                   )
                            //                 : Container(),
                            //           ),
                            //           InkWell(
                            //               onTap: () {
                            //                 setState(() {
                            //                   _controller.value.isPlaying
                            //                       ? _controller.pause()
                            //                       : _controller.play();
                            //                 });
                            //               },
                            //               child: Container(
                            //                 width: 125,
                            //                 height: 125,
                            //                 child: Image.asset(_controller
                            //                         .value.isPlaying
                            //                     ? 'assets/images/PauseIcon.png'
                            //                     : 'assets/images/PlayIcon.png'),
                            //               )
                            //               // Icon(_controller.value.isPlaying
                            //               //     ? Icons.pause
                            //               //     : Icons.play_arrow),
                            //               ),
                            //         ]),
                            //   ),
                            // ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(
                                'Deskripsi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Agentur',
                                    fontSize: 24,
                                    decoration: TextDecoration.underline,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.bold,
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
                                  desc,
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
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              height: 50,
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
              }),
        ),
      ),
    );
  }
}
