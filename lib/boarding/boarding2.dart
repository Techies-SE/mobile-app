import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class Boarding2 extends StatelessWidget {
  //final Function() onPressed;
  const Boarding2({
    super.key,
    //required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'assets/images/boarding2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 400,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                'Schedule Appointment',
                style: GoogleFonts.inter(
                  color: mainBgColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  'Book your doctor’s appointment in just a few taps. Choose your'
                  ' preferred date,time, and consultation type',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 180,
            ),
          ],
        )
      ],
    );
  }
}
