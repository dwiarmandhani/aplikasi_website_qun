import 'package:aplikasi_website_qun/Admin/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';

// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;
import 'package:uuid/uuid.dart';

import 'dart:async';
import 'dart:io';

import 'dart:typed_data';

import '../services/global_method.dart';

class addDetailPortoStudio extends StatefulWidget {
  const addDetailPortoStudio({Key? key}) : super(key: key);

  @override
  State<addDetailPortoStudio> createState() => _addDetailPortoStudioState();
}

class _addDetailPortoStudioState extends State<addDetailPortoStudio> {
  File? _pickedImage;
  File? _pickedImage1;
  File? _pickedImage2;
  File? _pickedImage3;
  File? _pickedImage4;
  File? _pickedImage5;
  File? _pickedImage6;
  File? _pickedImage7;
  Uint8List webImage = Uint8List(8);
  Uint8List webImage1 = Uint8List(8);
  Uint8List webImage2 = Uint8List(8);
  Uint8List webImage3 = Uint8List(8);
  Uint8List webImage4 = Uint8List(8);
  Uint8List webImage5 = Uint8List(8);
  Uint8List webImage6 = Uint8List(8);
  Uint8List webImage7 = Uint8List(8);

  final picker = ImagePicker();
  final picker1 = ImagePicker();
  final picker2 = ImagePicker();
  final picker3 = ImagePicker();
  final picker4 = ImagePicker();
  final picker5 = ImagePicker();
  final picker6 = ImagePicker();
  final picker7 = ImagePicker();

  final _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController deliverableController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController chalController = TextEditingController();
  TextEditingController solutionController = TextEditingController();

