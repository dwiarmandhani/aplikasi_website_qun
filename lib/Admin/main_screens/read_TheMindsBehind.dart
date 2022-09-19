import 'package:aplikasi_website_qun/Admin/main_screens/add_AboutFilms.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/add_TheMindBehind.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/widget_mindBehind_admin.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/theMindsWidget.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class readTheMindBehinds extends StatefulWidget {
  const readTheMindBehinds({Key? key}) : super(key: key);

  @override
  State<readTheMindBehinds> createState() => _readTheMindBehindsState();
}

class _readTheMindBehindsState extends State<readTheMindBehinds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 50,
                ),
                Container(
                  child: Text(
                    'Form',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Agentur',
                        fontSize: 42,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => addTheMindBehind()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Add',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
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
            mindBehindsWidgetAdmin()
          ],
        ),
      ),
    );
  }
}
