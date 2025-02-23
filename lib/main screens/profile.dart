import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Profile',
          style: appbarTestStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            ListTiles(
              icon: Icons.person_outlined,
              title: 'Profile',
            ),
            SizedBox(
              height: 40,
            ),
            ListTiles(icon: CupertinoIcons.book, title: 'Privacy Policy'),
            SizedBox(
              height: 40,
            ),
            ListTiles(icon: CupertinoIcons.question_circle, title: 'Help'),
            SizedBox(
              height: 40,
            ),
            ListTiles(icon: Icons.settings, title: 'Setting'),
            SizedBox(
              height: 40,
            ),
            ListTiles(icon: Icons.logout, title: 'Log out')
          ],
        ),
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: cancelButtonColor,
        child: Icon(
          icon,
          size: 22,
          color: mainBgColor,
        ),
      ),
      title: Text(title),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.right_chevron,
          size: 28,
          color: mainBgColor,
        ),
      ),
    );
  }
}
