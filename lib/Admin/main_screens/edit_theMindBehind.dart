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

class editTheMindBehind extends StatefulWidget {
  const editTheMindBehind({
    Key? key,
    required this.id,
    required this.name,
    required this.role,
    required this.imageUrl,
  }) : super(key: key);

  final String id, name, role, imageUrl;

  @override
  State<editTheMindBehind> createState() => _editTheMindBehindState();
}

class _editTheMindBehindState extends State<editTheMindBehind> {
  final _formKey = GlobalKey<FormState>();

  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  final picker = ImagePicker();
  List<UserForm> users = [];

  late String imageUrl;

  late final TextEditingController nameController, roleController;
  bool _isLoading = false;
  bool isDeleting = false;
  void initState() {
    // set the price and title initial values and initialize the controllers
    nameController = TextEditingController(text: widget.name);
    roleController = TextEditingController(text: widget.role);

    // Set the variables
    imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    nameController.dispose();
    roleController.dispose();
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
            .collection('mindBehinds')
            .doc(widget.id)
            .update({
          'nama': nameController.text,
          'role': roleController.text,
          'imageUrl':
              _pickedImage == null ? widget.imageUrl : imageUri.toString(),
        });
        await Fluttertoast.showToast(
          msg: "Mind Behind has been updated",
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
        FirebaseFirestore.instance.collection('mindBehinds').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('Mind Behind item deleted from the database'))
        .catchError((e) => print(e));
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
          isDeleting
              ? const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.redAccent,
                    ),
                    strokeWidth: 1,
                  ),
                )
              : IconButton(
                  onPressed: () async {
                    setState(() {
                      isDeleting = true;
                    });

                    deleteItem(
                      docId: widget.id,
                    );

                    setState(() {
                      isDeleting = false;
                    });
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.redAccent,
                    size: 32,
                  )),
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
                              _pickImage();
                            });
                          },
                          child: Text("Change The Picture")),
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
                                  ? Image.network(imageUrl)
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
