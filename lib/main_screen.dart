import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Homepage(),
      Recommendation(),
      Appointment(),
      Profile(),
    ];

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: mainBgColor,
          unselectedItemColor: Color(0xff929CAD),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(
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
              label: 'Profile',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
      body: pages[myIndex],
    );
  }
}
