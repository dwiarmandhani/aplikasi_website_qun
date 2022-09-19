import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:simple_url_preview/simple_url_preview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui' as ui;
import 'dart:html';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

final Uri _urlIG = Uri.parse('https://www.instagram.com/qunfilms/');
final Uri _urlInfo = Uri.parse('mailto:info@qunfilms.com/');
final Uri _urlWA = Uri.parse(
    'https://wa.me/6281312359233?text=Halo Admin, mau tanya-tanya dong!');
final Uri _urlMaps = Uri.parse(
    'https://www.google.com/maps/dir/-6.2265592,106.8532384/QUN+Headquarter+South+Jakarta+City/@-6.2216253,106.7839844,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x2e69f1cb459a6005:0x98a22f9845aca348!2m2!1d106.7913244!2d-6.2384708');

void _launchUrl() async {
  if (!await launchUrl(_urlInfo)) throw 'Could not launch $_urlInfo';
}

void _launchMaps() async {
  if (!await launchUrl(_urlMaps)) throw 'Could not launch $_urlMaps';
}

void _launchIG() async {
  if (!await launchUrl(_urlIG)) throw 'Could not launch $_urlIG';
}

void _launchWA() async {
  if (!await launchUrl(_urlWA)) throw 'Could not launch $_urlWA';
}

class BtmBar extends StatefulWidget {
  const BtmBar({Key? key}) : super(key: key);

  @override
  State<BtmBar> createState() => _BtmBarState();
}

// buat widget IG
class MyWidgetFactory extends WidgetFactory with WebViewFactory {
  // optional: override getter to configure how WebViews are built
  bool get webViewMediaPlaybackAlwaysAllow => true;
  String? get webViewUserAgent => 'My app';
}

class _BtmBarState extends State<BtmBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      color: Colors.white,
      child: Column(
        children: [
          /*Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: Color(0xff17A0DA),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Keep In Touch With The Studios',
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Berghan',
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
                Spacer(),
                Spacer(),
                InkWell(
                  focusColor: Colors.transparent,
                  onTap: () => setState(() {
                    _launchIG();
                  }),
                  child: Text(
                    '\u0040Qunstudios',
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 3,
                    style: TextStyle(
                      fontFamily: 'Physis-Black',
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 100,
                    width: 600,
                    child: HtmlWidget(
                      '''
                            <!DOCTYPE html>
                            <html>
                            <body>
                            
                            <div>
                            <iframe src="https://widget.taggbox.com/105767" style="width:600;height:100;border:none;"></iframe></div>
                            
                            </body>
                            </html>
                            ''',
                      factoryBuilder: () => MyWidgetFactory(),
                    ),
                  ),
                ),
                /*Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/qun_studio_assets/Rectangle27.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/qun_studio_assets/Rectangle28.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/qun_studio_assets/Rectangle36.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/qun_studio_assets/Rectangle30.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/qun_studio_assets/Rectangle31.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/qun_studio_assets/Rectangle32.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),*/
              ],
            ),
          ),
          */
          Container(
            padding: EdgeInsets.only(top: 70),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 188,
                        height: 106,
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/qun_studio_assets/LogoQunStudio.png'),
                                fit: BoxFit.contain)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: 188,
                          child: StyledText(
                            maxLines: 70,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.clip,
                            softWrap: false,
                            style: TextStyle(
                                fontFamily: 'Physis-Light',
                                height: 1.3,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color(0xff4198C0),
                                letterSpacing: 0.02),
                            text:
                                'Changing the world,\none project at a time\n// For the greater good.//\nFrom us, for the world.//\nFrom you, to us,\nfor the world.',
                          ),
                        ),
                      ),
                      Container(
                        width: 188,
                        child: IconButton(
                            alignment: Alignment.topLeft,
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
                Spacer(),
                Expanded(
                  child: Container(
                    width: 150,
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: StyledText(
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            softWrap: false,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontFamily: 'Physis-Black',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff4198C0),
                                letterSpacing: 0.02),
                            text: 'BROWSE',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 150,
                          child: InkWell(
                            focusColor: Colors.transparent,
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/SpiritLoading'),
                            child: StyledText(
                              maxLines: 3,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontFamily: 'Physis-Light',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.clip,
                                  color: Color(0xff4198C0),
                                  letterSpacing: 0.02),
                              text: 'Who We Are',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 150,
                          child: InkWell(
                            focusColor: Colors.transparent,
                            onTap: () => Navigator.popAndPushNamed(
                                context, '/ImaginationLoading'),
                            child: StyledText(
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontFamily: 'Physis-Light',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.clip,
                                  color: Color(0xff4198C0),
                                  letterSpacing: 0.02),
                              text: 'Portfolio',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 220,
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 220,
                          child: StyledText(
                            maxLines: 3,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Physis-Black',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.clip,
                                color: Color(0xff4198C0),
                                letterSpacing: 0.02),
                            text: 'CONTACT',
                            softWrap: false,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 220,
                          child: InkWell(
                            focusColor: Colors.transparent,
                            onTap: () => setState(() {
                              _launchUrl();
                            }),
                            child: StyledText(
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontFamily: 'Physis-Light',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4198C0),
                                  overflow: TextOverflow.clip,
                                  letterSpacing: 0.02),
                              text: 'hello\u0040qunfilms.com',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 287,
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 287,
                          child: StyledText(
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Physis-Black',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.clip,
                                color: Color(0xff4198C0),
                                letterSpacing: 0.02),
                            text: 'STUDIO HQ',
                            softWrap: false,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 287,
                          child: InkWell(
                            focusColor: Colors.transparent,
                            onTap: () => setState(() {
                              _launchMaps();
                            }),
                            child: StyledText(
                              maxLines: 70,
                              textAlign: TextAlign.left,
                              softWrap: false,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontFamily: 'Physis-Light',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff4198C0),
                                letterSpacing: 0.02,
                                overflow: TextOverflow.clip,
                              ),
                              text:
                                  'Jl Dempo I No 76\nJakarta Selatan,\nDKI Jakarta Indonesia',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment(0.95, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText(
                  maxLines: 70,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontFamily: 'Physis-Light',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4198C0),
                      letterSpacing: 0.02),
                  text:
                      '\u00a9 Copyright 2022 QUN Studio\n\nDev. By Dome Lab - All Rights Reserved.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
