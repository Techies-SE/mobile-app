import 'package:flutter/material.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/main%20screens/appointment.dart';
import 'package:patient_app/main%20screens/homepage.dart';
import 'package:patient_app/main%20screens/profile.dart';
import 'package:patient_app/main%20screens/recommendation.dart';


// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  int? myIndex = 0;
   MainScreen({super.key, this.myIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int myIndex = 0;
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
        height: 100,
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
              widget.myIndex = index;
            });
          },
          currentIndex: widget.myIndex ?? 0,
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
                Icons.calendar_today_outlined,
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
      body: pages[widget.myIndex ?? 0],
    );
  }
}
