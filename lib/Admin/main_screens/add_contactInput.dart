import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class addContactInput extends StatefulWidget {
  const addContactInput({Key? key}) : super(key: key);

  @override
  State<addContactInput> createState() => _addContactInputState();
}

class _addContactInputState extends State<addContactInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Instagram',
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Link Instagram',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'LinkedIn',
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Link LinkedIn',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Text(
                  'Facebook',
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan Link Facebook',
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                    onTap: () {},
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
    );
  }
}
