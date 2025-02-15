import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/constants.dart';
import 'boarding1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'boarding2.dart';
import 'boarding3.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final PageController _pageController = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: NeverScrollableScrollPhysics(),
            allowImplicitScrolling: false,
            onPageChanged: (index) {
              if (index == 2) {
                setState(() {
                  lastPage = true;
                });
              }
            },
            controller: _pageController,
            children: [
              Boarding1(),
              Boarding2(),
              Boarding3(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment(0, 0.5),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 11.31,
                    dotWidth: 11.31,
                    dotColor: Color(0xffE9F6FE),
                    activeDotColor: mainBgColor,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              lastPage == false
                  ? TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size(100, 50),
                        backgroundColor: mainBgColor,
                      ),
                      child: Text(
                        'Next',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size(150, 50),
                        backgroundColor: mainBgColor,
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
              SizedBox(
                height: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
