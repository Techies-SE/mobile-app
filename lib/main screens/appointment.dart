import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/components/category_card.dart';
import 'package:patient_app/constants.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Appointment',
          style: appbarTestStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Viewall',
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        decorationColor: mainBgColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: mainBgColor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                      image: 'tooth.png',
                      color: Color(0xffDC9497),
                      categoryName: 'Dentistry'),
                  CategoryCard(
                      image: 'heart.png',
                      color: Color(0xff93C19E),
                      categoryName: 'Cardiology'),
                  CategoryCard(
                      image: 'lung.png',
                      color: Color(0xffF5AD7E),
                      categoryName: 'Pulmonology'),
                  CategoryCard(
                      image: 'stethoscope.png',
                      color: Color(0xffACA1CD),
                      categoryName: 'General'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryCard(
                      image: 'brain.png',
                      color: Color(0xff4D9B91),
                      categoryName: 'Neurology'),
                  CategoryCard(
                      image: 'stomach.png',
                      color: Color(0xff4B5563),
                      categoryName: 'Gastroent...'),
                  CategoryCard(
                      image: 'lab.png',
                      color: Color(0xffDEB6B5),
                      categoryName: 'Laboratory'),
                  CategoryCard(
                      image: 'syringe.png',
                      color: Color(0xff89CCDB),
                      categoryName: 'Vaccination'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
