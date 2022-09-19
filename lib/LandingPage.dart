import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LandingPage extends StatefulWidget {
  static const routeName = '/LandingPage';
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List _isHovering = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('landingStudio');
    CollectionReference ref2 =
        FirebaseFirestore.instance.collection('landingFilm');
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(children: [
          Container(
            child: Visibility(
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                visible: _isHovering[0],
                child: LandingPageHoverState()),
          ),
          Container(
            child: Visibility(
                maintainAnimation: true,
                maintainState: true,
                maintainSize: true,
                visible: _isHovering[1],
                child: LandingPageHover2State()),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 150,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 422,
                            height: 500,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: ref2.snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Something went wrong');
                                  } else if (snapshot.hasData ||
                                      snapshot.data != null) {
                                    return ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          var homeInfo =
                                              snapshot.data!.docs[index].data()
                                                  as Map<String, dynamic>;
                                          String docId =
                                              snapshot.data!.docs[index].id;
                                          String desc = homeInfo['desc'];
                                          String imageUrl =
                                              homeInfo['imageUrl'];

                                          return Row(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: InkWell(
                                                  onHover: (value) {
                                                    setState(() {
                                                      value
                                                          ? _isHovering[0] =
                                                              true
                                                          : _isHovering[0] =
                                                              false;

                                                      value
                                                          ? _isHovering[2] =
                                                              true
                                                          : _isHovering[2] =
                                                              false;
                                                    });
                                                  },
                                                  onTap: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/homeFilmsPage'),
                                                  child: Container(
                                                      width: 422,
                                                      height: 500,
                                                      child: Stack(
                                                        children: [
                                                          Column(children: [
                                                            Container(
                                                              width: 365,
                                                              height: 224,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(30),
                                                              decoration:
                                                                  const BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        'assets/images/Qun_brandmark011.png'),
                                                                    fit: BoxFit
                                                                        .fitWidth),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 365,
                                                              height: 269,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(30),
                                                            ),
                                                          ]),
                                                          Visibility(
                                                              maintainAnimation:
                                                                  false,
                                                              maintainState:
                                                                  false,
                                                              maintainSize:
                                                                  false,
                                                              visible:
                                                                  _isHovering[
                                                                      0],
                                                              child: Container(
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      10,
                                                                      10,
                                                                      10,
                                                                      0.4),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            365,
                                                                        height:
                                                                            224,
                                                                        padding:
                                                                            const EdgeInsets.all(30),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                AssetImage('assets/images/Qun_brandmark021.png'),
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            365,
                                                                        height:
                                                                            250,
                                                                        padding:
                                                                            const EdgeInsets.all(30),
                                                                        child:
                                                                            Text(
                                                                          '''${desc}''',
                                                                          textAlign:
                                                                              TextAlign.justify,
                                                                          style: const TextStyle(
                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                              fontFamily: 'Lato',
                                                                              fontSize: 18,
                                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                              fontWeight: FontWeight.normal,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )))
                                                        ],
                                                      )),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.orangeAccent),
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            width: 422,
                            height: 500,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: ref.snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Something went wrong');
                                  } else if (snapshot.hasData ||
                                      snapshot.data != null) {
                                    return ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          var homeInfo =
                                              snapshot.data!.docs[index].data()
                                                  as Map<String, dynamic>;
                                          String docId =
                                              snapshot.data!.docs[index].id;
                                          String desc = homeInfo['desc'];
                                          String imageUrl =
                                              homeInfo['imageUrl'];

                                          return Row(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: InkWell(
                                                    onHover: (value) {
                                                      setState(() {
                                                        value
                                                            ? _isHovering[1] =
                                                                true
                                                            : _isHovering[1] =
                                                                false;

                                                        value
                                                            ? _isHovering[2] =
                                                                true
                                                            : _isHovering[2] =
                                                                false;
                                                      });
                                                    },
                                                    onTap: () =>
                                                        Navigator.pushNamed(
                                                            context,
                                                            '/HomeStudioPage'),
                                                    child: Container(
                                                      width: 422,
                                                      height: 500,
                                                      child: Stack(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                width: 317,
                                                                height: 200,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        28.5),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/images/Qunstudios1.png'),
                                                                      fit: BoxFit
                                                                          .fitWidth),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 31,
                                                              ),
                                                              Container(
                                                                width: 365,
                                                                height: 250,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        28.5),
                                                              ),
                                                            ],
                                                          ),
                                                          Visibility(
                                                              maintainAnimation:
                                                                  false,
                                                              maintainState:
                                                                  false,
                                                              maintainSize:
                                                                  false,
                                                              visible:
                                                                  _isHovering[
                                                                      1],
                                                              child: Container(
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      10,
                                                                      10,
                                                                      10,
                                                                      0.4),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            317,
                                                                        height:
                                                                            200,
                                                                        padding:
                                                                            const EdgeInsets.all(28.5),
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          image:
                                                                              DecorationImage(
                                                                            image:
                                                                                AssetImage('assets/images/Qunstudios10.png'),
                                                                            fit:
                                                                                BoxFit.fitWidth,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            365,
                                                                        height:
                                                                            250,
                                                                        padding:
                                                                            const EdgeInsets.all(30),
                                                                        child:
                                                                            Text(
                                                                          '''${desc}''',
                                                                          textAlign:
                                                                              TextAlign.justify,
                                                                          style: const TextStyle(
                                                                              color: Color.fromRGBO(255, 255, 255, 1),
                                                                              fontFamily: 'Lato',
                                                                              fontSize: 18,
                                                                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                              fontWeight: FontWeight.normal,
                                                                              height: 1),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )))
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          );
                                        });
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.orangeAccent),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: const Alignment(0, 0),
                  child: Column(
                    children: [
                      Container(
                        height: 550,
                      ),
                      Container(
                        padding: const EdgeInsets.all(52),
                        child: Text(
                          'Hover to start',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: _isHovering[2]
                                  ? Colors.transparent
                                  : const Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Lato',
                              fontSize: 24.918468475341797,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(52),
                        child: Text(
                          '© 2022 QUN',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: _isHovering[0]
                                  ? Colors.transparent
                                  : const Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Lato',
                              fontSize: 16,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(52),
                      //   child: ElevatedButton(
                      //       onPressed: () =>
                      //           Navigator.pushNamed(context, '/AdminPanel'),
                      //       child: Text("Admin Login")),
                      // ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class LandingPageHoverState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('landingFilm');
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: StreamBuilder<QuerySnapshot>(
            stream: ref.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var homeInfo = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      String docId = snapshot.data!.docs[index].id;
                      String desc = homeInfo['desc'];
                      String imageUrl = homeInfo['imageUrl'];

                      return Container(
                        width: screenSize.width,
                        height: screenSize.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.cover),
                        ),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                ),
              );
            }),
      ),
    );
  }
}

class LandingPageHover2State extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference ref =
        FirebaseFirestore.instance.collection('landingStudio');
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: StreamBuilder<QuerySnapshot>(
            stream: ref.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var homeInfo = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      String docId = snapshot.data!.docs[index].id;
                      String desc = homeInfo['desc'];
                      String imageUrl = homeInfo['imageUrl'];

                      return Container(
                        width: screenSize.width,
                        height: screenSize.height,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imageUrl), fit: BoxFit.cover),
                        ),
                      );
                    });
              }
              return const Center(
                child: const CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                ),
              );
            }),
      ),
    );
  }
}
