import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  const Doctor({super.key, required this.department});
  final String department;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(department),
          ],
        ),
      ),
    );
  }
}
