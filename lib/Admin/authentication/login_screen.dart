import 'package:aplikasi_website_qun/Admin/main_screens/home_screen.dart';
import 'package:aplikasi_website_qun/LandingPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/AdminPanel';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String adminEmail = '';
  String adminPassword = '';

  allowAdminToLogin() async {
    SnackBar snackBar = const SnackBar(
      content: Text(
        'Checking Credentials, Please wait...',
        style: TextStyle(
          fontSize: 36,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.purpleAccent,
      duration: Duration(
        seconds: 6,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    User? currentAdmin;
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: adminEmail,
      password: adminPassword,
    )
        .then((fAuth) {
      //success
      currentAdmin = fAuth.user;
    }).catchError((onError) {
      //in case of error
      //display error message
      final snackBar = SnackBar(
        content: Text(
          'Error Occured: ' + onError.toString(),
          style: const TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.purpleAccent,
        duration: const Duration(
          seconds: 5,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    if (currentAdmin != null) {
      //check if that admin record also exists in the admins collection in Firestore database
      await FirebaseFirestore.instance
          .collection('admins')
          .doc(currentAdmin!.uid)
          .get()
          .then(((snap) {
        if (snap.exists) {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const HomeScreen()));
        } else {
          SnackBar snackBar = const SnackBar(
            content: Text(
              'No record found, you are not an admin...',
              style: TextStyle(
                fontSize: 36,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.purpleAccent,
            duration: Duration(
              seconds: 6,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.logout),
                    label: Text(
                      'Back to Website'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(30),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const LandingPage()));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: 300,
                          height: 224,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/qun_studio_assets/LogoQunStudio.png')),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: 240,
                          height: 224,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/Qun_brandmark021.png'),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                      ),
                      // Image.asset('assets/images/Qun_brandmark021.png' ),
                    ],
                  ),
                  //email text field
                  TextField(
                    onChanged: (value) {
                      adminEmail = value;
                    },
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                          width: 2,
                        ),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Icon(
                        Icons.email,
                        color: Colors.purpleAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //pasword textfield
                  TextField(
                    onChanged: (value) {
                      adminPassword = value;
                    },
                    obscureText: true,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pinkAccent,
                          width: 2,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Icon(
                        Icons.admin_panel_settings,
                        color: Colors.purpleAccent,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //button login
                  ElevatedButton(
                    onPressed: () {
                      allowAdminToLogin();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purpleAccent),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.pinkAccent),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
