import 'package:aplikasi_website_qun/QunStudio/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

final Uri _urlIG = Uri.parse('https://www.instagram.com/qunfilms/');
void _launchIG() async {
  if (!await launchUrl(_urlIG)) throw 'Could not launch $_urlIG';
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 70),
      child: Container(
        width: screenSize.width,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/HomeStudioPage');
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/qun_studio_assets/logo_studio.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/LineAppBar.png'),
                            fit: BoxFit.contain),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Social, Digital & Content Creation',
                        maxLines: 3,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: 'Work Sans',
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[0] = true
                                : _isHovering[0] = false;
                          });
                        },
                        onTap: () => Scaffold.of(context).openEndDrawer(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'MENU',
                              style: TextStyle(
                                  color: _isHovering[0]
                                      ? Color.fromARGB(255, 0, 0, 0)
                                      : Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            const SizedBox(height: 5),
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 20,
                                color: Color(0xFF051441),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: IconButton(
                          onPressed: () => setState(() {
                                _launchIG();
                              }),
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*onTap: () => Scaffold.of(context).openEndDrawer(),*/