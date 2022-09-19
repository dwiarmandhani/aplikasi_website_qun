import 'package:aplikasi_website_qun/Admin/main_screens/add_news.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/home_screen.dart';
import 'package:aplikasi_website_qun/QunFilms/News/component/category.dart';
import 'package:aplikasi_website_qun/QunFilms/News/component/postView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/admin_postView.dart';

class readNews extends StatefulWidget {
  static const routeName = '/NewsEditor';
  const readNews({Key? key}) : super(key: key);

  @override
  State<readNews> createState() => _readNewsState();
}

class _readNewsState extends State<readNews> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(85, 65, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => HomeScreen()));
                        },
                        child: Text(
                          '< Back',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.6000000238418579),
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      )),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 65, 80, 0),
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => addNews()));
                        },
                        child: Text(
                          'Tambah News',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.6000000238418579),
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      )),
                ],
              ),
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
              SizedBox(),
              Container(
                width: 1020,
                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextFormField(
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
                              hintText: "WHAT ARE YOU LOOKING FOR?",
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
                  ],
                ),
              ),
              Container(
                alignment: Alignment(-0.6, 0),
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => readNewsCatZero()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => readNewsCatOne()));
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

              Container(
                padding: EdgeInsets.fromLTRB(165, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: 1200,
                    height: 1700,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(238, 238, 238, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: adminPostView(),
                  ),
                ),
              ),

              // FOOTER
              SizedBox(height: 100),
              Container(
                width: 1440,
                height: 10,
                child: Divider(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  thickness: 2,
                ),
              ),
              Container(
                  width: 1184,
                  height: 75,
                  child: Container(
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
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}

class readNewsCatZero extends StatefulWidget {
  const readNewsCatZero({Key? key}) : super(key: key);

  @override
  State<readNewsCatZero> createState() => _readNewsCatZeroState();
}

class _readNewsCatZeroState extends State<readNewsCatZero> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(85, 65, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => HomeScreen()));
                        },
                        child: Text(
                          '< Back',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.6000000238418579),
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      )),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 65, 80, 0),
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => addNews()));
                        },
                        child: Text(
                          'Tambah News',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.6000000238418579),
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      )),
                ],
              ),
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
              SizedBox(),
              Container(
                width: 1020,
                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextFormField(
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
                              hintText: "WHAT ARE YOU LOOKING FOR?",
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
                  ],
                ),
              ),
              Container(
                alignment: Alignment(-0.6, 0),
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => readNews()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            'All',
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
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            'Media Coverage',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => readNewsCatOne()));
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

              Container(
                padding: EdgeInsets.fromLTRB(165, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: 1200,
                    height: 1700,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(238, 238, 238, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: adminPostViewCatZero(),
                  ),
                ),
              ),

              // FOOTER
              SizedBox(height: 100),
              Container(
                width: 1440,
                height: 10,
                child: Divider(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  thickness: 2,
                ),
              ),
              Container(
                  width: 1184,
                  height: 75,
                  child: Container(
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
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}

class readNewsCatOne extends StatefulWidget {
  const readNewsCatOne({Key? key}) : super(key: key);

  @override
  State<readNewsCatOne> createState() => _readNewsCatOneState();
}

class _readNewsCatOneState extends State<readNewsCatOne> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(85, 65, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => HomeScreen()));
                        },
                        child: Text(
                          '< Back',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.6000000238418579),
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      )),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 65, 80, 0),
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => addNews()));
                        },
                        child: Text(
                          'Tambah News',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.6000000238418579),
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      )),
                ],
              ),
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
              SizedBox(),
              Container(
                width: 1020,
                padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: TextFormField(
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
                              hintText: "WHAT ARE YOU LOOKING FOR?",
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
                  ],
                ),
              ),
              Container(
                alignment: Alignment(-0.6, 0),
                padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (c) => readNews()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            'All',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => readNewsCatZero()));
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
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            'Upcoming Release',
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
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(165, 45, 0, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    width: 1200,
                    height: 1700,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(238, 238, 238, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: adminPostViewCatOne(),
                  ),
                ),
              ),

              // FOOTER
              SizedBox(height: 100),
              Container(
                width: 1440,
                height: 10,
                child: Divider(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  thickness: 2,
                ),
              ),
              Container(
                  width: 1184,
                  height: 75,
                  child: Container(
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
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
