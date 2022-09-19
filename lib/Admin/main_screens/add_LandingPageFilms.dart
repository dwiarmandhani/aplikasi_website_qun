import 'package:aplikasi_website_qun/Admin/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:aplikasi_website_qun/Admin/widgets/text_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editable_textinput/format_markdown.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';

// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import '../services/global_method.dart';

class LandingPageFilmsAdd extends StatefulWidget {
  const LandingPageFilmsAdd(
      {Key? key, required this.id, required this.desc, required this.imageUrl})
      : super(key: key);

  final String id, desc, imageUrl;

  @override
  State<LandingPageFilmsAdd> createState() => _LandingPageFilmsAddState();
}

class _LandingPageFilmsAddState extends State<LandingPageFilmsAdd> {
  final _formKey = GlobalKey<FormState>();
  String description = 'My great package';
  TextEditingController controller = TextEditingController();
  late final TextEditingController _controller;

  bool _isLoading = false;

  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  final picker = ImagePicker();
  late String _imageUrl;

  void initState() {
    // set the price and title initial values and initialize the controllers
    _controller = TextEditingController(text: widget.desc);

    // Set the variables
    _imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    _controller.dispose();
    super.dispose();
  }

  void _uploadForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      try {
        Uri? imageUri;
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
        await FirebaseFirestore.instance
            .collection('landingFilm')
            .doc(widget.id)
            .update({
          'desc': _controller.text,
          'imageUrl':
              _pickedImage == null ? widget.imageUrl : imageUri.toString(),
        });
        await Fluttertoast.showToast(
          msg: "Landing has been updated",
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
        FirebaseFirestore.instance.collection('landingFilm').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('Landing item deleted from the database'))
        .catchError((e) => print(e));
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.purpleAccent, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.white),

            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                    'Upload Bumper',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _pickImage();
                              });
                            },
                            child: const Text("Clear")),
                        Container(
                          padding: EdgeInsets.all(100),
                          child: Container(
                              padding: const EdgeInsets.all(8.0),
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
                        )
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                                child: _buildTextField(
                                    _controller, 'Description')),
                          ],
                        ),
                      )
                    ],
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
                          children: const <Widget>[
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
                      text: 'select video',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }
}
