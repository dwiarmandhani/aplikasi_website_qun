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

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../services/global_method.dart';

class addAboutStudio extends StatefulWidget {
  const addAboutStudio({
    Key? key,
    required this.id,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.paragraf1,
    required this.paragraf2,
    required this.paragraf3,
    required this.imageHover1,
    required this.imageHover2,
    required this.imageHover3,
    required this.imageUrl,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.title,
    required this.desc,
    required this.videoLink,
  }) : super(key: key);

  final String id,
      title1,
      title2,
      title3,
      paragraf1,
      paragraf2,
      paragraf3,
      imageHover1,
      imageHover2,
      imageHover3,
      imageUrl,
      imageUrl2,
      imageUrl3,
      title,
      desc,
      videoLink;
  @override
  State<addAboutStudio> createState() => _addAboutStudioState();
}

class _addAboutStudioState extends State<addAboutStudio> {
  final _formKey = GlobalKey<FormState>();
  String description = 'My great package';
  TextEditingController controller = TextEditingController();

  bool _isLoading = false;

  File? _pickedImage,
      _pickedImage2,
      _pickedImage3,
      _pickedImage4,
      _pickedImage5,
      _pickedImage6;
  Uint8List webImage = Uint8List(8);
  Uint8List webImage2 = Uint8List(8);
  Uint8List webImage3 = Uint8List(8);
  Uint8List webImage4 = Uint8List(8);
  Uint8List webImage5 = Uint8List(8);
  Uint8List webImage6 = Uint8List(8);
  final picker = ImagePicker();
  final picker2 = ImagePicker();
  late final TextEditingController _title1Controller,
      _title2Controller,
      _title3Controller,
      _paragraf1Controller,
      _paragraf2Controller,
      _paragraf3Controller,
      _titleController,
      _descController,
      _videoLinkController;
  late String _imageUrl1;
  late String _imageUrl2;
  late String _imageUrl3;
  late String _imageUrl4;
  late String _imageUrl5;
  late String _imageUrl6;

  @override
  void initState() {
    // set the price and title initial values and initialize the controllers
    _title1Controller = TextEditingController(text: widget.title1);
    _title2Controller = TextEditingController(text: widget.title2);
    _title3Controller = TextEditingController(text: widget.title3);
    _paragraf1Controller = TextEditingController(text: widget.paragraf1);
    _paragraf2Controller = TextEditingController(text: widget.paragraf2);
    _paragraf3Controller = TextEditingController(text: widget.paragraf3);
    _titleController = TextEditingController(text: widget.title);
    _descController = TextEditingController(text: widget.desc);
    _videoLinkController = TextEditingController(text: widget.videoLink);
    // Set the variables

    _imageUrl1 = widget.imageUrl;
    _imageUrl2 = widget.imageUrl2;
    _imageUrl3 = widget.imageUrl3;
    _imageUrl4 = widget.imageHover1;
    _imageUrl5 = widget.imageHover2;
    _imageUrl6 = widget.imageHover3;
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    _title1Controller.dispose();
    super.dispose();
  }

