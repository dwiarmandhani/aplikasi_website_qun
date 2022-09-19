import 'dart:async';

import 'package:aplikasi_website_qun/Admin/main_screens/qunStudioAdmin.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/qun_admin_portal.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_News.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../authentication/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String timeText = "";
  String dateText = "";

  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurremtLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if (this.mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    //date
    dateText = formatCurrentDate(DateTime.now());

    Timer.periodic(Duration(seconds: 1), (timer) {
      getCurremtLiveTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.cyan,
              ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
          'Welcome to Admin Qun Portal',
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                timeText + '\n' + dateText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                            builder: (c) => const QunStudioRead()));
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.black,
                  ),
                  label: Text(
                    'Qun Studio'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    primary: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                //block
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => const qunFilmAdmin()));
                  },
                  icon: Icon(Icons.person_add, color: Colors.black),
                  label: Text(
                    'Qun Films'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                    primary: Colors.cyanAccent,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //logout button
            ElevatedButton.icon(
              icon: Icon(Icons.newspaper),
              label: Text(
                'News'.toUpperCase(),
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
                Navigator.pushNamed(context, '/NewsEditor');
              },
            ),

            const SizedBox(
              height: 20,
            ),

            //logout button
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text(
                'Logout'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  letterSpacing: 3,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: const EdgeInsets.all(30),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const LoginScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
