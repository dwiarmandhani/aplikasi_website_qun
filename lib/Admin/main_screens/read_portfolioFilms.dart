import 'package:aplikasi_website_qun/Admin/main_screens/edit_portfolioFilm.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/portfolio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'add_portfolioFilm.dart';

class readFilmsPortfolio extends StatefulWidget {
  const readFilmsPortfolio({Key? key}) : super(key: key);

  @override
  State<readFilmsPortfolio> createState() => _readFilmsPortfolioState();
}

class _readFilmsPortfolioState extends State<readFilmsPortfolio> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('portfoliofilm');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 100,
                width: 50,
              ),
              Container(
                child: const Text(
                  'Portfolio Films',
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
              const Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => addPortfolioFilms()));
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Add Portfolio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
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
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.70,
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
                      var portInfo = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      String docId = snapshot.data!.docs[index].id;
                      String title = portInfo['title'];
                      String desc = portInfo['directedBy'];
                      String imageUrl = portInfo['imageUrl'];
                      String imageUrl2 = portInfo['imageUrl2'];
                      String imageUrl3 = portInfo['imageUrl3'];
                      String imageUrl4 = portInfo['imageUrl4'];
                      String imageUrl5 = portInfo['imageUrl5'];
                      String imageUrl6 = portInfo['imageUrl6'];
                      String imageUrl7 = portInfo['imageUrl7'];
                      String imageUrl8 = portInfo['imageUrl8'];
                      String imageUrl9 = portInfo['imageUrl9'];
                      String imageUrl10 = portInfo['imageUrl10'];
                      String cat = portInfo['cat'];
                      String year = portInfo['year'];
                      String synopsis = portInfo['synopsis'];
                      String trailerLink = portInfo['trailer'];
                      String starring1 = portInfo['starring1'];
                      String starring2 = portInfo['starring2'];
                      String starring3 = portInfo['starring3'];
                      String starring4 = portInfo['starring4'];
                      String starring5 = portInfo['starring5'];
                      String starring6 = portInfo['starring6'];
                      String starring7 = portInfo['starring7'];
                      String starring8 = portInfo['starring8'];
                      String starring9 = portInfo['starring9'];
                      String starring10 = portInfo['starring10'];

                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => EditPortfolioFilm(
                                          id: docId,
                                          category: cat,
                                          imageUrl: imageUrl,
                                          imageUrl2: imageUrl2,
                                          imageUrl3: imageUrl3,
                                          imageUrl4: imageUrl4,
                                          imageUrl5: imageUrl5,
                                          imageUrl6: imageUrl6,
                                          imageUrl7: imageUrl7,
                                          imageUrl8: imageUrl8,
                                          imageUrl9: imageUrl9,
                                          imageUrl10: imageUrl10,
                                          title: title,
                                          year: year,
                                          synopsis: synopsis,
                                          trailerLink: trailerLink,
                                          directedBy: desc,
                                          starring1: starring1,
                                          starring2: starring2,
                                          starring3: starring3,
                                          starring4: starring4,
                                          starring5: starring5,
                                          starring6: starring6,
                                          starring7: starring7,
                                          starring8: starring8,
                                          starring9: starring9,
                                          starring10: starring10,
                                        )),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    desc,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
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
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
