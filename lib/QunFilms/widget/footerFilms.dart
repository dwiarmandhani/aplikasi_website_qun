import 'package:aplikasi_website_qun/QunFilms/MenuFilms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class footerFilms extends StatefulWidget {
  const footerFilms({Key? key}) : super(key: key);

  @override
  State<footerFilms> createState() => _footerFilmsState();
}

class _footerFilmsState extends State<footerFilms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  ),
                ),
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
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => MenuFilms()));
                    },
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
    );
  }
}
