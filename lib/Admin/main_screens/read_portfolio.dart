import 'package:aplikasi_website_qun/Admin/main_screens/edit_portfolio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_portfoplioStudioDetail.dart';
import 'package:aplikasi_website_qun/Admin/models/portofolio_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/portfolio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class ReadPortfolio extends StatefulWidget {
  @override
  State<ReadPortfolio> createState() => _ReadPortfolioState();
}

class _ReadPortfolioState extends State<ReadPortfolio> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('portfolioStudio');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
                children: [
                  Container(
                    height: 3,
                    width: 1258,
                    color: Color(0xff17A0DA),
                  ),
                  Container(
                    height: 1000,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 800,
                            width: MediaQuery.of(context).size.width * .5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      title,
                                      maxLines: 5,
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.archivo(
                                        fontSize: 64,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xff4299C2),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    child: Text(
                                      desc,
                                      maxLines: 70,
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.archivo(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff4299C2),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: 250,
                              height: 400,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EditPortfolio(
                                        id: docId,
                                        desc: desc,
                                        challenge: challenge,
                                        client: client,
                                        deliverable: deliverable,
                                        solution: solution,
                                        subtitle: subtitle,
                                        title: title,
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
                                  fit: BoxFit.fill,
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
    );
  }
}
