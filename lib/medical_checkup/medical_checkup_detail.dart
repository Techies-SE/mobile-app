import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class MedicalCheckupDetail extends StatefulWidget {
  const MedicalCheckupDetail({super.key, required this.title});

  final String title;

  @override
  State<MedicalCheckupDetail> createState() => _MedicalCheckupDetailState();
}

class _MedicalCheckupDetailState extends State<MedicalCheckupDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: appbarTestStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today, 9:30 AM',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Card(
                    color: Color(0xffD1BA30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('High'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Flexible(
                child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xffE6F6F4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Systolic',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff595959)),
                            ),
                            Text(
                              '140',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'mmhg',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
