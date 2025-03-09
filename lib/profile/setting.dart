import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool getNoti = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Setting',
          style: appbarTestStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xffE5E7EB),
                    child: Icon(
                      CupertinoIcons.bell,
                      color: mainBgColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notifications',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Color(0xff404040),
                          ),
                        ),
                        Text(
                          'You won’t get any push notification on all of your devices when disabled.',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Color(0xff595959),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Switch(
                    activeColor: Color(0xffE5E7EB),
                    activeTrackColor: mainBgColor,
                    value: getNoti,
                    onChanged: (value) {
                      setState(() {
                        getNoti = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
