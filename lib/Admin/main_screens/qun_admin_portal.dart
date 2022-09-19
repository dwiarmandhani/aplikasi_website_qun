import 'package:aplikasi_website_qun/Admin/main_screens/read_AboutFilms.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_TheMindsBehind.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_contact.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_landingPageFilms.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_portfolioFilms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/home_screen.dart';

class qunFilmAdmin extends StatefulWidget {
  const qunFilmAdmin({Key? key}) : super(key: key);

  @override
  State<qunFilmAdmin> createState() => _qunFilmAdminState();
}

class _qunFilmAdminState extends State<qunFilmAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        title: const Text(
          'Welcome to Admin Qun Film Portal',
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
            SizedBox(
              height: 50,
            ),
            //user activate and block accounts button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => LandingPageFilmsRead()));
                  },
                  icon: Icon(Icons.web_asset_sharp),
                  label: Text(
                    'Landing Page'.toUpperCase(),
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

                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => readFilmsPortfolio()));
                  },
                  icon: Icon(Icons.person_add),
                  label: Text(
                    'Home'.toUpperCase(),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => readFilmsPortfolio()));
                  },
                  icon: Icon(Icons.note_add),
                  label: Text(
                    'Portfolio'.toUpperCase(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => readAboutFilmsInput()));
                  },
                  icon: Icon(Icons.question_answer_sharp),
                  label: Text(
                    'About'.toUpperCase(),
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
                        MaterialPageRoute(builder: (c) => readContact()));
                  },
                  icon: Icon(Icons.contact_page_sharp),
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
                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => readTheMindBehinds()));
                  },
                  icon: Icon(Icons.people_rounded),
                  label: Text(
                    'The Minds Behind'.toUpperCase(),
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
            ),
          ],
        ),
      ),
    );
  }
}
