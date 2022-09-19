import 'package:aplikasi_website_qun/Admin/main_screens/add_portfolioStudioDetail.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class readPortoStudioDetail extends StatefulWidget {
  const readPortoStudioDetail({Key? key}) : super(key: key);

  @override
  State<readPortoStudioDetail> createState() => _readPortoStudioDetailState();
}

class _readPortoStudioDetailState extends State<readPortoStudioDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      'Portfolio Studio',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Physis-Black',
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
                                builder: (c) => addDetailPortoStudio()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
