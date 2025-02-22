import 'package:flutter/material.dart';

class AppointmentProvider with ChangeNotifier {
  final _pageController = PageController();

  PageController get controller {
    return _pageController;
  }
}
