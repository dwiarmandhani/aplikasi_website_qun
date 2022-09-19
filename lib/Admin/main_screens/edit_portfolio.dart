import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:aplikasi_website_qun/Admin/main_screens/portfolio_read.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_portfolio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../services/global_method.dart';
import '../widgets/text_widget.dart';

class EditPortfolio extends StatefulWidget {
  const EditPortfolio({
    Key? key,
    required this.id,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.subtitle,
    required this.deliverable,
    required this.client,
    required this.challenge,
    required this.solution,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.imageUrl5,
    required this.imageUrl6,
    required this.imageUrl7,
  }) : super(key: key);

  final String id,
      title,
      subtitle,
      deliverable,
      client,
      challenge,
      solution,
      desc,
      imageUrl,
      imageUrl1,
      imageUrl2,
      imageUrl3,
      imageUrl4,
      imageUrl5,
      imageUrl6,
      imageUrl7;

  @override
  State<EditPortfolio> createState() => _EditPortfolioState();
}

class _EditPortfolioState extends State<EditPortfolio> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController,
      _descController,
      _subtitleController,
      _deliverableController,
      _clientController,
      _challengeController,
      _solutionController;

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
  late String _imageUrl;
  late String _imageUrl1;
  late String _imageUrl2;
  late String _imageUrl3;
  late String _imageUrl4;
  late String _imageUrl5;
  late String _imageUrl6;
  late String _imageUrl7;

  bool _isLoading = false;
  bool isDeleting = false;
  @override
  void initState() {
    // set the price and title initial values and initialize the controllers
    _descController = TextEditingController(text: widget.desc);
    _titleController = TextEditingController(text: widget.title);
    _subtitleController = TextEditingController(text: widget.subtitle);
    _deliverableController = TextEditingController(text: widget.deliverable);
    _clientController = TextEditingController(text: widget.client);
    _challengeController = TextEditingController(text: widget.challenge);
    _solutionController = TextEditingController(text: widget.solution);
    // Set the variables
    _imageUrl = widget.imageUrl;
    _imageUrl1 = widget.imageUrl1;
    _imageUrl2 = widget.imageUrl2;
    _imageUrl3 = widget.imageUrl3;
    _imageUrl4 = widget.imageUrl4;
    _imageUrl5 = widget.imageUrl5;
    _imageUrl6 = widget.imageUrl6;
    _imageUrl7 = widget.imageUrl7;
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    _descController.dispose();
    _titleController.dispose();
    _subtitleController.dispose();
    _deliverableController.dispose();
    _clientController.dispose();
    _challengeController.dispose();
    _solutionController.dispose();
    super.dispose();
  }

  void _uploadForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      try {
        Uri? imageUri;
        Uri? imageUri1;
        Uri? imageUri2;
        Uri? imageUri3;
        Uri? imageUri4;
        Uri? imageUri5;
        Uri? imageUri6;
        Uri? imageUri7;
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
          imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
        }
        if (_pickedImage1 != null) {
          fb.StorageReference storageRef1 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl1 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot1 =
              await storageRef1.put(kIsWeb ? webImage1 : _pickedImage1).future;
          imageUri1 = await uploadTaskSnapshot1.ref.getDownloadURL();
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
              .child(widget.imageUrl4 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot4 =
              await storageRef4.put(kIsWeb ? webImage4 : _pickedImage4).future;
          imageUri4 = await uploadTaskSnapshot4.ref.getDownloadURL();
        }
        if (_pickedImage5 != null) {
          fb.StorageReference storageRef5 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl5 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot5 =
              await storageRef5.put(kIsWeb ? webImage5 : _pickedImage5).future;
          imageUri5 = await uploadTaskSnapshot5.ref.getDownloadURL();
        }
        if (_pickedImage6 != null) {
          fb.StorageReference storageRef6 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl6 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot6 =
              await storageRef6.put(kIsWeb ? webImage6 : _pickedImage6).future;
          imageUri6 = await uploadTaskSnapshot6.ref.getDownloadURL();
        }
        if (_pickedImage7 != null) {
          fb.StorageReference storageRef7 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl7 + 'jpg');

          final fb.UploadTaskSnapshot uploadTaskSnapshot7 =
              await storageRef7.put(kIsWeb ? webImage7 : _pickedImage7).future;
          imageUri7 = await uploadTaskSnapshot7.ref.getDownloadURL();
        }
        await FirebaseFirestore.instance
            .collection('portfolioStudio')
            .doc(widget.id)
            .update({
          'title': _titleController.text,
          'desc': _descController.text,
          'challenge': _challengeController.text,
          'client': _clientController.text,
          'deliverable': _deliverableController.text,
          'solution': _solutionController.text,
          'subtitle': _subtitleController.text,
          'imageUrl':
              _pickedImage == null ? widget.imageUrl : imageUri.toString(),
          'imageUrl1':
              _pickedImage1 == null ? widget.imageUrl1 : imageUri1.toString(),
          'imageUrl2':
              _pickedImage2 == null ? widget.imageUrl2 : imageUri2.toString(),
          'imageUrl3':
              _pickedImage3 == null ? widget.imageUrl3 : imageUri3.toString(),
          'imageUrl4':
              _pickedImage4 == null ? widget.imageUrl4 : imageUri4.toString(),
          'imageUrl5':
              _pickedImage5 == null ? widget.imageUrl5 : imageUri5.toString(),
          'imageUrl6':
              _pickedImage6 == null ? widget.imageUrl6 : imageUri6.toString(),
          'imageUrl7':
              _pickedImage7 == null ? widget.imageUrl7 : imageUri7.toString(),
        });
        await Fluttertoast.showToast(
          msg: "Portfolio has been updated",
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

  void deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('portfolioStudio').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('Portfolio item deleted from the database'))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  child: Text('Delete Item'),
                  onPressed: () async {
                    GlobalMethods.warningDialog(
                        title: 'Delete?',
                        subtitle: 'Press okay to confirm',
                        fct: () async {
                          await FirebaseFirestore.instance
                              .collection('portfolioStudio')
                              .doc(widget.id)
                              .delete();
                          await Fluttertoast.showToast(
                            msg: "Portfolio has been deleted",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                          );
                          while (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                        context: context);
                  },
                ),
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
                    controller: _titleController,
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
                    controller: _subtitleController,
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
                            child: Text("Ganti")),
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
                                    ? Image.network(_imageUrl)
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
                    controller: _clientController,
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
                    controller: _deliverableController,
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
                    controller: _challengeController,
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
                    controller: _solutionController,
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
                            child: Text("Ganti")),
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
                                    ? Image.network(_imageUrl1)
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
                            child: Text("Ganti")),
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
                            child: Text("Ganti")),
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
                            child: Text("Ganti")),
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
                            child: Text("Ganti")),
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
                            child: Text("Ganti")),
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
                            child: Text("Ganti")),
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
                                    ? Image.network(_imageUrl7)
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
                      text: 'select hover',
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
}
