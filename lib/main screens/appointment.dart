import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/appointment/all_categories.dart';
import 'package:patient_app/booking_tabs/cancelled.dart';
import 'package:patient_app/booking_tabs/completed.dart';
import 'package:patient_app/booking_tabs/upcoming.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/services/api_service.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  List<dynamic> departmentList = [];
  Future<void> fetchDepartmentList()async{
    try{
      final response = await ApiService.get('/departments');
      if(response.statusCode >= 200 && response.statusCode < 300){
        final data = jsonDecode(response.body);
        setState(() {
          departmentList = data;
          print('from appointment: $departmentList');
        });
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print('error: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    fetchDepartmentList();
    fetchAppointment();
  }
  // List of available images
  final List<String> availableImages = [
    'tooth.png',
    'heart.png',
    'lung.png',
    'stethoscope.png',
    'brain.png',
    'stomach.png',
    'lab.png',
    'syringe.png'
  ];

  //fetch appointments
  List<dynamic> upcomingList = [];
  List<dynamic> completedList = [];
  List<dynamic> cancelledList = [];
  Future<void> fetchAppointment() async{
    try{
      final response = await ApiService.get('/patients/appointments');
      if(response.statusCode >= 200 && response.statusCode < 300){
        final data = jsonDecode(response.body);
        final appointments = data['appointments'];
        setState(() {
          upcomingList = appointments.where((appointment)=> appointment['status'] != 'canceled' && appointment['status']!= 'completed').toList();
          // print(upcomingList);
          completedList = appointments.where((appointment) => appointment['status'] == 'completed').toList();
          cancelledList = appointments.where((appointment) => appointment['status'] == 'canceled').toList();
          print(cancelledList);
        });
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print('Error $e');
    }
  }

  

  // Function to randomly assign images to departments
  String getRandomImage() {
    final random = Random();
    final index = random.nextInt(availableImages.length);  // Random index
    return availableImages[index];  // Return random image path
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //   Text(
              //     'Categories',
              //     style: GoogleFonts.inter(
              //       fontSize: 13,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              //   GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => AllCategories(departmentList: departmentList,),
              //         ),
              //       );
              //     },
              //     child: Text(
              //       'Viewall',
              //       style: GoogleFonts.inter(
              //         decoration: TextDecoration.underline,
              //         decorationColor: mainBgColor,
              //         fontWeight: FontWeight.w400,
              //         fontSize: 14,
              //         color: mainBgColor,
              //       ),
              //     ),
              //   )
              // ],
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // Flexible(
              //   child: GridView.builder(
              //     itemCount: departmentList.length,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     childAspectRatio: 0.9,
              //   ),
              //     padding: EdgeInsets.zero,
              //     shrinkWrap: true,
              //     physics: BouncingScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       final department = departmentList[index];
              //       //print(department);
              //       String image = getRandomImage();
              //       return CategoryCard(image: image, color: _getColorForDepartment(department['name']), categoryName: department['name'], department: department['name'], departmentId: department['id'],);
              //     },
              //    ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllCategories(
                            departmentList: departmentList,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.plus,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Book New Appointment',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: mainBgColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                ),
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
                  Upcoming(upcomingList: upcomingList,),
                  Completed(completedList: completedList,),
                  Cancelled(cancelledList: cancelledList,),
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
  Color _getColorForDepartment(String departmentName) {
    switch (departmentName) {
      case 'Dentistry':
        return Color(0xffDC9497);
      case 'Cardiology':
        return Color(0xff93C19E);
      case 'Pulmonology':
        return Color(0xffF5AD7E);
      case 'General':
        return Color(0xffACA1CD);
      case 'Neurology':
        return Color(0xff4D9B91);
      case 'Gastroenterology':
        return Color(0xff4B5563);
      case 'Laboratory':
        return Color(0xffDEB6B5);
      case 'Vaccination':
        return Color(0xff89CCDB);
      default:
        return Colors.grey;  // Default color if department name is not recognized
    }
  }
}
