import 'package:aplikasi_website_qun/Admin/main_screens/add_news.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/home_screen.dart';
import 'package:aplikasi_website_qun/LandingPage.dart';
import 'package:aplikasi_website_qun/QunFilms/News/component/category.dart';
import 'package:aplikasi_website_qun/QunFilms/News/component/postView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsPage extends StatefulWidget {
  static const routeName = '/NewsPage';
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late String title = "";
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(85, 65, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/LandingPage');
                    },
                    child: Text(
                      '< Back',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color:
                              Color.fromRGBO(255, 255, 255, 0.6000000238418579),
                          fontFamily: 'Rubik',
                          fontSize: 20,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(175, 35, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '''NEWS &
MEDIA COVERAGE''',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(238, 238, 238, 1),
                      fontFamily: 'Agentur',
                      fontSize: 64,
                      letterSpacing:
                          5 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(175, 35, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Qun Films & Qun Studio',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(242, 255, 98, 1),
                      fontFamily: 'Archivo',
                      fontSize: 40,
                      letterSpacing:
                          5 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(175, 0, 0, 0),
                  width: screenSize.width,
                  alignment: Alignment.topLeft,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 1200,
                          padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  title = val.toUpperCase();
                                });
                              },
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Rubik',
                                  fontSize: 30,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    width: 2,
                                  )),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    width: 2,
                                  )),
                                  hintText: "SEARCH",
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 30,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 650,
                          alignment: Alignment.topLeft,
                          child: const TabBar(
                            indicatorColor: Colors.white,
                            tabs: [
                              Tab(
                                icon: Text(
                                  'All',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 20,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  'Media Coverage',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 20,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                              ),
                              Tab(
                                icon: Text(
                                  'Upcoming Release',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(238, 238, 238, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 20,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.bold,
                                      height: 1),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: screenSize.width,
                            height: 1700,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: TabBarView(
                              children: [
                                postView(
                                  title: title,
                                ),
                                postViewCatZero(title: title),
                                postViewCatOne(title: title)
                              ],
                            )),
                      ],
                    ),
                  )),
              /*            Container(
                padding: EdgeInsets.fromLTRB(175, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                          child: Text(
                            'All',
                            style: TextStyle(
                                backgroundColor:
                                    Color.fromARGB(90, 158, 158, 158),
                                color: Color.fromRGBO(238, 238, 238, 1),
                                fontFamily: 'Rubik',
                                fontSize: 20,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => NewsCatZero()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            'Media Coverage',
                            style: TextStyle(
                                color: Color.fromRGBO(238, 238, 238, 1),
                                fontFamily: 'Rubik',
                                fontSize: 20,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => NewsCatOne()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            'Upcoming Release',
                            style: TextStyle(
                                color: Color.fromRGBO(238, 238, 238, 1),
                                fontFamily: 'Rubik',
                                fontSize: 20,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
*/

              /*Container(
                padding: EdgeInsets.fromLTRB(175, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: screenSize.width,
                    height: 1700,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(238, 238, 238, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: postView(title: title),
                  ),
                ),
              ),*/

              // FOOTER
              SizedBox(height: 100),
              Container(
                width: screenSize.width,
                height: 10,
                child: Divider(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  thickness: 2,
                ),
              ),
              Container(
                  width: screenSize.width,
                  height: 75,
                  padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        '-QUIET UNDER NONE-',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(238, 238, 238, 1),
                            fontFamily: 'Agentur',
                            fontSize: 24,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                      Expanded(
                          child: Text(
                        '© QUN 2022',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(238, 238, 238, 1),
                            fontFamily: 'Lato',
                            fontSize: 16,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                      InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, '/MenuFilms'),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Color.fromRGBO(238, 238, 238, 1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Contact',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Rubik',
                                      fontSize: 16,
                                      letterSpacing:
                                          0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ],
                            ),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCatAll extends StatefulWidget {
  const NewsCatAll({Key? key}) : super(key: key);

  @override
  State<NewsCatAll> createState() => _NewsCatAllState();
}

class _NewsCatAllState extends State<NewsCatAll> {
  late String title = "";
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Container(
        child: postView(title: title),
      ),
    );
  }
}

class NewsCatZero extends StatefulWidget {
  const NewsCatZero({Key? key}) : super(key: key);

  @override
  State<NewsCatZero> createState() => _NewsCatZeroState();
}

class _NewsCatZeroState extends State<NewsCatZero> {
  late String title = "";
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Container(
        child: postViewCatZero(title: title),
      ),
    );
  }
}

class NewsCatOne extends StatefulWidget {
  const NewsCatOne({Key? key}) : super(key: key);

  @override
  State<NewsCatOne> createState() => _NewsCatOneState();
}

class _NewsCatOneState extends State<NewsCatOne> {
  late String title = "";
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: postViewCatOne(title: title),
    );
  }
}
