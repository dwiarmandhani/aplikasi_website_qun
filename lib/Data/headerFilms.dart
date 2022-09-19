import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class headerFilms extends StatelessWidget {
  const headerFilms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: 100,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo_films.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/buttonMenuRadius.png"),
                            fit: BoxFit.cover),
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
