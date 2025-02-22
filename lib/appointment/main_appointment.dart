import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../booking_tabs/upcoming.dart';
import '../components/category_card.dart';
import '../constants.dart';
import 'appointment_provider.dart';

class MainAppointment extends StatelessWidget {
  const MainAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppointmentProvider>(context);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  onTap: () {
                    provider.controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
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
              height: 20,
            ),
            Text(
              'My Bookings',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TabBar(
              //indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.fill,
              indicatorColor: mainBgColor,
              labelColor: Colors.black,
              labelStyle: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: textColorSecondary,
              tabs: [
                Tab(
                  child: Text(
                    'Upcoming',
                    textAlign: TextAlign.start,
                  ),
                ),
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Cancelled',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Upcoming(),
                  Upcoming(),
                  Upcoming(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
