import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:aplikasi_website_qun/Admin/main_screens/portfolio_read.dart';
import 'package:aplikasi_website_qun/Admin/main_screens/read_portfolioFilms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class EditPortfolioFilm extends StatefulWidget {
  const EditPortfolioFilm({
    Key? key,
    required this.id,
    required this.category,
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.synopsis,
    required this.trailerLink,
    required this.directedBy,
    required this.starring1,
    required this.starring2,
    required this.starring3,
    required this.starring4,
    required this.starring5,
    required this.starring6,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.imageUrl5,
    required this.imageUrl6,
    required this.imageUrl7,
    required this.imageUrl8,
    required this.imageUrl9,
    required this.imageUrl10,
    required this.starring7,
    required this.starring8,
    required this.starring9,
    required this.starring10,
  }) : super(key: key);

  final String id,
      title,
      category,
      imageUrl,
      imageUrl2,
      imageUrl3,
      imageUrl4,
      imageUrl5,
      imageUrl6,
      imageUrl7,
      imageUrl8,
      imageUrl9,
      imageUrl10,
      year,
      synopsis,
      trailerLink,
      directedBy,
      starring1,
      starring2,
      starring3,
      starring4,
      starring5,
      starring6,
      starring7,
      starring8,
      starring9,
      starring10;

  @override
  State<EditPortfolioFilm> createState() => _EditPortfolioFilmState();
}

class _EditPortfolioFilmState extends State<EditPortfolioFilm> {
  List<XFile> _imageList = [];
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController,
      _synopsisController,
      _categoryController,
      _yearController,
      _trailerLinkController,
      _directedByController,
      _starring1Controller,
      _starring2Controller,
      _starring3Controller,
      _starring4Controller,
      _starring5Controller,
      _starring6Controller,
      _starring7Controller,
      _starring8Controller,
      _starring9Controller,
      _starring10Controller;

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
  late String _imageUrl;
  late String _imageUrl2;
  late String _imageUrl3;
  late String _imageUrl4;
  late String _imageUrl5;
  late String _imageUrl6;
  late String _imageUrl7;
  late String _imageUrl8;
  late String _imageUrl9;
  late String _imageUrl10;

  bool _isLoading = false;
  bool isDeleting = false;
  @override
  void initState() {
    // set the price and title initial values and initialize the controllers
    _synopsisController = TextEditingController(text: widget.synopsis);
    _titleController = TextEditingController(text: widget.title);
    _categoryController = TextEditingController(text: widget.category);
    _yearController = TextEditingController(text: widget.year);
    _trailerLinkController = TextEditingController(text: widget.trailerLink);
    _directedByController = TextEditingController(text: widget.directedBy);
    _starring1Controller = TextEditingController(text: widget.starring1);
    _starring2Controller = TextEditingController(text: widget.starring2);
    _starring3Controller = TextEditingController(text: widget.starring3);
    _starring4Controller = TextEditingController(text: widget.starring4);
    _starring5Controller = TextEditingController(text: widget.starring5);
    _starring6Controller = TextEditingController(text: widget.starring6);
    _starring7Controller = TextEditingController(text: widget.starring7);
    _starring8Controller = TextEditingController(text: widget.starring8);
    _starring9Controller = TextEditingController(text: widget.starring9);
    _starring10Controller = TextEditingController(text: widget.starring10);

    // Set the variables
    _imageUrl = widget.imageUrl;
    _imageUrl2 = widget.imageUrl2;
    _imageUrl3 = widget.imageUrl3;
    _imageUrl4 = widget.imageUrl4;
    _imageUrl5 = widget.imageUrl5;
    _imageUrl6 = widget.imageUrl6;
    _imageUrl7 = widget.imageUrl7;
    _imageUrl8 = widget.imageUrl8;
    _imageUrl9 = widget.imageUrl9;
    _imageUrl10 = widget.imageUrl10;
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
    _synopsisController.dispose();
    _titleController.dispose();
    _categoryController.dispose();
    _yearController.dispose();
    _trailerLinkController.dispose();
    _directedByController.dispose();
    _starring1Controller.dispose();
    _starring2Controller.dispose();
    _starring3Controller.dispose();
    _starring4Controller.dispose();
    _starring5Controller.dispose();
    _starring6Controller.dispose();
    _starring7Controller.dispose();
    _starring8Controller.dispose();
    _starring9Controller.dispose();
    _starring10Controller.dispose();
    super.dispose();
  }

