import 'package:aplikasi_website_qun/Admin/main_screens/edit_news.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

//Pagination

class postView extends StatefulWidget {
  const postView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<postView> createState() => _postViewState();
}

class _postViewState extends State<postView> {
  CollectionReference ref = FirebaseFirestore.instance.collection('news');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(60, 70, 60, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: (widget.title != "" && widget.title != null)
              ? ref
                  .where("title",
                      isGreaterThanOrEqualTo: widget.title.toUpperCase())
                  .snapshots()
              : ref.orderBy('createdAt', descending: true).snapshots(),
          builder: (context, snapshot) {
            int totalArticle = snapshot.data!.docs.length;
            int articlePerPage = 12;
            int currentPage = 0;

            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, crossAxisSpacing: 12),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articlePerPage,
                        itemBuilder: (context, index) {
                          var homeInfo = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                          String docId = snapshot.data!.docs[index].id;
                          String title = homeInfo['title'];
                          String desc = homeInfo['desc'];
                          String link = homeInfo['link'];
                          int categoryName = homeInfo['categoryName'];
                          String imageUrl = homeInfo['imageUrl'];
                          final Uri _url = Uri.parse(link);
                          void _launchUrl() async {
                            if (!await launchUrl(_url))
                              throw 'Could not launch $_url';
                          }

                          return Container(
                            width: 360,
                            height: 450,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () => setState(() {
                                      _launchUrl();
                                    }),
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
                                              decoration:
                                                  TextDecoration.underline,
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
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            child: Text(
                              "Previous page",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.6000000238418579),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            onPressed: (currentPage - 1) >= 0
                                ? () {
                                    //lets not go bellow 0 :-)
                                    if (currentPage != 0) {
                                      setState(() {
                                        currentPage -= 1;
                                      });
                                    }
                                  }
                                : null,
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            child: Text(
                              "Next page",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(
                                      0, 0, 0, 0.6000000238418579),
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            onPressed: ((currentPage + 1) * articlePerPage) <
                                    totalArticle
                                ? () {
                                    if ((currentPage + 1) <
                                        totalArticle / articlePerPage) {
                                      setState(() {
                                        currentPage += 1;
                                      });
                                    }
                                  }
                                : null,
                          )
                        ]),
                  )
                ],
              );
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

class postViewCatZero extends StatefulWidget {
  const postViewCatZero({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<postViewCatZero> createState() => _postViewCatZeroState();
}

class _postViewCatZeroState extends State<postViewCatZero> {
  CollectionReference ref = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 70, 45, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: (widget.title != "" && widget.title != null)
              ? ref
                  .where("title",
                      isGreaterThanOrEqualTo: widget.title.toUpperCase())
                  .snapshots()
              : ref.where('categoryName', isEqualTo: 0).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              //
              int totalArticle = snapshot.data!.docs.length;
              int articlePerPage = 12;
              int currentPage = 0;

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 12),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: totalArticle,
                        itemBuilder: (context, index) {
                          var homeInfo = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                          String docId = snapshot.data!.docs[index].id;
                          String title = homeInfo['title'];
                          String desc = homeInfo['desc'];
                          String link = homeInfo['link'];
                          final Uri _url = Uri.parse(link);
                          void _launchUrl() async {
                            if (!await launchUrl(_url))
                              throw 'Could not launch $_url';
                          }

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
                                    onTap: () => setState(() {
                                      _launchUrl();
                                    }),
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
                                              decoration:
                                                  TextDecoration.underline,
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
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              child: Text(
                                "Previous page",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.6000000238418579),
                                    fontFamily: 'Rubik',
                                    fontSize: 20,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              onPressed: () {}),
                          SizedBox(width: 10),
                          TextButton(
                              child: Text(
                                "Next page",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.6000000238418579),
                                    fontFamily: 'Rubik',
                                    fontSize: 20,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              onPressed: () {})
                        ]),
                  )
                ],
              );
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

class postViewCatOne extends StatefulWidget {
  const postViewCatOne({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<postViewCatOne> createState() => _postViewCatOneState();
}

class _postViewCatOneState extends State<postViewCatOne> {
  CollectionReference ref = FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 70, 45, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: (widget.title != "" && widget.title != null)
              ? ref
                  .where("title",
                      isGreaterThanOrEqualTo: widget.title.toUpperCase())
                  .snapshots()
              : ref.where('categoryName', isEqualTo: 1).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
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
                          final Uri _url = Uri.parse(link);
                          void _launchUrl() async {
                            if (!await launchUrl(_url))
                              throw 'Could not launch $_url';
                          }

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
                                    onTap: () => setState(() {
                                      _launchUrl();
                                    }),
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
                                              decoration:
                                                  TextDecoration.underline,
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
                                              decoration:
                                                  TextDecoration.underline,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              child: Text(
                                "Previous page",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.6000000238418579),
                                    fontFamily: 'Rubik',
                                    fontSize: 20,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              onPressed: () {}),
                          SizedBox(width: 10),
                          TextButton(
                              child: Text(
                                "Next page",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.6000000238418579),
                                    fontFamily: 'Rubik',
                                    fontSize: 20,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              onPressed: () {})
                        ]),
                  )
                ],
              );
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
