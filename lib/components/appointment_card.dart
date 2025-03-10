import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Color(0xFF50BEAF).withAlpha(130),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/doctorPic.png',
                    width: 32,
                    height: 32,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr, John Martin',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: textColor,
                      ),
                    ),
                    Text(
                      'Cardiologist',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textColorSecondary,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color(0xffE6F6F4),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 20,
                                color: textColorSecondary,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Oct 23th, 2025',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: textColorSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.time,
                                size: 20,
                                color: textColorSecondary,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '11:30-12:30(1hr)',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: textColorSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20,
                          color: textColorSecondary,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'MFU medical center, Chiang Rai',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: textColorSecondary,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
