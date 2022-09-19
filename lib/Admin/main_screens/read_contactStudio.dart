import 'package:aplikasi_website_qun/Admin/main_screens/add_contactStudioInput.dart';
import 'package:aplikasi_website_qun/QunStudio/widgets/btm_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class contactStudioRead extends StatefulWidget {
  const contactStudioRead({Key? key}) : super(key: key);

  @override
  State<contactStudioRead> createState() => _contactStudioReadState();
}

class _contactStudioReadState extends State<contactStudioRead> {
  CollectionReference ref =
      FirebaseFirestore.instance.collection('contactStudio');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
              stream: ref.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                            height: 16.0,
                          ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var homeInfo = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        String docId = snapshot.data!.docs[index].id;
                        String runText = homeInfo['linkInstagram'];

                        return Column(
                          children: [
                            // Header
                            Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 50,
                                ),
                                Container(
                                  child: Text(
                                    'Contact Studio',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Physis-Black',
                                        fontSize: 42,
                                        decoration: TextDecoration.underline,
                                        letterSpacing:
                                            0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) =>
                                                  addContactStudioInput(
                                                    id: docId,
                                                    instLin: runText,
                                                  )));
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'Edit',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontFamily: 'Rubik',
                                                fontSize: 16,
                                                letterSpacing:
                                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                              ],
                            ),
                            // Content
                            BtmBar(),
                          ],
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
