import 'package:aplikasi_website_qun/Admin/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

// ignore: deprecated_member_use
import 'package:firebase/firebase.dart' as fb;

import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:uuid/uuid.dart';

import '../services/global_method.dart';

class editNews extends StatefulWidget {
  const editNews(
      {Key? key,
      required this.id,
      required this.title,
      required this.categoryName,
      required this.desc,
      required this.imageUrl,
      required this.link})
      : super(key: key);

  final String id, title, categoryName, desc, imageUrl, link;

  @override
  State<editNews> createState() => _editNewsState();
}

class _editNewsState extends State<editNews> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController,
      _descController,
      _linkController;
  File? _pickedImage;
  late String _imageUrl;
  Uint8List webImage = Uint8List(8);
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItemsKategori {
    List<DropdownMenuItem<String>> menuItemsKategori = [
      DropdownMenuItem(child: Text("Media Coverage"), value: "0"),
      DropdownMenuItem(child: Text("Upcoming Release"), value: "1"),
    ];
    return menuItemsKategori;
  }

  List<DropdownMenuItem<String>> get dropdownItemsArtikel {
    List<DropdownMenuItem<String>> menuItemsArtikel = [
      DropdownMenuItem(child: Text("ORPA"), value: "ORPA"),
      DropdownMenuItem(child: Text("Mandala"), value: "Mandala"),
      DropdownMenuItem(child: Text("HP Indonesia"), value: "HP Indonesia"),
      DropdownMenuItem(child: Text("Telkom"), value: "Telkom"),
    ];
    return menuItemsArtikel;
  }

  @override
  void initState() {
    _descController = TextEditingController(text: widget.desc);
    _titleController = TextEditingController(text: widget.title);
    _linkController = TextEditingController(text: widget.link);
    selectedValue = widget.categoryName;
    _imageUrl = widget.imageUrl;

    super.initState();
  }

  @override
  void dispose() {
    _descController.dispose();
    _titleController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  bool _isLoading = false;
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
            .collection('news')
            .doc(widget.id)
            .update({
          'title': _titleController.text.toUpperCase(),
          'desc': _descController.text,
          'categoryName': int.tryParse('${selectedValue}'),
          'link': _linkController.text,
          'imageUrl':
              _pickedImage == null ? widget.imageUrl : imageUri.toString(),
        });
        await Fluttertoast.showToast(
          msg: "News has been updated",
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
        FirebaseFirestore.instance.collection('news').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('News item deleted from the database'))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ElevatedButton(
                child: Text('Delete Item'),
                onPressed: () async {
                  GlobalMethods.warningDialog(
                      title: 'Delete?',
                      subtitle: 'Press okay to confirm',
                      fct: () async {
                        await FirebaseFirestore.instance
                            .collection('news')
                            .doc(widget.id)
                            .delete();
                        await Fluttertoast.showToast(
                          msg: "News has been deleted",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                        );
                        while (Navigator.canPop(context)) {
                          Navigator.pushNamed(context, '/NewsEditor');
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
                  'NEWS & COVERAGE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 60,
                      decoration: TextDecoration.underline,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'UPLOAD IMAGE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 40,
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
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'JUDUL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 40,
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
                  'Link',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'Agentur',
                      fontSize: 40,
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: _linkController,
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
                      fontFamily: 'Agentur',
                      fontSize: 40,
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: _descController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Text(
                              'Kategori',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: 'Agentur',
                                  fontSize: 40,
                                  decoration: TextDecoration.underline,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: DropdownButton(
                              value: selectedValue,
                              items: dropdownItemsKategori,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue!;
                                });
                              },
                              hint: Text('Pilih Kategori'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding:
                    //             EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    //         child: Text(
                    //           'Artikel',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //               color: Color.fromARGB(255, 0, 0, 0),
                    //               fontFamily: 'Agentur',
                    //               fontSize: 40,
                    //               decoration: TextDecoration.underline,
                    //               letterSpacing:
                    //                   0 /*percentages not used in flutter. defaulting to zero*/,
                    //               fontWeight: FontWeight.normal,
                    //               height: 1),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.all(20),
                    //         child: DropdownButton(
                    //           value: selectedValue,
                    //           items: dropdownItemsArtikel,
                    //           onChanged: (String? newValue) {
                    //             setState(() {
                    //               selectedValue = newValue!;
                    //             });
                    //           },
                    //           hint: Text('Pilih Artikel'),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Spacer(),
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
                    Spacer(),
                  ],
                ),
              ),
            ]),
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
                      text: 'select hover',
                      color: Colors.blue,
                    ))
              ],
            ),
          )),
    );
  }
}
