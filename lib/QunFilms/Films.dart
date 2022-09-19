import 'package:aplikasi_website_qun/Data/headerFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/ArticleFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/HomeFilmsPage.dart';
import 'package:aplikasi_website_qun/QunFilms/MenuFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/widget/footerFilms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class Films extends StatefulWidget {
  static const routeName = '/FilmsPage';
  const Films({Key? key}) : super(key: key);

  @override
  State<Films> createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('portfoliofilm');
  Widget buildFilmsCard(int index) => Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          margin: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
                'https://source.unsplash.com/random?sig=$index',
                fit: BoxFit.cover),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => HomeFilmsPage()));
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
        actions: [
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (c) => MenuFilms()));
                    },
                    icon: Container(
                      child: Image.asset('assets/images/buttonMenuRadius.png'),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                    ),
                    iconSize: 50,
                  ))
            ],
          ),
        ],
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: Colors.black,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'FILMS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(242, 255, 98, 1),
                        fontFamily: 'Agentur',
                        fontSize: 40,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'OUR PURE IMAGINATION',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(238, 238, 238, 1),
                        fontFamily: 'Agentur',
                        fontSize: 64,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  )),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 144,
                height: 144,
                child: VerticalDivider(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  thickness: 3,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: screenSize.width,
                child: StreamBuilder<QuerySnapshot>(
                    stream:
                        ref.orderBy('createdAt', descending: true).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      } else if (snapshot.hasData || snapshot.data != null) {
                        return Container(
                          padding: const EdgeInsets.only(left: 125),
                          alignment: Alignment.center,
                          child: GridView.builder(
                              gridDelegate: SliverStairedGridDelegate(
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                  startCrossAxisDirectionReversed: false,
                                  pattern: const [
                                    StairedGridTile(0.5, 1),
                                    StairedGridTile(1, 4 / 2),
                                    StairedGridTile(0.5, 1),
                                    StairedGridTile(1, 4 / 2),
                                  ]),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var portInfo = snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                                String docId = snapshot.data!.docs[index].id;
                                String title = portInfo['title'];
                                String desc = portInfo['directedBy'];
                                String imageUrl = portInfo['imageUrl'];
                                String imageUrl2 = portInfo['imageUrl2'];
                                String imageUrl3 = portInfo['imageUrl3'];
                                String imageUrl4 = portInfo['imageUrl4'];
                                String imageUrl5 = portInfo['imageUrl5'];
                                String imageUrl6 = portInfo['imageUrl6'];
                                String imageUrl7 = portInfo['imageUrl7'];
                                String imageUrl8 = portInfo['imageUrl8'];
                                String imageUrl9 = portInfo['imageUrl9'];
                                String imageUrl10 = portInfo['imageUrl10'];
                                String cat = portInfo['cat'];
                                String year = portInfo['year'];
                                String synopsis = portInfo['synopsis'];
                                String trailerLink = portInfo['trailer'];
                                String starring1 = portInfo['starring1'];
                                String starring2 = portInfo['starring2'];
                                String starring3 = portInfo['starring3'];
                                String starring4 = portInfo['starring4'];
                                String starring5 = portInfo['starring5'];
                                String starring6 = portInfo['starring6'];
                                String starring7 = portInfo['starring7'];
                                String starring8 = portInfo['starring8'];
                                String starring9 = portInfo['starring9'];
                                String starring10 = portInfo['starring10'];

                                return Container(
                                  width: 820,
                                  height: 450,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, '/FilmsDetail'),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (c) =>
                                                        ArticleFilms(
                                                          id: docId,
                                                          desc: desc,
                                                          cat: cat,
                                                          title: title,
                                                          synopsis: synopsis,
                                                          trailerLink:
                                                              trailerLink,
                                                          year: year,
                                                          imageUrl: imageUrl,
                                                          imageUrl2: imageUrl2,
                                                          imageUrl3: imageUrl3,
                                                          imageUrl4: imageUrl4,
                                                          imageUrl5: imageUrl5,
                                                          imageUrl6: imageUrl6,
                                                          imageUrl7: imageUrl7,
                                                          imageUrl8: imageUrl8,
                                                          imageUrl9: imageUrl9,
                                                          imageUrl10:
                                                              imageUrl10,
                                                          starring1: starring1,
                                                          starring2: starring2,
                                                          starring3: starring3,
                                                          starring4: starring4,
                                                          starring5: starring5,
                                                          starring6: starring6,
                                                          starring7: starring7,
                                                          starring8: starring8,
                                                          starring9: starring9,
                                                          starring10:
                                                              starring10,
                                                        )));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 430,
                                                width: 830,
                                                alignment: Alignment.bottomLeft,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          imageUrl),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Container(
                                                height: 430,
                                                width: 830,
                                                alignment: Alignment(1, 1.25),
                                                child: Text(
                                                  title,
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          242, 255, 98, 1),
                                                      fontFamily: 'Agentur',
                                                      fontSize: 70,
                                                      letterSpacing:
                                                          5 /*percentages not used in flutter. defaulting to zero*/,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      height: 1),
                                                ),
                                              ),
                                              Container(
                                                width: 830,
                                                height: 430,
                                                alignment: Alignment(-1, 1.35),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        '',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontFamily: 'Rubik',
                                                            fontSize: 14,
                                                            letterSpacing:
                                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            height:
                                                                1.5 /*PERCENT not supported*/
                                                            ),
                                                      ),
                                                    ),
                                                    // Figma Flutter Generator Line3Widget - LINE
                                                    Container(
                                                      width: 125,
                                                      height: 10,
                                                      child: Divider(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        thickness: 2,
                                                        indent: 0,
                                                        endIndent: 40,
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        year + ', ' + cat,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontFamily: 'Rubik',
                                                            fontSize: 14,
                                                            letterSpacing:
                                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            height:
                                                                1.5 /*PERCENT not supported*/
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orangeAccent),
                        ),
                      );
                    }),
              ),
              // UDAH ADA DATABASE
              /*Container(
                child: StreamBuilder<QuerySnapshot>(
                    stream:
                        ref.orderBy('createdAt', descending: true).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      } else if (snapshot.hasData || snapshot.data != null) {
                        return StaggeredGridView.countBuilder(
                            padding: const EdgeInsets.all(12.0),
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.fit(1),
                            itemBuilder: (context, index) {
                              var portInfo = snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                              String docId = snapshot.data!.docs[index].id;
                              String title = portInfo['title'];
                              String desc = portInfo['directedBy'];
                              String imageUrl = portInfo['imageUrl'];
                              String cat = portInfo['cat'];
                              String year = portInfo['year'];
                              String synopsis = portInfo['synopsis'];
                              String trailerLink = portInfo['trailer'];
                              String starring1 = portInfo['starring1'];
                              String starring2 = portInfo['starring2'];
                              String starring3 = portInfo['starring3'];
                              String starring4 = portInfo['starring4'];
                              String starring5 = portInfo['starring5'];
                              String starring6 = portInfo['starring6'];

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/FilmsDetail'),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (c) => ArticleFilms(
                                                      id: docId,
                                                      desc: desc,
                                                      cat: cat,
                                                      title: title,
                                                      synopsis: synopsis,
                                                      trailerLink: trailerLink,
                                                      year: year,
                                                      imageUrl: imageUrl,
                                                      starring1: starring1,
                                                      starring2: starring2,
                                                      starring3: starring3,
                                                      starring4: starring4,
                                                      starring5: starring5,
                                                      starring6: starring6,
                                                    )));
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 430,
                                            width: 830,
                                            alignment: Alignment.bottomLeft,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(imageUrl),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          Container(
                                            height: 430,
                                            width: 830,
                                            alignment: Alignment(1, 1.25),
                                            child: Text(
                                              title,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      242, 255, 98, 1),
                                                  fontFamily: 'Agentur',
                                                  fontSize: 70,
                                                  letterSpacing:
                                                      5 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1),
                                            ),
                                          ),
                                          Container(
                                            width: 830,
                                            height: 430,
                                            alignment: Alignment(-1, 1.35),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Rubik',
                                                        fontSize: 14,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                ),
                                                // Figma Flutter Generator Line3Widget - LINE
                                                Container(
                                                  width: 125,
                                                  height: 10,
                                                  child: Divider(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    thickness: 2,
                                                    indent: 0,
                                                    endIndent: 40,
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    year + ', ' + cat,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontFamily: 'Rubik',
                                                        fontSize: 14,
                                                        letterSpacing:
                                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height:
                                                            1.5 /*PERCENT not supported*/
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orangeAccent),
                        ),
                      );
                    }),
              ),