  bool _isLoading = false;
  void _uploadForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      if (_pickedImage == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      }
      final _uuid = const Uuid().v4();
      final _uuid1 = const Uuid().v4();
      final _uuid2 = const Uuid().v4();
      final _uuid3 = const Uuid().v4();
      final _uuid4 = const Uuid().v4();
      final _uuid5 = const Uuid().v4();
      final _uuid6 = const Uuid().v4();
      final _uuid7 = const Uuid().v4();
      try {
        setState(() {
          _isLoading = true;
        });
        fb.StorageReference storageRef =
            fb.storage().ref().child('portfolioImages').child(_uuid + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot =
            await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
        Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
        fb.StorageReference storageRef1 =
            fb.storage().ref().child('portfolioImages').child(_uuid1 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot1 =
            await storageRef1.put(kIsWeb ? webImage1 : _pickedImage1).future;
        Uri imageUri1 = await uploadTaskSnapshot1.ref.getDownloadURL();
        fb.StorageReference storageRef2 =
            fb.storage().ref().child('portfolioImages').child(_uuid2 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot2 =
            await storageRef2.put(kIsWeb ? webImage2 : _pickedImage2).future;
        Uri imageUri2 = await uploadTaskSnapshot2.ref.getDownloadURL();
        fb.StorageReference storageRef3 =
            fb.storage().ref().child('portfolioImages').child(_uuid3 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot3 =
            await storageRef3.put(kIsWeb ? webImage3 : _pickedImage3).future;
        Uri imageUri3 = await uploadTaskSnapshot3.ref.getDownloadURL();
        fb.StorageReference storageRef4 =
            fb.storage().ref().child('portfolioImages').child(_uuid4 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot4 =
            await storageRef4.put(kIsWeb ? webImage4 : _pickedImage4).future;
        Uri imageUri4 = await uploadTaskSnapshot4.ref.getDownloadURL();
        fb.StorageReference storageRef5 =
            fb.storage().ref().child('portfolioImages').child(_uuid5 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot5 =
            await storageRef5.put(kIsWeb ? webImage5 : _pickedImage5).future;
        Uri imageUri5 = await uploadTaskSnapshot5.ref.getDownloadURL();
        fb.StorageReference storageRef6 =
            fb.storage().ref().child('portfolioImages').child(_uuid6 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot6 =
            await storageRef6.put(kIsWeb ? webImage6 : _pickedImage6).future;
        Uri imageUri6 = await uploadTaskSnapshot6.ref.getDownloadURL();
        fb.StorageReference storageRef7 =
            fb.storage().ref().child('portfolioImages').child(_uuid7 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot7 =
            await storageRef7.put(kIsWeb ? webImage7 : _pickedImage7).future;
        Uri imageUri7 = await uploadTaskSnapshot7.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("portfolioStudio")
            .doc(_uuid)
            .set({
          'id': _uuid,
          'title': titleController.text,
          'subtitle': subtitleController.text,
          'client': clientController.text,
          'deliverable': deliverableController.text,
          'challenge': chalController.text,
          'solution': solutionController.text,
          'desc': descController.text,
          'imageUrl': imageUri.toString(),
          'imageUrl1': imageUri1.toString(),
          'imageUrl2': imageUri2.toString(),
          'imageUrl3': imageUri3.toString(),
          'imageUrl4': imageUri4.toString(),
          'imageUrl5': imageUri5.toString(),
          'imageUrl6': imageUri6.toString(),
          'imageUrl7': imageUri7.toString(),
          'createdAt': Timestamp.now(),
        });
        _clearForm();
        Fluttertoast.showToast(
          msg: "Portfolio uploaded succefully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: ,
          // textColor: ,
          // fontSize: 16.0
        );
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _clearForm() {
    titleController.clear();
    descController.clear();
    subtitleController.clear();
    clientController.clear();
    deliverableController.clear();
    chalController.clear();
    solutionController.clear();
    descController.clear();
    setState(() {
      _pickedImage = null;
      webImage = Uint8List(8);
      _pickedImage1 = null;
      webImage1 = Uint8List(8);
      _pickedImage2 = null;
      webImage2 = Uint8List(8);
      _pickedImage3 = null;
      webImage3 = Uint8List(8);
      _pickedImage4 = null;
      webImage4 = Uint8List(8);
      _pickedImage5 = null;
      webImage5 = Uint8List(8);
      _pickedImage6 = null;
      webImage6 = Uint8List(8);
      _pickedImage7 = null;
      webImage7 = Uint8List(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Judul',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
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
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Sub-Judul',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
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
                    controller: subtitleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image Judul',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage == null
                                    ? dottedBorder(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Clients',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
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
                    controller: clientController,
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Deliverables',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
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
                    controller: deliverableController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Description',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
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
                    controller: descController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Challenges',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
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
                    controller: chalController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Solution',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
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
                    controller: solutionController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage1();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage1 == null
                                    ? dottedBorder1(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage1,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage1!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image 2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage2();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage2 == null
                                    ? dottedBorder2(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage2,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage2!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image 3',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage3();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage3 == null
                                    ? dottedBorder3(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage3,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage3!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image 4',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage4();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage4 == null
                                    ? dottedBorder4(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage4,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage4!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image 5',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage5();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage5 == null
                                    ? dottedBorder5(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage5,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage5!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image 6',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage6();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage6 == null
                                    ? dottedBorder6(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage6,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage6!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Image 7',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 24,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage7();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 1200,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: MediaQuery.of(context).size.width > 650
                                    ? 350
                                    : MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: _pickedImage7 == null
                                    ? dottedBorder7(color: Colors.red)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage7,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage7!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 100,
                ),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                        _uploadForm();
                      },
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
      ),
    );
  }

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage1() async {
    if (!kIsWeb) {
      final ImagePicker _picker1 = ImagePicker();
      XFile? image1 = await _picker1.pickImage(source: ImageSource.gallery);
      if (image1 != null) {
        var selected = File(image1.path);
        setState(() {
          _pickedImage1 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker1 = ImagePicker();
      XFile? image1 = await _picker1.pickImage(source: ImageSource.gallery);
      if (image1 != null) {
        var f = await image1.readAsBytes();
        setState(() {
          webImage1 = f;
          _pickedImage1 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage3() async {
    if (!kIsWeb) {
      final ImagePicker _picker3 = ImagePicker();
      XFile? image3 = await _picker3.pickImage(source: ImageSource.gallery);
      if (image3 != null) {
        var selected = File(image3.path);
        setState(() {
          _pickedImage3 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker3 = ImagePicker();
      XFile? image3 = await _picker3.pickImage(source: ImageSource.gallery);
      if (image3 != null) {
        var f = await image3.readAsBytes();
        setState(() {
          webImage3 = f;
          _pickedImage3 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage4() async {
    if (!kIsWeb) {
      final ImagePicker _picker4 = ImagePicker();
      XFile? image4 = await _picker4.pickImage(source: ImageSource.gallery);
      if (image4 != null) {
        var selected = File(image4.path);
        setState(() {
          _pickedImage4 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker4 = ImagePicker();
      XFile? image4 = await _picker4.pickImage(source: ImageSource.gallery);
      if (image4 != null) {
        var f = await image4.readAsBytes();
        setState(() {
          webImage4 = f;
          _pickedImage4 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage5() async {
    if (!kIsWeb) {
      final ImagePicker _picker5 = ImagePicker();
      XFile? image5 = await _picker5.pickImage(source: ImageSource.gallery);
      if (image5 != null) {
        var selected = File(image5.path);
        setState(() {
          _pickedImage5 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker5 = ImagePicker();
      XFile? image5 = await _picker5.pickImage(source: ImageSource.gallery);
      if (image5 != null) {
        var f = await image5.readAsBytes();
        setState(() {
          webImage5 = f;
          _pickedImage5 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage6() async {
    if (!kIsWeb) {
      final ImagePicker _picker6 = ImagePicker();
      XFile? image6 = await _picker6.pickImage(source: ImageSource.gallery);
      if (image6 != null) {
        var selected = File(image6.path);
        setState(() {
          _pickedImage6 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker6 = ImagePicker();
      XFile? image6 = await _picker6.pickImage(source: ImageSource.gallery);
      if (image6 != null) {
        var f = await image6.readAsBytes();
        setState(() {
          webImage6 = f;
          _pickedImage6 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage7() async {
    if (!kIsWeb) {
      final ImagePicker _picker7 = ImagePicker();
      XFile? image7 = await _picker7.pickImage(source: ImageSource.gallery);
      if (image7 != null) {
        var selected = File(image7.path);
        setState(() {
          _pickedImage7 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker7 = ImagePicker();
      XFile? image7 = await _picker7.pickImage(source: ImageSource.gallery);
      if (image7 != null) {
        var f = await image7.readAsBytes();
        setState(() {
          webImage7 = f;
          _pickedImage7 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage2() async {
    if (!kIsWeb) {
      final ImagePicker _picker2 = ImagePicker();
      XFile? image2 = await _picker2.pickImage(source: ImageSource.gallery);
      if (image2 != null) {
        var selected = File(image2.path);
        setState(() {
          _pickedImage2 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker2 = ImagePicker();
      XFile? image2 = await _picker2.pickImage(source: ImageSource.gallery);
      if (image2 != null) {
        var f = await image2.readAsBytes();
        setState(() {
          webImage2 = f;
          _pickedImage2 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Widget dottedBorder({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder1({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage1();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder2({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage2();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder3({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage3();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder4({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage4();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder5({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage5();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder6({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage6();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder7({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.RRect,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: (() {
                      _pickImage7();
                    }),
                    child: TextWidget(
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }
}
