import 'package:aplikasi_website_qun/Admin/main_screens/add_AboutStudio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/home_screen.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/portfolio_read.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_AboutStudio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_HomeStudio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_contact.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_contactStudio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_landingPageStudio.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_portfoplioStudioDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QunStudioRead extends StatefulWidget {
  const QunStudioRead({Key? key}) : super(key: key);

  @override
  State<QunStudioRead> createState() => _QunStudioReadState();
}

class _QunStudioReadState extends State<QunStudioRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.black),
        ),
        title: const Text(
          'Welcome to Admin Qun Studio Portal',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 3,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //user activate and block accounts button ui
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => LandingPageStudioRead()));
                  },
                  icon: Icon(Icons.web_asset_sharp),
                  label: Text(
                    'Landing Page'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    primary: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => readHomeStudio()));
                  },
                  icon: Icon(Icons.person_add),
                  label: Text(
                    'Home'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    primary: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => Portfolio_Read()));
                  },
                  icon: Icon(Icons.person_add),
                  label: Text(
                    'Portfolio'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    primary: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => readAboutStudio()));
                  },
                  icon: Icon(Icons.web_asset_sharp),
                  label: Text(
                    'Who We Are'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    primary: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => contactStudioRead()));
                  },
                  icon: Icon(Icons.web_asset_sharp),
                  label: Text(
                    'Contact'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    primary: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text(
                'Back'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(30),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const HomeScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