*/
              //UDAH ADA DATABASE

              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget>[
              //       //gambar judul
              //       InkWell(
              //         onTap: () => Navigator.pushNamed(context, '/FilmsDetail'),
              //         child: Container(
              //             height: 431.56,
              //             width: 818.97,
              //             alignment: Alignment.bottomLeft,
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                   image: AssetImage(
              //                       'assets/images/Screenshot20220327at11341.png'),
              //                   fit: BoxFit.cover),
              //             ),
              //             child: Container(
              //               alignment: Alignment(1, 1.15),
              //               child: Text(
              //                 'ORPA',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(242, 255, 98, 1),
              //                     fontFamily: 'Agentur',
              //                     fontSize: 84,
              //                     letterSpacing:
              //                         5 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1),
              //               ),
              //             )),
              //       ),
              //       //text judul
              //       Container(
              //         width: 818.97,
              //         child: Row(
              //           children: [
              //             Container(
              //               child: Text(
              //                 '01',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(255, 255, 255, 1),
              //                     fontFamily: 'Rubik',
              //                     fontSize: 14,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1.5 /*PERCENT not supported*/
              //                     ),
              //               ),
              //             ),
              //             // Figma Flutter Generator Line3Widget - LINE
              //             Container(
              //               width: 125,
              //               height: 10,
              //               child: Divider(
              //                 color: Color.fromRGBO(255, 255, 255, 1),
              //                 thickness: 2,
              //                 indent: 10,
              //                 endIndent: 10,
              //               ),
              //             ),
              //             Container(
              //               child: Text(
              //                 '2022, Movie',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(255, 255, 255, 1),
              //                     fontFamily: 'Rubik',
              //                     fontSize: 14,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1.5 /*PERCENT not supported*/
              //                     ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 200,
              // ),
              // // MANDALA
              // Container(
              //   width: 1184,
              //   height: 390,
              //   alignment: Alignment.topLeft,
              //   child: Column(
              //     children: [
              //       // Gambar dan Judul
              //       InkWell(
              //         onTap: () => Navigator.pushNamed(context, '/FilmsDetail'),
              //         child: Container(
              //           width: 395,
              //           height: 335,
              //           child: Stack(children: [
              //             Container(
              //                 width: 296.9004821777344,
              //                 height: 296.9004821777344,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage(
              //                           'assets/images/Screenshot20220327at11371.png'),
              //                       fit: BoxFit.fitWidth),
              //                 )),
              //             Container(
              //               alignment: Alignment.bottomLeft,
              //               child: Text(
              //                 'MANDALA',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(242, 255, 98, 1),
              //                     fontFamily: 'Agentur',
              //                     fontSize: 64,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1),
              //               ),
              //             )
              //           ]),
              //         ),
              //       ),
              //       Container(
              //         height: 30,
              //         width: 400,
              //         alignment: Alignment.bottomLeft,
              //         child: Text(
              //           'RESSURANCE OF THE DAWN',
              //           textAlign: TextAlign.left,
              //           overflow: TextOverflow.ellipsis,
              //           maxLines: 2,
              //           style: TextStyle(
              //               color: Color.fromRGBO(255, 255, 255, 1),
              //               fontFamily: 'Agentur',
              //               fontSize: 24,
              //               letterSpacing:
              //                   0 /*percentages not used in flutter. defaulting to zero*/,
              //               fontWeight: FontWeight.normal,
              //               height: 1),
              //         ),
              //       ),
              //       Container(
              //         height: 25,
              //         width: 410,
              //         child: Row(
              //           children: [
              //             Container(
              //               alignment: Alignment.bottomLeft,
              //               child: Text(
              //                 '03',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(255, 255, 255, 1),
              //                     fontFamily: 'Rubik',
              //                     fontSize: 14,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1.5 /*PERCENT not supported*/
              //                     ),
              //               ),
              //             ),
              //             Container(
              //                 height: 10,
              //                 width: 125,
              //                 child: Divider(
              //                   color: Color.fromRGBO(255, 255, 255, 1),
              //                   thickness: 1,
              //                   indent: 10,
              //                   endIndent: 10,
              //                 )),
              //             Expanded(
              //                 child: Container(
              //                     alignment: Alignment.bottomLeft,
              //                     child: Text(
              //                       '2022, Short Movie',
              //                       textAlign: TextAlign.left,
              //                       style: TextStyle(
              //                           color: Color.fromRGBO(255, 255, 255, 1),
              //                           fontFamily: 'Rubik',
              //                           fontSize: 14,
              //                           letterSpacing:
              //                               0 /*percentages not used in flutter. defaulting to zero*/,
              //                           fontWeight: FontWeight.normal,
              //                           height: 1.5 /*PERCENT not supported*/
              //                           ),
              //                     ))),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // // MEMORI DIA
              // Container(
              //   width: 1184,
              //   height: 600,
              //   alignment: Alignment.topRight,
              //   child: Column(
              //     children: [
              //       SizedBox(
              //         height: 50,
              //       ),
              //       InkWell(
              //         onTap: () => Navigator.pushNamed(context, '/FilmsDetail'),
              //         child: Container(
              //           width: 815,
              //           height: 434,
              //           child: Stack(children: [
              //             Container(
              //                 width: 813.53,
              //                 height: 381.02,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage(
              //                           'assets/images/Screenshot20220403at2451.png'),
              //                       fit: BoxFit.cover),
              //                 )),
              //             Container(
              //               alignment: Alignment(-1, 0.9),
              //               child: Text(
              //                 'MEMORI DIA',
              //                 textAlign: TextAlign.left,
              //                 overflow: TextOverflow.ellipsis,
              //                 maxLines: 100,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(242, 255, 98, 1),
              //                     fontFamily: 'Agentur',
              //                     fontSize: 64,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1),
              //               ),
              //             )
              //           ]),
              //         ),
              //       ),
              //       Container(
              //         height: 25,
              //         width: 815,
              //         alignment: Alignment.topRight,
              //         child: Row(
              //           children: [
              //             Spacer(),
              //             Spacer(),
              //             Spacer(),
              //             Spacer(),
              //             Container(
              //               alignment: Alignment.topRight,
              //               child: Text(
              //                 '03',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(255, 255, 255, 1),
              //                     fontFamily: 'Rubik',
              //                     fontSize: 14,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1.5 /*PERCENT not supported*/
              //                     ),
              //               ),
              //             ),
              //             Container(
              //                 height: 10,
              //                 width: 125,
              //                 child: Divider(
              //                   color: Color.fromRGBO(255, 255, 255, 1),
              //                   thickness: 1,
              //                   indent: 10,
              //                   endIndent: 10,
              //                 )),
              //             Expanded(
              //                 child: Container(
              //                     alignment: Alignment.bottomLeft,
              //                     child: Text(
              //                       '2022, Short Movie',
              //                       textAlign: TextAlign.left,
              //                       overflow: TextOverflow.ellipsis,
              //                       maxLines: 100,
              //                       style: TextStyle(
              //                           color: Color.fromRGBO(255, 255, 255, 1),
              //                           fontFamily: 'Rubik',
              //                           fontSize: 14,
              //                           letterSpacing:
              //                               0 /*percentages not used in flutter. defaulting to zero*/,
              //                           fontWeight: FontWeight.normal,
              //                           height: 1.5 /*PERCENT not supported*/
              //                           ),
              //                     ))),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: 1184,
              //   height: 390,
              //   alignment: Alignment.topLeft,
              //   child: Column(
              //     children: [
              //       // Gambar dan Judul
              //       InkWell(
              //         onTap: () => Navigator.pushNamed(context, '/FilmsDetail'),
              //         child: Container(
              //           width: 395,
              //           height: 335,
              //           child: Stack(children: [
              //             Container(
              //                 width: 296.9004821777344,
              //                 height: 296.9004821777344,
              //                 decoration: BoxDecoration(
              //                   image: DecorationImage(
              //                       image: AssetImage(
              //                           'assets/images/Screenshot20220327at11371.png'),
              //                       fit: BoxFit.fitWidth),
              //                 )),
              //             Container(
              //               alignment: Alignment.bottomLeft,
              //               child: Text(
              //                 'MANDALA',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(242, 255, 98, 1),
              //                     fontFamily: 'Agentur',
              //                     fontSize: 64,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1),
              //               ),
              //             )
              //           ]),
              //         ),
              //       ),
              //       Container(
              //         height: 30,
              //         width: 400,
              //         alignment: Alignment.bottomLeft,
              //         child: Text(
              //           'RESSURANCE OF THE DAWN',
              //           textAlign: TextAlign.left,
              //           overflow: TextOverflow.ellipsis,
              //           maxLines: 2,
              //           style: TextStyle(
              //               color: Color.fromRGBO(255, 255, 255, 1),
              //               fontFamily: 'Agentur',
              //               fontSize: 24,
              //               letterSpacing:
              //                   0 /*percentages not used in flutter. defaulting to zero*/,
              //               fontWeight: FontWeight.normal,
              //               height: 1),
              //         ),
              //       ),
              //       Container(
              //         height: 25,
              //         width: 410,
              //         child: Row(
              //           children: [
              //             Container(
              //               alignment: Alignment.bottomLeft,
              //               child: Text(
              //                 '03',
              //                 textAlign: TextAlign.left,
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(255, 255, 255, 1),
              //                     fontFamily: 'Rubik',
              //                     fontSize: 14,
              //                     letterSpacing:
              //                         0 /*percentages not used in flutter. defaulting to zero*/,
              //                     fontWeight: FontWeight.normal,
              //                     height: 1.5 /*PERCENT not supported*/
              //                     ),
              //               ),
              //             ),
              //             Container(
              //                 height: 10,
              //                 width: 125,
              //                 child: Divider(
              //                   color: Color.fromRGBO(255, 255, 255, 1),
              //                   thickness: 1,
              //                   indent: 10,
              //                   endIndent: 10,
              //                 )),
              //             Expanded(
              //                 child: Container(
              //                     alignment: Alignment.bottomLeft,
              //                     child: Text(
              //                       '2022, Short Movie',
              //                       textAlign: TextAlign.left,
              //                       style: TextStyle(
              //                           color: Color.fromRGBO(255, 255, 255, 1),
              //                           fontFamily: 'Rubik',
              //                           fontSize: 14,
              //                           letterSpacing:
              //                               0 /*percentages not used in flutter. defaulting to zero*/,
              //                           fontWeight: FontWeight.normal,
              //                           height: 1.5 /*PERCENT not supported*/
              //                           ),
              //                     ))),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),

              //Footer
              footerFilms()
            ],
          ),
        ),
      ),
    );
  }
}
