import 'dart:io';
import 'dart:typed_data';

import 'package:aplikasi_website_qun/Admin/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;
import 'package:uuid/uuid.dart';

import 'dart:async';

import '../services/global_method.dart';

class addPortfolioFilms extends StatefulWidget {
  const addPortfolioFilms({Key? key}) : super(key: key);

  @override
  State<addPortfolioFilms> createState() => _addPortfolioFilmsState();
}

class _addPortfolioFilmsState extends State<addPortfolioFilms> {
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
  File? _pickedImage10;
  Uint8List webImage = Uint8List(8);
  Uint8List webImage2 = Uint8List(8);
  Uint8List webImage3 = Uint8List(8);
  Uint8List webImage4 = Uint8List(8);
  Uint8List webImage5 = Uint8List(8);
  Uint8List webImage6 = Uint8List(8);
  Uint8List webImage7 = Uint8List(8);
  Uint8List webImage8 = Uint8List(8);
  Uint8List webImage9 = Uint8List(8);
  Uint8List webImage10 = Uint8List(8);
  final picker = ImagePicker();

  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController synopsisController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController trailerLinkController = TextEditingController();
  TextEditingController directedByController = TextEditingController();
  TextEditingController starring1Controller = TextEditingController();
  TextEditingController starring2Controller = TextEditingController();
  TextEditingController starring3Controller = TextEditingController();
  TextEditingController starring4Controller = TextEditingController();
  TextEditingController starring5Controller = TextEditingController();
  TextEditingController starring6Controller = TextEditingController();
  TextEditingController starring7Controller = TextEditingController();
  TextEditingController starring8Controller = TextEditingController();
  TextEditingController starring9Controller = TextEditingController();
  TextEditingController starring10Controller = TextEditingController();

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
      } else if (_pickedImage2 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage3 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage4 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage5 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage6 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage7 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage8 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage9 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      } else if (_pickedImage10 == null) {
        GlobalMethods.errorDialog(
            subtitle: 'Please pick up an image', context: context);
        return;
      }
      final _uuid = const Uuid().v4();
      final _uuid2 = const Uuid().v4();
      final _uuid3 = const Uuid().v4();
      final _uuid4 = const Uuid().v4();
      final _uuid5 = const Uuid().v4();
      final _uuid6 = const Uuid().v4();
      final _uuid7 = const Uuid().v4();
      final _uuid8 = const Uuid().v4();
      final _uuid9 = const Uuid().v4();
      final _uuid10 = const Uuid().v4();
      try {
        setState(() {
          _isLoading = true;
        });
        fb.StorageReference storageRef =
            fb.storage().ref().child('portfolioImages').child(_uuid + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot =
            await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
        Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
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
        fb.StorageReference storageRef8 =
            fb.storage().ref().child('portfolioImages').child(_uuid8 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot8 =
            await storageRef8.put(kIsWeb ? webImage8 : _pickedImage8).future;
        Uri imageUri8 = await uploadTaskSnapshot8.ref.getDownloadURL();
        fb.StorageReference storageRef9 =
            fb.storage().ref().child('portfolioImages').child(_uuid9 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot9 =
            await storageRef9.put(kIsWeb ? webImage9 : _pickedImage9).future;
        Uri imageUri9 = await uploadTaskSnapshot9.ref.getDownloadURL();
        fb.StorageReference storageRef10 =
            fb.storage().ref().child('portfolioImages').child(_uuid10 + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot10 =
            await storageRef10.put(kIsWeb ? webImage10 : _pickedImage10).future;
        Uri imageUri10 = await uploadTaskSnapshot10.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("portfoliofilm")
            .doc(_uuid)
            .set({
          'id': _uuid,
          'title': titleController.text,
          'cat': categoryController.text,
          'year': yearController.text,
          'synopsis': synopsisController.text,
          'trailer': trailerLinkController.text,
          'directedBy': directedByController.text,
          'starring1': starring1Controller.text,
          'starring2': starring2Controller.text,
          'starring3': starring3Controller.text,
          'starring4': starring4Controller.text,
          'starring5': starring5Controller.text,
          'starring6': starring6Controller.text,
          'starring7': starring7Controller.text,
          'starring8': starring8Controller.text,
          'starring9': starring9Controller.text,
          'starring10': starring10Controller.text,
          'imageUrl': imageUri.toString(),
          'imageUrl2': imageUri2.toString(),
          'imageUrl3': imageUri3.toString(),
          'imageUrl4': imageUri4.toString(),
          'imageUrl5': imageUri5.toString(),
          'imageUrl6': imageUri6.toString(),
          'imageUrl7': imageUri7.toString(),
          'imageUrl8': imageUri8.toString(),
          'imageUrl9': imageUri9.toString(),
          'imageUrl10': imageUri10.toString(),
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
    categoryController.clear();
    synopsisController.clear();
    yearController.clear();
    trailerLinkController.clear();
    directedByController.clear();
    starring1Controller.clear();
    starring2Controller.clear();
    starring3Controller.clear();
    starring4Controller.clear();
    starring5Controller.clear();
    starring6Controller.clear();
    setState(() {
      _pickedImage = null;
      webImage = Uint8List(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: SafeArea(
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
                      'Judul',
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
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Judul',
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const Text(
                      'Kategori',
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
                      controller: categoryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Kategori',
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const Text(
                      'Tahun',
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
                      controller: yearController,
                      minLines: 1,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Tahun',
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const Text(
                      'Written And Directed By',
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
                      controller: directedByController,
                      minLines: 1,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan teks',
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const Text(
                      'Trailer Video (Youtube Embed)',
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
                      controller: trailerLinkController,
                      minLines: 1,
                      maxLines: 1,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Kode Embed',
                      ),
                    ),
                  ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  //   child: const Text(
                  //     'Trailer Link',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //         color: Color.fromARGB(255, 0, 0, 0),
                  //         fontFamily: 'Agentur',
                  //         fontSize: 24,
                  //         decoration: TextDecoration.underline,
                  //         letterSpacing:
                  //             0 /*percentages not used in flutter. defaulting to zero*/,
                  //         fontWeight: FontWeight.normal,
                  //         height: 1),
                  //   ),
                  // ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  //   child: TextFormField(
                  //     controller: trailerLinkController,
                  //     minLines: 1,
                  //     maxLines: 1,
                  //     keyboardType: TextInputType.url,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       hintText: 'Masukan Link',
                  //     ),
                  //   ),
                  // ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const Text(
                      'Starring',
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring1Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring2Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring3Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring4Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring5Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring6Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring7Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring8Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring9Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 200,
                            child: TextFormField(
                              controller: starring10Controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Masukan Nama',
                              ),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const Text(
                      'Upload Image',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage = null;
                                        webImage = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage == null
                                            ? dottedBorder(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage2 = null;
                                        webImage2 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage2 == null
                                            ? dottedBorder2(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage3 = null;
                                        webImage3 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage3 == null
                                            ? dottedBorder3(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage4 = null;
                                        webImage4 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage4 == null
                                            ? dottedBorder4(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage5 = null;
                                        webImage5 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage5 == null
                                            ? dottedBorder5(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage6 = null;
                                        webImage6 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage6 == null
                                            ? dottedBorder6(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage7 = null;
                                        webImage7 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage7 == null
                                            ? dottedBorder7(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage8 = null;
                                        webImage8 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage8 == null
                                            ? dottedBorder8(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
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
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage9 = null;
                                        webImage9 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage9 == null
                                            ? dottedBorder9(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: kIsWeb
                                                    ? Image.memory(webImage9,
                                                        fit: BoxFit.fill)
                                                    : Image.file(_pickedImage9!,
                                                        fit: BoxFit.fill),
                                              )),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        _pickedImage10 = null;
                                        webImage10 = Uint8List(8);
                                      });
                                    },
                                    child: Text("Clear")),
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width >
                                                    650
                                                ? 350
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.45,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: _pickedImage10 == null
                                            ? dottedBorder10(color: Colors.red)
                                            : Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: kIsWeb
                                                    ? Image.memory(webImage10,
                                                        fit: BoxFit.fill)
                                                    : Image.file(
                                                        _pickedImage10!,
                                                        fit: BoxFit.fill),
                                              )),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: const Text(
                      'Sinopsis',
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
                      controller: synopsisController,
                      minLines: 10,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Masukan Sinopsis',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: () {
                          _uploadForm();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
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
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
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

  Future<void> _pickImage10() async {
    if (!kIsWeb) {
      final ImagePicker _picker10 = ImagePicker();
      XFile? image10 = await _picker10.pickImage(source: ImageSource.gallery);
      if (image10 != null) {
        var selected = File(image10.path);
        setState(() {
          _pickedImage10 = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker10 = ImagePicker();
      XFile? image10 = await _picker10.pickImage(source: ImageSource.gallery);
      if (image10 != null) {
        var f = await image10.readAsBytes();
        setState(() {
          webImage10 = f;
          _pickedImage10 = File('a');
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
                      text: 'Select Image',
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
                      text: 'Select Image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  Widget dottedBorder10({
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
                      _pickImage10();
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
