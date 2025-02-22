import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Recommendation',
          style: appbarTestStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Spacer(),
            Card(
              color: cardColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/robot.png',
                          width: 22,
                          height: 22,
                        ),
                        Text(
                          'Jan 28,2025',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: mainBgColor,
                            thickness: 3,
                            indent: 10,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Diagnosis',
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              'Type 2 Diabetes with mild hypertension',
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
                      height: 20,
                    ),
                    Text(
                      'Treatment Plan',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Metformin 500 mg twice daily',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: textColorSecondary,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Daily blood pressure monitoring',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: textColorSecondary,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Low-sodium diet recommended',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: textColorSecondary,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lifestyle Recommendations',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '30 minutes daily moderate exercise',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: textColorSecondary,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Regular blood sugar monitoring',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: textColorSecondary,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Aliquet rutrum'
                      ' in ullamcorper sed vitae. Eget gravida sem elementum lacus'
                      ' a lobortis vitae. Viverra malesuada vestibulum sed vel'
                      ' etiam non posuere in odio. Faucibus malesuada aliquam in'
                      ' eget dolor laoreet vestibulum. Eu fermentum duis nisi ac'
                      ' vel nisl etiam tempor sociis. Vulputate nec tincidunt '
                      'elit vitae. Id commodo proin pellentesque ac proin.',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textColorSecondary,
                      ),
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                'Download',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.file_download_outlined,
                color: Colors.white,
                size: 22,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: mainBgColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
