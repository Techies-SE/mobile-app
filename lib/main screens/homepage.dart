import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/components/appointment_card.dart';
import 'package:patient_app/constants.dart';
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
                    child: ServiceCard(
                      image: 'assets/images/emergency.png',
                      service: 'Emergency',
                    ),
                  ),
                ],
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
                    horizontal: 15,
                  ),
                  child: Text(
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
      elevation: 8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              service,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
