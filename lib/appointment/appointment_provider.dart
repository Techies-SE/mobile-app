import 'package:flutter/material.dart';

class AppointmentProvider with ChangeNotifier {
  final _pageController = PageController();

  PageController get controller {
    return _pageController;
  }

  bool _pageChange = false;
  bool get pageChange => _pageChange;
  void setPageChange(bool value) {
    _pageChange = value;
    notifyListeners();
  }

  bool _secondPageChange = false;
  bool get secondPageChange => _secondPageChange;
  void setSecondPageChange(bool value) {
    _secondPageChange = value;
    notifyListeners();
  }

  String _department = '';
  String get department => _department;
  void setDepartment(String value) {
    _department = value;
    notifyListeners();
  }
}
