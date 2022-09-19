import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';
import 'dart:io';

class addTheMindsBehind extends StatefulWidget {
  const addTheMindsBehind({Key? key}) : super(key: key);

  @override
  State<addTheMindsBehind> createState() => _addTheMindsBehindState();
}

class _addTheMindsBehindState extends State<addTheMindsBehind> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: const Text(
                  'ROLE 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 36,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: const Text(
                  'Nickname',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Nickname',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Role',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Upload Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            imageSelect();
                          },
                          child: Text("Select Image")),
                      Container(
                        height: 150,
                        width: 150,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: _imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('Data');
                            }),
                      )
                    ],
                  )),

              // ROLE 2
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'ROLE 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 36,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Nickname',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Nickname',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Role',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Upload Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            imageSelect();
                          },
                          child: Text("Select Image")),
                      Container(
                        height: 150,
                        width: 150,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: _imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('Data');
                            }),
                      )
                    ],
                  )),
              //ROLE 3
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'ROLE 3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 36,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Nickname',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Nickname',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Role',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Upload Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            imageSelect();
                          },
                          child: Text("Select Image")),
                      Container(
                        height: 150,
                        width: 150,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: _imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('Data');
                            }),
                      )
                    ],
                  )),
              // ROLE 4
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'ROLE 4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 36,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Nickname',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Nickname',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Role',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Upload Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            imageSelect();
                          },
                          child: Text("Select Image")),
                      Container(
                        height: 150,
                        width: 150,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: _imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('Data');
                            }),
                      )
                    ],
                  )),
              // ROLE 5
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'ROLE 5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 36,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Nickname',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Nickname',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Role',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Upload Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            imageSelect();
                          },
                          child: Text("Select Image")),
                      Container(
                        height: 150,
                        width: 150,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: _imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('Data');
                            }),
                      )
                    ],
                  )),
              // ROLE 6
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'ROLE 6',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 36,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Nickname',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Nickname',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Role',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Role',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Upload Photo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 24,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            imageSelect();
                          },
                          child: Text("Select Image")),
                      Container(
                        height: 150,
                        width: 150,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemCount: _imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text('Data');
                            }),
                      )
                    ],
                  )),
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Submit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'Rubik',
                                fontSize: 36,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void imageSelect() async {
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectedImage!.path.isNotEmpty) {
      _imageList.add(selectedImage);
    }
    setState(() {});
  }
}
