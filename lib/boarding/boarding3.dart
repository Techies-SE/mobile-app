import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class Boarding3 extends StatelessWidget {
  //final Function() onPressed;
  const Boarding3({
    super.key,
    //required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'assets/images/boarding3.png',
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
                'Get Recommendation',
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
                  'Get Ai recommendations along with personalized notes from your '
                  'doctor based on your symptoms and medical history.',
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
