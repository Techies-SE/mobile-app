import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class Boarding1 extends StatelessWidget {
  //final Function() onPressed;
  const Boarding1({
    super.key,
    //required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'assets/images/boarding1.png',
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
                'Check Medical History',
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
                  'Stay informed about your health with a detailed record '
                  'of your medical history. Easily review your medical history'
                  ' whenever you need it.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 165,
            ),
          ],
        )
      ],
    );
  }
}
