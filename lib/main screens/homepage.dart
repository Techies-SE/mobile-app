import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/components/appointment_card.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/main_screen.dart';
import 'package:patient_app/medical_checkup/medical_checkup.dart';
import 'package:patient_app/notification/notification.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            text: ' MFU ',
            style: GoogleFonts.inter(
              color: mainBgColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Wellness Center',
                style: GoogleFonts.inter(
                  color: goldenColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeNotification(),
                    ),
                  );
                },
                icon: Icon(
                  CupertinoIcons.bell,
                  color: mainBgColor,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: bgColor,
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Appointment',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'Viewall',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: mainBgColor,
                        decoration: TextDecoration.underline,
                        decorationColor: mainBgColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: PageView(
                  controller: _pageController,
                  children: [
                    AppointmentCard(),
                    AppointmentCard(),
                    AppointmentCard(),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotHeight: 11.31,
                  dotWidth: 11.31,
                  dotColor: Color(0x80C7BABA),
                  activeDotColor: Color(0xFF50BEAF).withAlpha(130),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Quick Actions',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MedicalCheckup(),
                          ),
                        );
                      },
                      child: ServiceCard(
                        image: 'assets/images/checkUp.png',
                        service: 'Medical Checkup',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(
                                myIndex: 2,
                              ),
                            ),
                            (route) => false);
                      },
                      child: ServiceCard(
                        image: 'assets/images/calendar.png',
                        service: 'Appoitment',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: ServiceCard(
                        image: 'assets/images/search.png',
                        service: 'Find Doctor',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                color: Color(0xffF9E3E3),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/emergency.png',
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emergency',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Get immediate medical support',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffE65454),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {},
                        child: Text(
                          'Call Now',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommendation',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                      'View',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: mainBgColor,
                        decoration: TextDecoration.underline,
                        decorationColor: mainBgColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              Card(
                elevation: 3,
                color: Color(0xffE6F6F4),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/robot.png',
                            width: 17,
                            height: 17,
                            color: mainBgColor,
                          ),
                          Text(
                            'Jan 28,2025',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.justify,
                        'Lorem ipsum dolor sit amet consectetur. Aliquet'
                        ' rutrum in ullamcorper sed vitae. Eget gravida sem elementum '
                        'lacus a lobortis vitae. Viverra malesuada vestibulum sed vel'
                        ' etiam non posuere in odio. Faucibus malesuada aliquam in eget'
                        ' dolor laoreet vestibulum. Eu fermentum duis nisi ac vel '
                        'nisl etiam tempor sociis. Vulputate nec tincidunt elit '
                        'vitae. Id commodo proin pellentesque ac proin.',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
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

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.image,
    required this.service,
  });

  final String image;
  final String service;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Image.asset(
              image,
              width: 60,
              height: 60,
            ),
            SizedBox(
              height: 19,
            ),
            Text(
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              service,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
