import 'package:aplikasi_website_qun/Admin/main_screens/add_HomeStudio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/add_LandingPageFilms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marquee/marquee.dart';
import 'package:styled_text/styled_text.dart';

class readHomeStudio extends StatefulWidget {
  const readHomeStudio({Key? key}) : super(key: key);

  @override
  State<readHomeStudio> createState() => _readHomeStudioState();
}

class _readHomeStudioState extends State<readHomeStudio> {
  CollectionReference ref = FirebaseFirestore.instance.collection('homeStudio');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
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

                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    height: 100,
                                    width: 50,
                                  ),
                                  Container(
                                    child: const Text(
                                      'Home Studio Editor',
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
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) => addHomeStudio(
                                                      id: docId,
                                                      runningText: runText,
                                                      imageUrl1: imageUrl,
                                                      imageUrl2: imageUrl2,
                                                    )));
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
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
                                  const SizedBox(
                                    width: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 60, right: 58),
                                child: StyledText(
                                  maxLines: 70,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontFamily: 'Berghan', fontSize: 58),
                                  text:
                                      '''<bold>Welcome to your next stop in effective branding and design, a place where changes are made for a <dude>better result</dude> and <dude>a great cause.</dude></bold>''',
                                  tags: {
                                    'bold': StyledTextTag(
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    'italic': StyledTextTag(
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic)),
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
                              const SizedBox(
                                height: 100,
                              ),
                              // Running Text View

                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 4,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => addHomeStudio(
                                                    id: docId,
                                                    runningText: runText,
                                                    imageUrl1: imageUrl,
                                                    imageUrl2: imageUrl2,
                                                  )));
                                    },
                                    child: Marquee(
                                      text: runText,
                                      style: const TextStyle(
                                        fontFamily: 'Berghan',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                        letterSpacing: 4,
                                      ),
                                      scrollAxis: Axis.horizontal,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      blankSpace: 20.0,
                                      velocity: 100.0,
                                      pauseAfterRound:
                                          const Duration(seconds: 0),
                                      startPadding: 10.0,
                                      accelerationDuration:
                                          const Duration(seconds: 3),
                                      accelerationCurve: Curves.linear,
                                      decelerationDuration:
                                          const Duration(milliseconds: 500),
                                      decelerationCurve: Curves.easeOut,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 4,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ]);
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
      )),
    );
  }
}