  void _updatePortfolio() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      try {
        Uri? imageUri;
        Uri? imageUri2;
        Uri? imageUri3;
        Uri? imageUri4;
        Uri? imageUri5;
        Uri? imageUri6;
        Uri? imageUri7;
        Uri? imageUri8;
        Uri? imageUri9;
        Uri? imageUri10;
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
        if (_pickedImage8 != null) {
          fb.StorageReference storageRef8 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl8 + 'jpg');
          final fb.UploadTaskSnapshot uploadTaskSnapshot8 =
              await storageRef8.put(kIsWeb ? webImage8 : _pickedImage8).future;
          imageUri8 = await uploadTaskSnapshot8.ref.getDownloadURL();
        }
        if (_pickedImage9 != null) {
          fb.StorageReference storageRef9 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl9 + 'jpg');
          final fb.UploadTaskSnapshot uploadTaskSnapshot9 =
              await storageRef9.put(kIsWeb ? webImage9 : _pickedImage9).future;
          imageUri9 = await uploadTaskSnapshot9.ref.getDownloadURL();
        }
        if (_pickedImage10 != null) {
          fb.StorageReference storageRef10 = fb
              .storage()
              .ref()
              .child('portfolioImages')
              .child(widget.imageUrl10 + 'jpg');
          final fb.UploadTaskSnapshot uploadTaskSnapshot10 = await storageRef10
              .put(kIsWeb ? webImage10 : _pickedImage10)
              .future;
          imageUri10 = await uploadTaskSnapshot10.ref.getDownloadURL();
        }
        await FirebaseFirestore.instance
            .collection('portfoliofilm')
            .doc(widget.id)
            .update({
          'title': _titleController.text,
          'year': _yearController.text,
          'trailer': _trailerLinkController.text,
          'cat': _categoryController.text,
          'directedBy': _directedByController.text,
          'starring1': _starring1Controller.text,
          'starring2': _starring2Controller.text,
          'starring3': _starring3Controller.text,
          'starring4': _starring4Controller.text,
          'starring5': _starring5Controller.text,
          'starring6': _starring6Controller.text,
          'starring7': _starring7Controller.text,
          'starring8': _starring8Controller.text,
          'starring9': _starring9Controller.text,
          'starring10': _starring10Controller.text,
          'synopsis': _synopsisController.text,
          'imageUrl':
              _pickedImage == null ? widget.imageUrl : imageUri.toString(),
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
          'imageUrl8':
              _pickedImage8 == null ? widget.imageUrl8 : imageUri8.toString(),
          'imageUrl9':
              _pickedImage9 == null ? widget.imageUrl9 : imageUri9.toString(),
          'imageUrl10': _pickedImage10 == null
              ? widget.imageUrl10
              : imageUri10.toString(),
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
        FirebaseFirestore.instance.collection('portfoliofilm').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('Portfolio item deleted from the database'))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
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
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => readFilmsPortfolio()));
            },
            child: Text('View Portfolio'),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Form(
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
                    controller: _titleController,
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
                    controller: _categoryController,
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
                    controller: _yearController,
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
                    controller: _directedByController,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _starring1Controller,
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
                  child: TextFormField(
                    controller: _starring2Controller,
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
                  child: TextFormField(
                    controller: _starring3Controller,
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
                  child: TextFormField(
                    controller: _starring4Controller,
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
                  child: TextFormField(
                    controller: _starring5Controller,
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
                  child: TextFormField(
                    controller: _starring6Controller,
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
                  child: TextFormField(
                    controller: _starring7Controller,
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
                  child: TextFormField(
                    controller: _starring8Controller,
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
                  child: TextFormField(
                    controller: _starring9Controller,
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
                  child: TextFormField(
                    controller: _starring10Controller,
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
                    'Trailer Link',
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
                    controller: _trailerLinkController,
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukan Link',
                    ),
                  ),
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
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage();
                            },
                            child: Text("Select Image 1")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage2();
                            },
                            child: Text("Select Image 2")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage3();
                            },
                            child: Text("Select Image 3")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage4();
                            },
                            child: Text("Select Image 4")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage5();
                            },
                            child: Text("Select Image 5")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage6();
                            },
                            child: Text("Select Image 6")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage7();
                            },
                            child: Text("Select Image 7")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage8();
                            },
                            child: Text("Select Image 8")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage9();
                            },
                            child: Text("Select Image 9")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              _pickImage10();
                            },
                            child: Text("Select Image 10")),
                        Container(
                          height: 150,
                          width: 150,
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: _imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Text('Data');
                              }),
                        )
                      ],
                    )),
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
                    controller: _synopsisController,
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
                        _updatePortfolio();
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
    );
  }

  Future<void> _pickImage() async {
    // MOBILE
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);

        setState(() {
          _pickedImage = selected;
        });
      } else {
        log('No file selected');
        // showToast("No file selected");
      }
    }
    // WEB
    else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _pickedImage = File("a");
          webImage = f;
        });
      } else {
        log('No file selected');
      }
    } else {
      log('Perm not granted');
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
}
