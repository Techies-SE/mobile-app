import 'dart:convert';
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:patient_app/appointment/doctor_card.dart';
import 'package:patient_app/appointment/reservation_screen.dart';
import 'package:patient_app/constants.dart';
import 'package:patient_app/services/api_service.dart';
import 'package:patient_app/services/noti_service.dart';


class Doctor extends StatefulWidget {
 const Doctor(
     {super.key, required this.department, required this.departmentId});
 final String department;
 final int departmentId;


 @override
 State<Doctor> createState() => _DoctorState();
}


class _DoctorState extends State<Doctor> {
 List<dynamic> doctorList = [];
 int? doctorId;
 int? isSelected;
 //fixed in the backend
 Future<void> fetchDoctorLists() async {
   try {
     final response =
         await ApiService.get('/departments/id=${widget.departmentId}');
     if (response.statusCode >= 200 && response.statusCode < 300) {
       final data = jsonDecode(response.body);
       setState(() {
         doctorList = data['doctors'];
         print('doctor list $doctorList');
       });
     } else {
       print('Failed to fetch data ${response.statusCode}');
     }
   } catch (e) {
     print('error $e');
   }
 }


 final List<String> availableImages = [
   'assets/images/nathan.png',
   'assets/images/dr_lee.png',
   'assets/images/sarah.png',
 ];


 String getRandomImage() {
   final random = Random();
   final index = random.nextInt(availableImages.length); // Random index
   return availableImages[index]; // Return random image path
 }


 @override
 void initState() {
   super.initState();
   fetchDoctorLists();
 }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: bgColor,
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Text(
         widget.department,
         style: appbarTestStyle,
       ),
       actions: [
         Padding(
           padding: const EdgeInsets.only(right: 8.0),
           child: TextButton(
             onPressed: isSelected == null
                 ? null
                 : () {
                     //print('book');
                     // NotiService().showNoti(
                     //     title: "Booking Successful!",
                     //     body: 'You Have Booked an Appointment Successfully!');
                     // NotiService().scheduleNoti(
                     //   title: "Booking Reminder!",
                     //   body: 'You have an Appointment today!',
                     //   hour: 14,
                     //   min: 25,
                     // );
                     print('doctor id ${doctorList[isSelected!]['id']}');
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => ReservationScreen(
                                   doctorId: doctorList[isSelected!]['id'],
                                   reschedule: false,
                                 )));
                   },
             style: TextButton.styleFrom(
                 backgroundColor:
                     isSelected == null ? Colors.grey : mainBgColor,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 )),
             child: Text(
               'Book',
               style: TextStyle(color: Colors.white),
             ),
           ),
         ),
       ],
     ),
     body: Padding(
       padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
       child: Center(
         child: Column(
           children: [
             SizedBox(
               width: 260,
               height: 40,
               child: TextField(
                 decoration: InputDecoration(
                   enabled: true,
                   filled: true,
                   fillColor: Color(0xffE9E7E2),
                   contentPadding: EdgeInsets.zero,
                   prefixIcon: Icon(
                     Icons.search,
                     size: 20,
                   ),
                   hintText: 'Search',
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                     borderSide: BorderSide.none,
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 15,
             ),
             Flexible(
               // child: GridView.builder(
               //     itemCount: doctorList.length,
               //     gridDelegate:
               //         const SliverGridDelegateWithFixedCrossAxisCount(
               //       crossAxisCount: 2,
               //       mainAxisSpacing: 10,
               //       crossAxisSpacing: 10,
               //       childAspectRatio: 1.1,
               //     ),
               //     itemBuilder: (context, index) {
               // final doctor = doctorList[index];
               // final doctorName = doctor['name'] ?? 'Unknown Doctor'; // Replace with actual data
               // final doctorSpecialization = doctor['specialization'] ?? "";
               //       return GestureDetector(
               //         onTap: () {
               //           setState(() {
               //             isSelected = index;
               //           });
               //         },
               //         child: DoctorCard(
               //           image: 'assets/images/doctor.png',
               //           name: doctorName,
               //           specialization: doctorSpecialization,
               //           isSelected: isSelected == index,
               //         ),
               //       );
               //     }),
               child: ListView.separated(
                 itemBuilder: (context, index) {
                   final doctor = doctorList[index];
                   final doctorName = doctor['name'] ??
                       'Unknown Doctor'; // Replace with actual data
                   final doctorSpecialization = doctor['specialization'] ?? "";
                   return GestureDetector(
                     onTap: () {
                       setState(() {
                         isSelected = index;
                       });
                     },
                     child: DoctorCard(
                       image: 'assets/images/doctor.png',
                       name: doctorName,
                       specialization: doctorSpecialization,
                       isSelected: isSelected == index,
                     ),
                   );
                 },
                 separatorBuilder: (context, index) {
                   return SizedBox(
                     height: 10,
                   );
                 },
                 itemCount: doctorList.length,
               ),
             ),
           ],
         ),
       ),
     ),
   );
 }
}
