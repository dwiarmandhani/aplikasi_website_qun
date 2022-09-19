import 'package:aplikasi_website_qun/QunFilms/HomeFilmsPage.dart';
import 'package:aplikasi_website_qun/QunFilms/MenuFilms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class headerFilms extends StatefulWidget {
  const headerFilms({Key? key}) : super(key: key);

  @override
  State<headerFilms> createState() => _headerFilmsState();
}

class _headerFilmsState extends State<headerFilms> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: 117,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => HomeFilmsPage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Image.asset(
                      "assets/images/logo_films.png",
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => MenuFilms()));
                      },
                      icon: Container(
                        child:
                            Image.asset('assets/images/buttonMenuRadius.png'),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white)),
                      ),
                      iconSize: 50,
                    ))
              ],
            ),
          )
        ]),
      ),
    );
  }
}

// Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 70,
//         leading: InkWell(
//           onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (c) => HomeFilmsPage()));
//           },
//           child: Padding(
//             padding: EdgeInsets.only(left: 15),
//             child: Image.asset(
//               "assets/images/logo_films.png",
//               height: 500,
//               width: 500,
//             ),
//           ),
//         ),
//         actions: [
//           Row(
//             children: [
//               Padding(
//                   padding: EdgeInsets.only(right: 15),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (c) => MenuFilms()));
//                     },
//                     icon: Container(
//                       child: Image.asset('assets/images/buttonMenuRadius.png'),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(color: Colors.white)),
//                     ),
//                     iconSize: 50,
//                   ))
//             ],
//           ),
//         ],
//       ),
//     )