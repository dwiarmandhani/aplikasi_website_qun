import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class articleList {
  final String image, title, description, categoryList;
  final int id;

  articleList(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.categoryList});
}

List<articleList> myList = [
  articleList(
    id: 1,
    title: "Qun News",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/qunnews.png",
    categoryList: "News",
  ),
  articleList(
    id: 2,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
  articleList(
    id: 3,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
  articleList(
    id: 4,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
  articleList(
    id: 5,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/qunnews.png",
    categoryList: "News",
  ),
  articleList(
    id: 6,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
  articleList(
    id: 7,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/qunnews.png",
    categoryList: "News",
  ),
  articleList(
    id: 8,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/qunnews.png",
    categoryList: "News",
  ),
  articleList(
    id: 9,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
  articleList(
    id: 10,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
  articleList(
    id: 11,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
  articleList(
    id: 12,
    title: "Waiting for Orpa",
    description: '''This is the short description for the
blog that will be displayed shortly
and brief. Please fill this short
description as short and clear
as possible.''',
    image: "assets/images/waitingfororpa.png",
    categoryList: "News",
  ),
];

class PostSection extends StatelessWidget {
  const PostSection({Key? key, required this.article}) : super(key: key);
  final articleList article;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 450,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 5,
            child: ClipRRect(
              child: Image.asset(
                article.image,
                height: 190,
                width: 320,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 1,
            child: Text(
              article.title,
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
              article.description,
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
            child: Text(
              article.categoryList,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.6000000238418579),
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
  }
}

class postView extends StatefulWidget {
  const postView({Key? key}) : super(key: key);

  @override
  State<postView> createState() => _postViewState();
}

class _postViewState extends State<postView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(45, 70, 45, 0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 12),
        children: List.generate(
          myList.length,
          (index) => PostSection(
            article: myList[index],
          ),
        ),
      ),
    );
  }
}
