import 'package:aplikasi_website_qun/Admin/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_website_qun/Admin/models/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({Key? key, required this.user, required this.onDelete})
      : super(key: key);
  @override
  _UserFormState createState() => state;

  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();

  File? _pickedImage;
  Uint8List webImage = Uint8List(8);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text('Role Details'),
                backgroundColor: Colors.black,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.user.nickName,
                  onSaved: (val) => widget.user.nickName = val!,
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
                  initialValue: widget.user.Role,
                  onSaved: (val) => widget.user.Role = val!,
                  validator: (val) =>
                      val!.contains('@') ? null : 'Nama Role Masih Kosong!',
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
                        child: Expanded(
                          flex: 4,
                          child: Padding(
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
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: kIsWeb
                                            ? Image.memory(webImage,
                                                fit: BoxFit.fill)
                                            : Image.file(_pickedImage!,
                                                fit: BoxFit.fill),
                                      )),
                          ),
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

  ///form validator
  bool validate() {
    var valid = form.currentState?.validate();
    if (valid!) form.currentState?.save();
    return valid;
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
                      text: 'select Photo',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }
}
