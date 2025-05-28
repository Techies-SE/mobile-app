import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.name,
    required this.specialization,
    required this.date,
    required this.time,
  });

  final String name;
  final String specialization;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 3,
        color: Color(0xFF50BEAF).withAlpha(130),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/doctor.png',
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
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: textColor,
                        ),
                      ),
                      Text(
                        specialization,
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
                                  date,
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
                                  time,
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
      ),
    );
  }
}
