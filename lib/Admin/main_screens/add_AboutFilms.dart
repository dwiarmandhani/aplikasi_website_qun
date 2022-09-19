import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:aplikasi_website_qun/Admin/widgets/text_widget.dart';

// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/foundation.dart';

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../services/global_method.dart';

class addAboutFilms extends StatefulWidget {
  const addAboutFilms({
    Key? key,
    required this.id,
    required this.title,
    required this.paragraf1,
    required this.paragraf2,
    required this.imageHover1,
    required this.imageHover2,
    required this.imageHover3,
    required this.imageHover4,
    required this.imageHover5,
    required this.imageHover6,
    required this.imageHover7,
    required this.imageHover8,
    required this.desc,
    required this.videoUrl,
    required this.concept,
    required this.photoProduction,
    required this.postProduction,
    required this.preProduction,
    required this.videoProduction,
  }) : super(key: key);

  final String id,
      title,
      paragraf1,
      paragraf2,
      imageHover1,
      imageHover2,
      imageHover3,
      imageHover4,
      imageHover5,
      imageHover6,
      imageHover7,
      imageHover8,
      desc,
      videoUrl,
      concept,
      photoProduction,
      postProduction,
      preProduction,
      videoProduction;

  @override
  State<addAboutFilms> createState() => _addAboutFilmsState();
}

class _addAboutFilmsState extends State<addAboutFilms> {
  final _formKey = GlobalKey<FormState>();
  File? _pickedImage;
  File? _pickedImage2;
  File? _pickedImage3;
  File? _pickedImage4;
  File? _pickedImage5;
  File? _pickedImage6;
  File? _pickedImage7;
  File? _pickedImage8;
  File? _pickedImage9;
  Uint8List webImage = Uint8List(8);
  Uint8List webImage2 = Uint8List(8);
  Uint8List webImage3 = Uint8List(8);
  Uint8List webImage4 = Uint8List(8);
  Uint8List webImage5 = Uint8List(8);
  Uint8List webImage6 = Uint8List(8);
  Uint8List webImage7 = Uint8List(8);
  Uint8List webImage8 = Uint8List(8);
  Uint8List webImage9 = Uint8List(8);
  final picker = ImagePicker();
  bool _isLoading = false;

  late final TextEditingController _paragraf1Controller,
      _paragraf2Controller,
      _titleController,
      _descController,
      _conceptController,
      _photoProductionController,
      _postProductionController,
      _preProductionController,
      _videoProductionController;
  late String _imageHover1;
  late String _imageHover2;
  late String _imageHover3;
  late String _imageHover4;
  late String _imageHover5;
  late String _imageHover6;
  late String _imageHover7;
  late String _imageHover8;
  late String _videoUrl;

