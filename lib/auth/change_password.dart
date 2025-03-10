import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/auth/verification_done.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/profile/setting.dart';
import 'package:patient_app/services/profile_provider.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: profileProvider.changePassword == true ? true : false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                Icons.lock_outline_rounded,
                size: 42,
                color: Color(0xff343330),
              ),
              Text(
                'Change Your Password',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Your password has expired.'
                ' Please create a new password to  continue.',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Current Password'),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffD9F2EF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8),
                    suffixIcon: Icon(
                      CupertinoIcons.eye_slash,
                      size: 22,
                    ),
                    suffixIconColor: textColorSecondary,
                    hintText: 'Enter current password',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('New Password'),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffD9F2EF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8),
                    suffixIcon: Icon(
                      CupertinoIcons.eye_slash,
                      size: 22,
                      color: textColorSecondary,
                    ),
                    hintText: 'Enter new password',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Confirm New Password'),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.only(
                  left: 10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffD9F2EF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 8),
                    suffixIcon: Icon(
                      CupertinoIcons.eye_slash,
                      size: 22,
                    ),
                    suffixIconColor: textColorSecondary,
                    hintText: 'Confirm new password',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: searchAndMore,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 23.0, horizontal: 25),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password Requirements',
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.checkmark,
                              size: 12,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Minimum 8 characters',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.checkmark,
                              size: 12,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'At least one uppercase letter',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.checkmark,
                              size: 12,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'At least one number',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.checkmark,
                              size: 12,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'At least one special character',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  profileProvider.changePassword == true
                      ? Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Setting(),
                          ),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationDone(),
                          ),
                        );

                  profileProvider.setChangePassword(true);
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(339, 64),
                  backgroundColor: mainBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Change Password',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Need help? Contact Support',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
