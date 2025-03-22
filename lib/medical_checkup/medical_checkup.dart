import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/medical_checkup/medical_checkup_detail.dart';

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
              SizedBox(
                width: 260,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    enabled: true,
                    filled: true,
                    fillColor: Color(0xffE9E7E2),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '2025',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: textColorSecondary,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blood Pressure',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'March 15,2025',
                      style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.chevron_right_outlined),
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MedicalCheckupDetail(title: 'Blood Pressure'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