  void _uploadForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      try {
        Uri? imageUri1;
        Uri? imageUri2;
        Uri? imageUri3;
        Uri? imageUri4;
        Uri? imageUri5;
        Uri? imageUri6;
        setState(() {
          _isLoading = true;
        });
        if (_pickedImage != null) {
          fb.StorageReference storageRef = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.id + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot =
              await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
          imageUri1 = await uploadTaskSnapshot.ref.getDownloadURL();
        }
        if (_pickedImage2 != null) {
          fb.StorageReference storageRef2 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl2 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot2 =
              await storageRef2.put(kIsWeb ? webImage2 : _pickedImage2).future;
          imageUri2 = await uploadTaskSnapshot2.ref.getDownloadURL();
        }
        if (_pickedImage3 != null) {
          fb.StorageReference storageRef3 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl3 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot3 =
              await storageRef3.put(kIsWeb ? webImage3 : _pickedImage3).future;
          imageUri3 = await uploadTaskSnapshot3.ref.getDownloadURL();
        }
        if (_pickedImage4 != null) {
          fb.StorageReference storageRef4 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover1 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot4 =
              await storageRef4.put(kIsWeb ? webImage4 : _pickedImage4).future;
          imageUri4 = await uploadTaskSnapshot4.ref.getDownloadURL();
        }
        if (_pickedImage5 != null) {
          fb.StorageReference storageRef5 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover2 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot5 =
              await storageRef5.put(kIsWeb ? webImage5 : _pickedImage5).future;
          imageUri5 = await uploadTaskSnapshot5.ref.getDownloadURL();
        }
        if (_pickedImage6 != null) {
          fb.StorageReference storageRef6 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover3 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot6 =
              await storageRef6.put(kIsWeb ? webImage6 : _pickedImage6).future;
          imageUri6 = await uploadTaskSnapshot6.ref.getDownloadURL();
        }

        await FirebaseFirestore.instance
            .collection('aboutStudio')
            .doc(widget.id)
            .update({
          'title1': _title1Controller.text,
          'title2': _title2Controller.text,
          'title3': _title3Controller.text,
          'paragraf1': _paragraf1Controller.text,
          'paragraf2': _paragraf2Controller.text,
          'paragraf3': _paragraf3Controller.text,
          'title': _titleController.text,
          'desc': _descController.text,
          'videoLink': _videoLinkController.text,
          'imageUrl1':
              _pickedImage == null ? widget.imageUrl : imageUri1.toString(),
          'imageUrl2':
              _pickedImage2 == null ? widget.imageUrl2 : imageUri2.toString(),
          'imageUrl3':
              _pickedImage3 == null ? widget.imageUrl3 : imageUri3.toString(),
          'imageHover1':
              _pickedImage4 == null ? widget.imageHover1 : imageUri4.toString(),
          'imageHover2':
              _pickedImage5 == null ? widget.imageHover2 : imageUri5.toString(),
          'imageHover3':
              _pickedImage6 == null ? widget.imageHover3 : imageUri6.toString(),
        });

        await Fluttertoast.showToast(
          msg: "Content has been updated",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
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
                    'DESCRIPTION & HOVER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 36,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Title 1',
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
                    controller: _title1Controller,
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
                    'Paragraf 1',
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
                    controller: _paragraf1Controller,
                    minLines: 10,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Title 2',
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
                    controller: _title2Controller,
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
                    'Paragraf 2',
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
                    controller: _paragraf2Controller,
                    minLines: 10,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Title 3',
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
                    controller: _title3Controller,
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
                    'Paragraf 3',
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
                    controller: _paragraf3Controller,
                    minLines: 10,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Upload Hover (Open-Minded)',
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
                            child: Text("Pick Image")),
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
                                    ? Image.network(_imageUrl4)
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
                    'Upload Hover (We Are here)',
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
                            child: Text("Pick Image")),
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
                                    ? Image.network(_imageUrl5)
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
                    'Upload Hover (Inventive)',
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
                                setState(() {
                                  _pickImage6();
                                });
                              });
                            },
                            child: Text("Pick Image")),
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
                                    ? Image.network(_imageUrl6)
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

                // Upload Gambar Caraousel Max 3
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Gambar 1',
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
                            child: Text("Pick Image")),
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
                                    ? Image.network(_imageUrl1)
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
                    'Gambar 2',
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
                            child: Text("Pick Image")),
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
                                    ? Image.network(_imageUrl2)
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
                    'Gambar 3',
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
                            child: Text("Pick Image")),
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
                                    ? Image.network(_imageUrl3)
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
                    'SUBSDIARY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Physis-Black',
                        fontSize: 36,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Title',
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
                    controller: _titleController,
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
                    controller: _descController,
                    minLines: 10,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'Video Youtube(Embed)',
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
                    controller: _videoLinkController,
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
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
                      text: 'select hover',
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
                      text: 'select hover',
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
                      text: 'select hover',
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
                      text: 'select hover',
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
                      text: 'select hover',
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
                      text: 'select hover',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }
}
