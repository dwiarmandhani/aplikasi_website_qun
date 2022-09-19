import 'dart:io';
import 'dart:typed_data';

import 'package:aplikasi_website_qun/Admin/main_screens/portfolio_read.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import '../services/global_method.dart';
// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;

import '../models/portofolio_model.dart';
import '../widgets/text_widget.dart';

class AddPortfolio extends StatefulWidget {
  static const routeName = '/Add-Portofolio';
  const AddPortfolio({
    Key? key,
  }) : super(key: key);

  @override
  State<AddPortfolio> createState() => _AddPortfolioState();
}

class _AddPortfolioState extends State<AddPortfolio> {
  final _formKey = GlobalKey<FormState>();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

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
      try {
        setState(() {
          _isLoading = true;
        });
        fb.StorageReference storageRef =
            fb.storage().ref().child('portfolioImages').child(_uuid + 'jpg');
        final fb.UploadTaskSnapshot uploadTaskSnapshot =
            await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
        Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
        await FirebaseFirestore.instance
            .collection("portfolio")
            .doc(_uuid)
            .set({
          'id': _uuid,
          'title': titleController.text,
          'desc': descController.text,
          'imageUrl': imageUri.toString(),
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
    setState(() {
      _pickedImage = null;
      webImage = Uint8List(8);
    });
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.purpleAccent, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),

            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (c) => Portfolio_Read()));
            },
            child: Text('View Portfolio'),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Text('Add Portfolio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center),
            SizedBox(
              height: 50,
            ),
            _buildTextField(titleController, 'Title'),
            SizedBox(
              height: 20,
            ),
            _buildTextField(descController, 'Desc'),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: MediaQuery.of(context).size.width > 650
                        ? 350
                        : MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: _pickedImage == null
                        ? dottedBorder(color: Colors.red)
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: kIsWeb
                                ? Image.memory(webImage, fit: BoxFit.fill)
                                : Image.file(_pickedImage!, fit: BoxFit.fill),
                          )),
              ),
            ),
            Expanded(
                flex: 1,
                child: FittedBox(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _pickedImage = null;
                            webImage = Uint8List(8);
                          });
                        },
                        child: TextWidget(
                          text: 'Clear',
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _uploadForm();
              },
              child: const Text('Add Portfolio'),
            ),
          ]),
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
                      text: 'Choose an image',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }
}
