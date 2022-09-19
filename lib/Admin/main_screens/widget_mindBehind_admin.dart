import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../Admin/main_screens/edit_theMindBehind.dart';

final List<Widget> roleList = [
  Expanded(
    child: Column(
      children: <Widget>[
        FittedBox(
          fit: BoxFit.cover,
          child: Container(
              width: 133,
              height: 185,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Image.asset('assets/images/Layer15.png'),
              )),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            'AXEL HADININGRAT',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Rubik',
                fontSize: 16.649999618530273,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1.699999942722262),
          ),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            'CEO',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Rubik',
                fontSize: 11.654999732971191,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 2.4285713467460885),
          ),
        )
      ],
    ),
  ),
  Expanded(
    child: Column(
      children: <Widget>[
        FittedBox(
          fit: BoxFit.cover,
          child: Container(
              width: 133,
              height: 185,
              child: Padding(
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: Image.asset('assets/images/Layer16.png'),
              )),
        ),
        FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'DANI HUDA',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 16.649999618530273,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.699999942722262),
            )),
        FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'DIRECTOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 11.654999732971191,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 2.4285713467460885),
            ))
      ],
    ),
  ),
  Expanded(
    child: Column(
      children: <Widget>[
        FittedBox(
            fit: BoxFit.cover,
            child: Container(
                width: 133,
                height: 185,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Image.asset('assets/images/Layer11.png'),
                ))),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'GIOVANNI RAHMADEVA',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 16.649999618530273,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.699999942722262),
            )),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'MANAGING DIRECTOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 11.654999732971191,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 2.4285713467460885),
            ))
      ],
    ),
  ),
  Expanded(
    child: Column(
      children: <Widget>[
        FittedBox(
            fit: BoxFit.cover,
            child: Container(
                width: 133,
                height: 185,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Image.asset('assets/images/Layer12.png'),
                ))),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'DENYS PRAYOGA',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 16.649999618530273,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.699999942722262),
            )),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'FINANCE',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 11.654999732971191,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 2.4285713467460885),
            ))
      ],
    ),
  ),
  Expanded(
    child: Column(
      children: <Widget>[
        FittedBox(
            fit: BoxFit.cover,
            child: Container(
                width: 133,
                height: 185,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Image.asset('assets/images/Layer13.png'),
                ))),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'JODY AGUS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 16.649999618530273,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.699999942722262),
            )),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'CREATIVE DIRECTOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 11.654999732971191,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 2.4285713467460885),
            ))
      ],
    ),
  ),
  Expanded(
    child: Column(
      children: <Widget>[
        FittedBox(
            fit: BoxFit.cover,
            child: Container(
                width: 133,
                height: 185,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: Image.asset('assets/images/Layer14.png'),
                ))),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'ADAM WIKEL',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 16.649999618530273,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.699999942722262),
            )),
        FittedBox(
            fit: BoxFit.cover,
            child: Text(
              'SR. COPYWRITER',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Rubik',
                  fontSize: 11.654999732971191,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 2.4285713467460885),
            ))
      ],
    ),
  ),
];

class mindBehindsWidgetAdmin extends StatefulWidget {
  const mindBehindsWidgetAdmin({Key? key}) : super(key: key);

  @override
  State<mindBehindsWidgetAdmin> createState() => _mindBehindsWidgetAdminState();
}

class _mindBehindsWidgetAdminState extends State<mindBehindsWidgetAdmin> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('mindBehinds');
  final CarouselController _sliderImage = CarouselController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
        height: 500,
        width: screenSize.width,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                    child: Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    'THE MINDS BEHIND',
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    style: TextStyle(
                        color: Color.fromRGBO(242, 255, 98, 1),
                        fontFamily: 'Agentur',
                        fontSize: 42,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                )),
              ],
            ),
            Container(
              width: 1300,
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      ref.orderBy('createdAt', descending: true).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                            aspectRatio: 3,
                            enlargeCenterPage: false,
                            viewportFraction: 0.14,
                            autoPlay: true),
                        carouselController: _sliderImage,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index, realIdx) {
                          var homeInfo = snapshot.data!.docs[index].data()
                              as Map<String, dynamic>;
                          String docId = snapshot.data!.docs[index].id;
                          String name = homeInfo['nama'];
                          String role = homeInfo['role'];
                          String imageUrl = homeInfo['imageUrl'];
                          final int first = index;
                          return Row(
                            children: [first].map((idx) {
                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 5,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (c) =>
                                                          editTheMindBehind(
                                                            id: docId,
                                                            imageUrl: imageUrl,
                                                            name: name,
                                                            role: role,
                                                          )));
                                            },
                                            child: Container(
                                                width: 140,
                                                height: 200,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      2, 0, 2, 0),
                                                  child: Image.network(
                                                    imageUrl,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 16.649999618530273,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1.699999942722262),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            role,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'Rubik',
                                                fontSize: 11.654999732971191,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 2.4285713467460885),
                                          ),
                                        )
                                      ],
                                    ),
                                    height: 260,
                                    width: 260,
                                  ),
                                ),
                              );
                            }).toList(),
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
                  }),
            ),
          ],
        ));
  }
}
