import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/main_screen.dart';
import 'package:avatar_glow/avatar_glow.dart';

class VerificationDone extends StatelessWidget {
  const VerificationDone({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        (context),
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarGlow(
              glowCount: 3,
              duration: Duration(milliseconds: 3000),
              glowColor: mainBgColor,
              child: Material(
                elevation: 8,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: mainBgColor,
                  radius: 70,
                  child: Icon(
                    Icons.check_circle_outline_outlined,
                    size: 56,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Your account is completely set up.',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
