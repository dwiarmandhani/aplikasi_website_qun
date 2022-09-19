import 'package:aplikasi_website_qun/Admin/models/portofolio_model.dart';
import 'package:aplikasi_website_qun/DetailPortpofio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/portfolio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class PortSquare extends StatefulWidget {
  @override
  State<PortSquare> createState() => _PortSquareState();
}

class _PortSquareState extends State<PortSquare> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('portfolioStudio');
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
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: ref.orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                int no = 1 + index;
                var portInfo =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                String docId = snapshot.data!.docs[index].id;
                String title = portInfo['title'];
                String desc = portInfo['desc'];
                String challenge = portInfo['challenge'];
                String solution = portInfo['solution'];
                String subtitle = portInfo['subtitle'];
                String deliverable = portInfo['deliverable'];
                String client = portInfo['client'];
                String imageUrl = portInfo['imageUrl'];
                String imageUrl1 = portInfo['imageUrl1'];
                String imageUrl2 = portInfo['imageUrl2'];
                String imageUrl3 = portInfo['imageUrl3'];
                String imageUrl4 = portInfo['imageUrl4'];
                String imageUrl5 = portInfo['imageUrl5'];
                String imageUrl6 = portInfo['imageUrl6'];
                String imageUrl7 = portInfo['imageUrl7'];

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      child: Divider(
                        thickness: 3,
                        color: Color(0xff17A0DA),
                      ),
                    ),
                    Container(
                      width: screenSize.width,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100, 100, 100, 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 600,
                                width: MediaQuery.of(context).size.width * .5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 600,
                                      alignment: Alignment(-0.98, 0),
                                      child: StyledText(
                                        text: '<dude>${no}</dude>',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Physis-Black',
                                          fontSize: 56,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        tags: {
                                          'dude': StyledTextTag(
                                            style: TextStyle(
                                                fontSize: 56,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 2
                                                  ..color = Color(0xff4299C2)),
                                          )
                                        },
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 800,
                                      color: Colors.white,
                                      alignment: Alignment(-1, 0),
                                      child: InkWell(
                                        focusColor: Colors.white,
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPortoStudio(
                                                title: title,
                                                subtitle: subtitle,
                                                id: docId,
                                                desc: desc,
                                                challenge: challenge,
                                                client: client,
                                                deliverable: deliverable,
                                                solution: solution,
                                                imageUrl: imageUrl,
                                                imageUrl1: imageUrl1,
                                                imageUrl2: imageUrl2,
                                                imageUrl3: imageUrl3,
                                                imageUrl4: imageUrl4,
                                                imageUrl5: imageUrl5,
                                                imageUrl6: imageUrl6,
                                                imageUrl7: imageUrl7,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          title,
                                          maxLines: 5,
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: GoogleFonts.archivo(
                                            fontSize: 64,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff4299C2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 800,
                                      alignment: Alignment(-0.95, 0),
                                      child: Text(
                                        desc,
                                        maxLines: 70,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.archivo(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff4299C2),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 600,
                                height: 600,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DetailPortoStudio(
                                          title: title,
                                          subtitle: subtitle,
                                          id: docId,
                                          desc: desc,
                                          challenge: challenge,
                                          client: client,
                                          deliverable: deliverable,
                                          solution: solution,
                                          imageUrl: imageUrl,
                                          imageUrl1: imageUrl1,
                                          imageUrl2: imageUrl2,
                                          imageUrl3: imageUrl3,
                                          imageUrl4: imageUrl4,
                                          imageUrl5: imageUrl5,
                                          imageUrl6: imageUrl6,
                                          imageUrl7: imageUrl7,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
            ),
          );
        },
      ),
    );
  }
}
