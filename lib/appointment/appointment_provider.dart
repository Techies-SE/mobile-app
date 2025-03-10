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
}
