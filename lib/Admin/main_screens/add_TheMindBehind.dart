import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:aplikasi_website_qun/Admin/models/empty_state.dart';
import 'package:aplikasi_website_qun/Admin/models/form.dart';
import 'package:aplikasi_website_qun/Admin/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;

import '../services/global_method.dart';
import '../widgets/text_widget.dart';

class addTheMindBehind extends StatefulWidget {
  const addTheMindBehind({Key? key}) : super(key: key);

  @override
  State<addTheMindBehind> createState() => _addTheMindBehindState();
}

class _addTheMindBehindState extends State<addTheMindBehind> {
  final _formKey = GlobalKey<FormState>();

  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  final picker = ImagePicker();
  List<UserForm> users = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();

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
            .collection("mindBehinds")
            .doc(_uuid)
            .set({
          'id': _uuid,
          'nama': nameController.text,
          'role': roleController.text,
          'imageUrl': imageUri.toString(),
          'createdAt': Timestamp.now(),
        });
        _clearForm();
        Fluttertoast.showToast(
          msg: "MindBehinds uploaded succefully",
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
    nameController.clear();
    roleController.clear();
    setState(() {
      _pickedImage = null;
      webImage = Uint8List(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: .0,
        leading: Icon(
          Icons.people_alt_rounded,
        ),
        title: Text('The Mind Behinds'),
        actions: <Widget>[
          FlatButton(
            child: Text('Submit'),
            textColor: Colors.white,
            onPressed: () {
              _uploadForm();
            },
          ),
        ],
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text('Role Details'),
                backgroundColor: Colors.black,
                centerTitle: true,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  controller: nameController,
                  validator: (val) =>
                      val!.length > 3 ? null : 'NickName Masih Kosong',
                  decoration: InputDecoration(
                    labelText: 'Nick Name',
                    hintText: 'Masukan NickName!',
                    icon: Icon(Icons.people),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: TextFormField(
                  controller: roleController,
                  validator: (val) =>
                      val!.contains('') ? null : 'Nama Role Masih Kosong!',
                  decoration: InputDecoration(
                    labelText: 'Nama Role',
                    hintText: 'Masukan Nama Role!',
                    icon: Icon(Icons.people),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
                        width: 200,
                        height: 200,
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
            ],
          ),
        ),
      ),
    );
  }

  ///on add form
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
                      text: 'select Photo',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }

  ///on save forms
  /* void onSave() {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.user).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('List of Users'),
              ),
              body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    child: Text(data[i].nickName.substring(0, 1)),
                  ),
                  title: Text(data[i].nickName),
                  subtitle: Text(data[i].Role),
                ),
              ),
            ),
          ),
        );
      }
    }
  }*/
}
