import 'package:aplikasi_website_qun/Admin/authentication/login_screen.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_News.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/buildtogetherLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/evolutionLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/freshIdeationLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/imaginationLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/peaceofmindLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/positifChangeLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/revolutionaryLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/LoadingScreen/spiritLoading.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/News/NewsStudio.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/about.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/contact.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/home_page.dart';
import 'package:aplikasi_website_qun/QunStudio/screens/portfolio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aplikasi_website_qun/LandingPage.dart';
import 'package:aplikasi_website_qun/QunFilms/AboutFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/Films.dart';
import 'package:aplikasi_website_qun/QunFilms/HomeFilmsPage.dart';
import 'package:aplikasi_website_qun/QunFilms/MenuFilms.dart';
import 'package:aplikasi_website_qun/QunFilms/News/News.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDguKQg32SZHSlG2JdxoQU5ge8k3wrvaAI",
        authDomain: "web-qun.firebaseapp.com",
        projectId: "web-qun",
        storageBucket: "web-qun.appspot.com",
        messagingSenderId: "739703224638",
        appId: "1:739703224638:web:da6078e431327acfb4946f",
        measurementId: "G-1JXP6D89WR"),
  );
  runApp(const QunWebsite());
}

class QunWebsite extends StatelessWidget {
  const QunWebsite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qun Films & Studio',
        home: const LandingPage(),
        routes: {
          // USER INTERFACE
          LandingPage.routeName: (context) => const LandingPage(),
          HomeFilmsPage.routeName: (context) => const HomeFilmsPage(),
          Films.routeName: (context) => const Films(),
          AboutFilms.routeName: (context) => const AboutFilms(),
          MenuFilms.routeName: (context) => const MenuFilms(),
          NewsPage.routeName: (context) => const NewsPage(),
          HomePage.routeName: (context) => HomePage(),
          AboutScreen.routeName: (context) => const AboutScreen(),
          Portfoliio.routeName: (context) => Portfoliio(),
          Contact.routeName: (context) => const Contact(),
          NewsPageStudio.routeName: (context) => const NewsPageStudio(),

          // ADMIN INTERFACE
          LoginScreen.routeName: (context) => const LoginScreen(),

          //LoadingScreen

          buildTogethetLoading.routeName: (context) =>
              const buildTogethetLoading(),
          evolutionScreenLoading.routeName: (context) =>
              const evolutionScreenLoading(),
          freshIdeaLoadingScreen.routeName: (context) =>
              const freshIdeaLoadingScreen(),
          imaginationScreenLoading.routeName: (context) =>
              const imaginationScreenLoading(),
          peaceofmindLoadingScreen.routeName: (context) =>
              const peaceofmindLoadingScreen(),
          positifCangeLoadingScreen.routeName: (context) =>
              const positifCangeLoadingScreen(),
          revolutionaryLoadingScreen.routeName: (context) =>
              const revolutionaryLoadingScreen(),
          spiritLoadingScreen.routeName: (context) =>
              const spiritLoadingScreen(),
          readNews.routeName: (context) => const readNews(),
        });
  }
}
