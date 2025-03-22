import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/appointment/all_categories.dart';
import 'package:patient_app/booking_tabs/upcoming.dart';
import 'package:patient_app/components/category_card.dart';
import 'package:patient_app/constants.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            'Appointment',
            style: appbarTestStyle,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Categories',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllCategories(),
                      ),
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
                height: 30,
              ),
              //use when api integration
              // GridView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), 
              // itemBuilder: (context,index){
      
              // },)
      
              Flexible(
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 0.8,
                  crossAxisCount:4,
                  children: [
                    CategoryCard(
                      department: 'Dentistry',
                        image: 'tooth.png',
                        color: Color(0xffDC9497),
                        categoryName: 'Dentistry'),
                    CategoryCard(
                      department: 'Cardiology',
                        image: 'heart.png',
                        color: Color(0xff93C19E),
                        categoryName: 'Cardiology'),
                    CategoryCard(
                      department: 'Pulmonology',
                        image: 'lung.png',
                        color: Color(0xffF5AD7E),
                        categoryName: 'Pulmonology'),
                        CategoryCard(
                      department: 'General',
                        image: 'stethoscope.png',
                        color: Color(0xffACA1CD),
                        categoryName: 'General'),
                    CategoryCard(
                      department: 'Neurology',
                        image: 'brain.png',
                        color: Color(0xff4D9B91),
                        categoryName: 'Neurology'),
                    CategoryCard(
                      department: 'Gastroenterology',
                        image: 'stomach.png',
                        color: Color(0xff4B5563),
                        categoryName: 'Gastroenterology'),
                        CategoryCard(
                    department: 'Laboratory',
                      image: 'lab.png',
                      color: Color(0xffDEB6B5),
                      categoryName: 'Laboratory'),
                  CategoryCard(
                    department: 'Vaccination',
                      image: 'syringe.png',
                      color: Color(0xff89CCDB),
                      categoryName: 'Vaccination'),
                  ],
                 ),
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
      ),
    );
  }
}
