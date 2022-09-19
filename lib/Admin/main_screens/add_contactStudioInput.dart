import 'package:aplikasi_website_qun/Admin/main_screens/read_contactStudio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

import '../services/global_method.dart';

class addContactStudioInput extends StatefulWidget {
  const addContactStudioInput(
      {Key? key, required this.id, required this.instLin})
      : super(key: key);

  final String id, instLin;

  @override
  State<addContactStudioInput> createState() => _addContactStudioInputState();
}

class _addContactStudioInputState extends State<addContactStudioInput> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController linkController = TextEditingController();

  late final TextEditingController _linkController;

  @override
  void initState() {
    // set the price and title initial values and initialize the controllers
    _linkController = TextEditingController(text: widget.instLin);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controllers
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
        setState(() {
          _isLoading = true;
        });

        await FirebaseFirestore.instance
            .collection('contactStudio')
            .doc(widget.id)
            .update({
          'linkInstagram': _linkController.text,
        });
        await Fluttertoast.showToast(
          msg: "Link Instagram has been updated",
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
                    'Instagram',
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: _linkController,
                    minLines: 1,
                    maxLines: 1,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => contactStudioRead()));
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
}