  @override
  void initState() {
    // set the price and title initial values and initialize the controllers
    _paragraf1Controller = TextEditingController(text: widget.paragraf1);
    _paragraf2Controller = TextEditingController(text: widget.paragraf2);
    _titleController = TextEditingController(text: widget.title);
    _descController = TextEditingController(text: widget.desc);
    _conceptController = TextEditingController(text: widget.concept);
    _photoProductionController =
        TextEditingController(text: widget.photoProduction);
    _postProductionController =
        TextEditingController(text: widget.postProduction);
    _preProductionController =
        TextEditingController(text: widget.preProduction);
    _videoProductionController =
        TextEditingController(text: widget.videoProduction);
    // Set the variables
    _imageHover1 = widget.imageHover1;
    _imageHover2 = widget.imageHover2;
    _imageHover3 = widget.imageHover3;
    _imageHover4 = widget.imageHover4;
    _imageHover5 = widget.imageHover5;
    _imageHover6 = widget.imageHover6;
    _imageHover7 = widget.imageHover7;
    _imageHover8 = widget.imageHover8;
    _videoUrl = widget.videoUrl;
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    _titleController.dispose();
    _paragraf1Controller.dispose();
    _paragraf2Controller.dispose();
    _descController.dispose();
    _conceptController.dispose();
    _photoProductionController.dispose();
    _postProductionController.dispose();
    _preProductionController.dispose();
    _videoProductionController.dispose();
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
        Uri? imageUri7;
        Uri? imageUri8;
        Uri? imageUri9;
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
              .child(widget.imageHover2 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot2 =
              await storageRef2.put(kIsWeb ? webImage2 : _pickedImage2).future;
          imageUri2 = await uploadTaskSnapshot2.ref.getDownloadURL();
        }
        if (_pickedImage3 != null) {
          fb.StorageReference storageRef3 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover3 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot3 =
              await storageRef3.put(kIsWeb ? webImage3 : _pickedImage3).future;
          imageUri3 = await uploadTaskSnapshot3.ref.getDownloadURL();
        }
        if (_pickedImage4 != null) {
          fb.StorageReference storageRef4 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover4 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot4 =
              await storageRef4.put(kIsWeb ? webImage4 : _pickedImage4).future;
          imageUri4 = await uploadTaskSnapshot4.ref.getDownloadURL();
        }
        if (_pickedImage5 != null) {
          fb.StorageReference storageRef5 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover5 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot5 =
              await storageRef5.put(kIsWeb ? webImage5 : _pickedImage5).future;
          imageUri5 = await uploadTaskSnapshot5.ref.getDownloadURL();
        }
        if (_pickedImage6 != null) {
          fb.StorageReference storageRef6 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover6 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot6 =
              await storageRef6.put(kIsWeb ? webImage6 : _pickedImage6).future;
          imageUri6 = await uploadTaskSnapshot6.ref.getDownloadURL();
        }
        if (_pickedImage7 != null) {
          fb.StorageReference storageRef7 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover7 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot7 =
              await storageRef7.put(kIsWeb ? webImage7 : _pickedImage7).future;
          imageUri7 = await uploadTaskSnapshot7.ref.getDownloadURL();
        }
        if (_pickedImage8 != null) {
          fb.StorageReference storageRef8 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageHover8 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot8 =
              await storageRef8.put(kIsWeb ? webImage8 : _pickedImage8).future;
          imageUri8 = await uploadTaskSnapshot8.ref.getDownloadURL();
        }
        if (_pickedImage9 != null) {
          fb.StorageReference storageRef9 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.videoUrl + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot9 =
              await storageRef9.put(kIsWeb ? webImage9 : _pickedImage9).future;
          imageUri9 = await uploadTaskSnapshot9.ref.getDownloadURL();
        }

        await FirebaseFirestore.instance
            .collection('aboutFilm')
            .doc(widget.id)
            .update({
          'paragraf1': _paragraf1Controller.text,
          'paragraf2': _paragraf2Controller.text,
          'title': _titleController.text,
          'desc': _descController.text,
          'concept': _conceptController.text,
          'photoProduction': _photoProductionController.text,
          'postProduction': _postProductionController.text,
          'preProduction': _preProductionController.text,
          'videoProduction': _videoProductionController.text,
          'imageHover1':
              _pickedImage == null ? widget.imageHover1 : imageUri1.toString(),
          'imageHover2':
              _pickedImage2 == null ? widget.imageHover2 : imageUri2.toString(),
          'imageHover3':
              _pickedImage3 == null ? widget.imageHover3 : imageUri3.toString(),
          'imageHover4':
              _pickedImage4 == null ? widget.imageHover4 : imageUri4.toString(),
          'imageHover5':
              _pickedImage5 == null ? widget.imageHover5 : imageUri5.toString(),
          'imageHover6':
              _pickedImage6 == null ? widget.imageHover6 : imageUri6.toString(),
          'imageHover7':
              _pickedImage7 == null ? widget.imageHover7 : imageUri7.toString(),
          'imageHover8':
              _pickedImage8 == null ? widget.imageHover8 : imageUri8.toString(),
          'videoUrl':
              _pickedImage9 == null ? widget.videoUrl : imageUri9.toString(),
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
                    'DESKRIPSI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Agentur',
                        fontSize: 48,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Paragraf 1 (QUN FILMS)',
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Paragraf 2 (SUB PARAGRAF)',
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'WHAT WE DO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Agentur',
                        fontSize: 48,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover Documentary',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                          width: 750,
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
                                    ? Image.network(_imageHover1)
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover Feature Film',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                          width: 750,
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
                                    ? Image.network(_imageHover2)
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover Short Film',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                          width: 750,
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
                                    ? Image.network(_imageHover3)
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover TVC',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                          width: 750,
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
                                    ? Image.network(_imageHover4)
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover Campaign/Digital Campaign',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                          width: 750,
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
                                    ? Image.network(_imageHover5)
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover Digital Advertising',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                          width: 750,
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
                                    ? Image.network(_imageHover6)
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover Branding',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
                          width: 750,
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
                                    ? Image.network(_imageHover7)
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Upload Hover Music Video',
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage8();
                              });
                            },
                            child: Text("Clear")),
                        Container(
                          width: 750,
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
                                child: _pickedImage8 == null
                                    ? Image.network(_imageHover8)
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: kIsWeb
                                            ? Image.memory(webImage8,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage8!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'SERVICES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Agentur',
                        fontSize: 48,
                        decoration: TextDecoration.underline,
                        letterSpacing:
                            0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Concept',
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: TextFormField(
                    controller: _conceptController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Pre-Production',
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: TextFormField(
                    controller: _preProductionController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Photo Production',
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: TextFormField(
                    controller: _photoProductionController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Video Production',
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: TextFormField(
                    controller: _videoProductionController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Post Production',
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
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: TextFormField(
                    controller: _postProductionController,
                    minLines: 3,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Text(
                    'SUBSIDIARY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'Agentur',
                        fontSize: 48,
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
                    'JUDUL',
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
                    'Deskripsi',
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
                    controller: null,
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

  Future<void> _pickImage8() async {
    if (!kIsWeb) {
      final ImagePicker _picker8 = ImagePicker();
      XFile? image8 = await _picker8.pickImage(source: ImageSource.gallery);
      if (image8 != null) {
        var selected = File(image8.path);
        setState(() {
          _pickedImage8 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker8 = ImagePicker();
      XFile? image8 = await _picker8.pickImage(source: ImageSource.gallery);
      if (image8 != null) {
        var f = await image8.readAsBytes();
        setState(() {
          webImage8 = f;
          _pickedImage8 = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  Future<void> _pickImage9() async {
    if (!kIsWeb) {
      final ImagePicker _picker9 = ImagePicker();
      XFile? image9 = await _picker9.pickImage(source: ImageSource.gallery);
      if (image9 != null) {
        var selected = File(image9.path);
        setState(() {
          _pickedImage9 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker9 = ImagePicker();
      XFile? image9 = await _picker9.pickImage(source: ImageSource.gallery);
      if (image9 != null) {
        var f = await image9.readAsBytes();
        setState(() {
          webImage9 = f;
          _pickedImage9 = File('a');
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
                      text: 'select hover',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder8({
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
                      _pickImage8();
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

  Widget dottedBorder9({
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
                      _pickImage9();
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
