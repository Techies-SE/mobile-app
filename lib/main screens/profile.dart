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
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: cancelButtonColor,
                child: Icon(
                  Icons.person,
                  size: 22,
                  color: mainBgColor,
                ),
              ),
              title: Text('Profile'),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.arrow_right,
                  size: 28,
                  color: mainBgColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
