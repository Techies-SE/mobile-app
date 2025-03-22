import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.image,
    required this.name,
    required this.isSelected,
  });

  final String image;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
        color: Colors.grey,
        width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: isSelected ? 8 : 0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              image,
              width: 78.16,
              height: 78.16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
