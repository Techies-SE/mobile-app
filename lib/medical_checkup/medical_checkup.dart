import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/medical_checkup/medical_card.dart';

class MedicalCheckup extends StatelessWidget {
  const MedicalCheckup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Medical Checkup',
          style: appbarTestStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          right: 28,
          left: 28,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 4,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Last Updated: Jan 15, 2025',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: textColorSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MedicalCard(
                title: 'Blood Pressure',
                measure: '120/80 mmHg',
                status: 'Normal',
                statusCardColor: Color(0xff63B08B),
              ),
              SizedBox(
                height: 30,
              ),
              MedicalCard(
                title: 'Glucose Levels',
                measure: '126 mg/dL',
                status: 'At Risk',
                statusCardColor: Color(0xffD1BA30),
              ),
              MedicalCard(
                title: 'Lipid Profile',
                measure: '240mg/dL',
                status: 'Critical',
                statusCardColor: Color(0xffCD3737),
              ),
              SizedBox(
                height: 30,
              ),
              MedicalCard(
                title: 'Kidney & Liver Function',
                measure: 'All parameters normal',
                status: 'Normal',
                statusCardColor: Color(0xff63B08B),
              ),
              SizedBox(
                height: 30,
              ),
              MedicalCard(
                title: 'CBC',
                measure: 'Within range',
                status: 'Normal',
                statusCardColor: Color(0xff63B08B),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
