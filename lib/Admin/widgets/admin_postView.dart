import 'package:aplikasi_website_qun/Admin/main_screens/edit_news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// class articleList {
//   final String image, title, description, categoryList;
//   final int id;

//   CollectionReference ref = FirebaseFirestore.instance.collection('news');

//   articleList(
//       {required this.id,
//       required this.image,
//       required this.title,
//       required this.description,
//       required this.categoryList});
// }

// List<articleList> myList = [
//   articleList(
//     id: 1,
//     title: "Qun News",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/qunnews.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 2,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 3,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 4,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 5,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/qunnews.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 6,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 7,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/qunnews.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 8,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/qunnews.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 9,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 10,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 11,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
//   articleList(
//     id: 12,
//     title: "Waiting for Orpa",
//     description: '''This is the short description for the
// blog that will be displayed shortly
// and brief. Please fill this short
// description as short and clear
// as possible.''',
//     image: "assets/images/waitingfororpa.png",
//     categoryList: "News",
//   ),
// ];

class adminPostView extends StatefulWidget {
  const adminPostView({Key? key}) : super(key: key);

  @override
  State<adminPostView> createState() => _adminPostViewState();
}

class _adminPostViewState extends State<adminPostView> {
  CollectionReference ref = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 70, 45, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: ref.orderBy('createdAt', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var homeInfo = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    String docId = snapshot.data!.docs[index].id;
                    String title = homeInfo['title'];
                    String desc = homeInfo['desc'];
                    String link = homeInfo['link'];
                    int categoryName = homeInfo['categoryName'];
                    String imageUrl = homeInfo['imageUrl'];
                    Uri _url = Uri.parse(homeInfo['link']);

                    return Container(
                      width: 360,
                      height: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => editNews(
                                              categoryName:
                                                  categoryName.toString(),
                                              desc: desc,
                                              id: docId,
                                              imageUrl: imageUrl,
                                              title: title,
                                              link: link,
                                            )));
                              },
                              child: ClipRRect(
                                child: Image.network(
                                  imageUrl,
                                  height: 190,
                                  width: 320,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              desc,
                              textAlign: TextAlign.justify,
                              maxLines: 6,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: categoryName == 0
                                ? Text(
                                    'Media Coverage',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.6000000238418579),
                                        fontFamily: 'Rubik',
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )
                                : Text(
                                    'Upcoming Release',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.6000000238418579),
                                        fontFamily: 'Rubik',
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            );
          }),
    );
  }
}

class adminPostViewCatZero extends StatefulWidget {
  const adminPostViewCatZero({Key? key}) : super(key: key);

  @override
  State<adminPostViewCatZero> createState() => _adminPostViewCatZeroState();
}

class _adminPostViewCatZeroState extends State<adminPostViewCatZero> {
  CollectionReference ref = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 70, 45, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: ref.where('categoryName', isEqualTo: 0).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var homeInfo = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    String docId = snapshot.data!.docs[index].id;
                    String title = homeInfo['title'];
                    String desc = homeInfo['desc'];
                    String link = homeInfo['link'];
                    Uri _url = Uri.parse(homeInfo['link']);

                    int categoryName = homeInfo['categoryName'];

                    String imageUrl = homeInfo['imageUrl'];

                    return Container(
                      width: 360,
                      height: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => editNews(
                                              categoryName:
                                                  categoryName.toString(),
                                              desc: desc,
                                              id: docId,
                                              imageUrl: imageUrl,
                                              title: title,
                                              link: link,
                                            )));
                              },
                              child: ClipRRect(
                                child: Image.network(
                                  imageUrl,
                                  height: 190,
                                  width: 320,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              desc,
                              textAlign: TextAlign.justify,
                              maxLines: 6,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: categoryName == 0
                                ? Text(
                                    'Media Coverage',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.6000000238418579),
                                        fontFamily: 'Rubik',
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )
                                : Text(
                                    'Upcoming Release',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.6000000238418579),
                                        fontFamily: 'Rubik',
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            );
          }),
    );
  }
}

class adminPostViewCatOne extends StatefulWidget {
  const adminPostViewCatOne({Key? key}) : super(key: key);

  @override
  State<adminPostViewCatOne> createState() => _adminPostViewCatOneState();
}

class _adminPostViewCatOneState extends State<adminPostViewCatOne> {
  CollectionReference ref = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 70, 45, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: ref.where('categoryName', isEqualTo: 1).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var homeInfo = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    String docId = snapshot.data!.docs[index].id;
                    String title = homeInfo['title'];
                    String desc = homeInfo['desc'];
                    String link = homeInfo['link'];
                    Uri _url = Uri.parse(homeInfo['link']);

                    int categoryName = homeInfo['categoryName'];

                    String imageUrl = homeInfo['imageUrl'];

                    return Container(
                      width: 360,
                      height: 450,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 5,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (c) => editNews(
                                              categoryName:
                                                  categoryName.toString(),
                                              desc: desc,
                                              id: docId,
                                              imageUrl: imageUrl,
                                              title: title,
                                              link: link,
                                            )));
                              },
                              child: ClipRRect(
                                child: Image.network(
                                  imageUrl,
                                  height: 190,
                                  width: 320,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              title,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 3,
                            child: Text(
                              desc,
                              textAlign: TextAlign.justify,
                              maxLines: 6,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: categoryName == 0
                                ? Text(
                                    'Media Coverage',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.6000000238418579),
                                        fontFamily: 'Rubik',
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  )
                                : Text(
                                    'Upcoming Release',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                            0, 0, 0, 0.6000000238418579),
                                        fontFamily: 'Rubik',
                                        fontSize: 20,
                                        decoration: TextDecoration.underline,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            );
          }),
    );
  }
}
