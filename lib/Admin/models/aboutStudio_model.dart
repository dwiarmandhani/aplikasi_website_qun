import 'package:cloud_firestore/cloud_firestore.dart';

class AboutStudModel {
  late String id;
  late String imageHover1;
  late String imageHover2;
  late String imageHover3;
  late Map imageMap;
  late String paragraf1;
  late String paragraf2;
  late String paragraf3;
  late Map subsidiary;
  late String title1;
  late String title2;
  late String title3;
  late Timestamp createdAt;

  AboutStudModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    imageHover1 = data['imageHover1'];
    imageHover2 = data['imageHover2'];
    imageHover3 = data['imageHover3'];
    imageMap = data['imageMap'];
    paragraf1 = data['paragraf1'];
    paragraf2 = data['paragraf2'];
    paragraf3 = data['paragraf3'];
    subsidiary = data['subsidiary'];
    title1 = data['title1'];
    title2 = data['title2'];
    title3 = data['title3'];
    createdAt = data['createdAt'];
  }
}
