import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class HomeNotification extends StatelessWidget {
  const HomeNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: appbarTestStyle,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xffE9E7E2),
                                child: Icon(
                                  CupertinoIcons.speaker,
                                  color: textColorSecondary,
                                  size: 22,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Mark all as read!',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xffEDEDED),
                child: Icon(
                  CupertinoIcons.ellipsis,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: CircleAvatar(
                  backgroundColor: Color(0xff93C19E),
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: textColorSecondary,
                  ),
                ),
                title: Text(
                  'Your appointment with Dr.John will be tomorrow at 10:30 am',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
                trailing: Text(
                  '2h',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: textColorSecondary,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Today',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffF3B5B7),
                      child: Icon(
                        CupertinoIcons.speaker_2,
                        color: Color(0xffEE6665),
                      ),
                    ),
                    title: Text(
                      'Your glucose level is high. You need to see '
                      'the doctor as soon as possible',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                    trailing: Text(
                      '4h',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textColorSecondary,
                      ),
                    ),
                  );
                },
                separatorBuilder: (index, context) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
