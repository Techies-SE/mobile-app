import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  bool _getNoti = true;
  bool get getNoti => _getNoti;
  void setGetNoti(bool value) {
    _getNoti = value;
    notifyListeners();
  }

  int _language = 0;
  int get language => _language;
  void setLanguage(int value) {
    _language = value;
    notifyListeners();
  }

  bool _changePassword = false;
  bool get changePassword => _changePassword;
  void setChangePassword(bool value) {
    _changePassword = value;
    notifyListeners();
  }
}
