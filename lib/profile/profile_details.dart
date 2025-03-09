import 'package:flutter/material.dart';
import '../constants.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text('Profile',style: appbarTestStyle,),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: mainBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
             child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20,),
               child: Text(
                'Update Profile',
                style: TextStyle(
                color: Colors.white,
               ),),
             ),),
          ],
        ),
      ),
    );
  }
}