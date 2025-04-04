import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/auth/change_password.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/main_screen.dart';

class OtpScreen extends StatelessWidget {
  final bool? firstTimeLogin;
  const OtpScreen({super.key, required this.firstTimeLogin});
  void nextScreen(BuildContext context){
    if(firstTimeLogin!){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePassword()));
    }else{
       Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Text(
              'Enter verification code',
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Code had been to your phone.',
              style: GoogleFonts.poppins(
                fontSize: 13,
              ),
            ),
            Spacer(),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              margin: EdgeInsets.symmetric(horizontal: 0),
              fieldHeight: 60,
              fieldWidth: 46,
              numberOfFields: 6,
              enabledBorderColor: mainBgColor,
              focusedBorderColor: mainBgColor,
              fillColor: mainBgColor,
              cursorColor: Colors.black,
              showFieldAsBox: true,
            ),
            Spacer(),
            Text(
              'Don\'t get OTP code?',
              style: GoogleFonts.poppins(
                fontSize: 15,
              ),
            ),
            GestureDetector(
              child: Text(
                'Resend code.',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: mainBgColor,
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
            TextButton(
              onPressed: () {
               nextScreen(context);
              },
              style: TextButton.styleFrom(
                minimumSize: Size(339, 64),
                backgroundColor: mainBgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Verify',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
