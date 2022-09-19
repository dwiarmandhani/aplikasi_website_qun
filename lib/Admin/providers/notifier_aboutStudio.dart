import 'dart:collection';

import 'package:aplikasi_website_qun/Admin/models/aboutStudio_model.dart';
import 'package:flutter/cupertino.dart';

class AboutStudNotifier with ChangeNotifier {
  List<AboutStudModel> _aboutList = [];
  late AboutStudModel _currentAbout;

  UnmodifiableListView<AboutStudModel> get aboutList =>
      UnmodifiableListView(_aboutList);

  AboutStudModel get currentAbout => _currentAbout;

  set aboutList(List<AboutStudModel> aboutList) {
    _aboutList = aboutList;
    notifyListeners();
  }

  set currentAbout(AboutStudModel aboutStudio) {
    _currentAbout = aboutStudio;
    notifyListeners();
  }
}
