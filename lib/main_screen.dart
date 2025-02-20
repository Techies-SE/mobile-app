import 'package:flutter/material.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/main%20screens/appointment.dart';
import 'package:patient_app/main%20screens/homepage.dart';
import 'package:patient_app/main%20screens/profile.dart';
import 'package:patient_app/main%20screens/recommendation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [
      Homepage(),
      Recommendation(),
      Appointment(),
      Profile(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            backgroundColor: mainBgColor,
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Recommendation',
            icon: Icon(
              Icons.filter_frames_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Appointment',
            icon: Icon(
              Icons.edit_calendar_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Re',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
