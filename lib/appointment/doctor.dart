import 'package:flutter/material.dart';
import 'package:patient_app/constants.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key, required this.department});
  final String department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          department,
          style: appbarTestStyle,
        ),
      ),
    );
  }
}
