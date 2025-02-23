import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class MedicalCard extends StatelessWidget {
  const MedicalCard(
      {super.key,
      required this.title,
      required this.measure,
      required this.status,
      required this.statusCardColor});

  final String title;
  final String measure;
  final String status;
  final Color statusCardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Card(
                  color: statusCardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Text(
                      status,
                      style:
                          GoogleFonts.inter(fontSize: 11, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Text(
              measure,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: textColorSecondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
