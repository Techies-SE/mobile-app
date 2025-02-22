import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.color,
    required this.categoryName,
  });
  final String image;
  final Color color;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
            child: Image.asset(
              'assets/images/$image',
              width: 28,
              height: 34,
            ),
          ),
        ),
        Text(
          categoryName,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xff4B5563),
          ),
        ),
      ],
    );
  }
}
