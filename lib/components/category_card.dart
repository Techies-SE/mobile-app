import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/appointment/appointment_provider.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.image,
    required this.color,
    required this.categoryName,
    required this.department,
  });
  final String image;
  final Color color;
  final String categoryName;
  final String department;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppointmentProvider>(context);
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              provider.setDepartment(department);
              provider.controller.jumpToPage(2);
              provider.setSecondPageChange(true);
            },
            child: Card(
              elevation: 5,
              color: color,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Image.asset(
                  'assets/images/$image',
                  width: 50,
                  height: 50,
                ),
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
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
