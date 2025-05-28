import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:patient_app/appointment/reservation_screen.dart';
import 'package:patient_app/components/booking_card.dart';
import 'package:patient_app/components/new_appointment_card.dart';
import 'package:http/http.dart' as http;
import 'package:patient_app/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:patient_app/constants.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key, required this.upcomingList});

  final List<dynamic> upcomingList;

  @override
  Widget build(BuildContext context) {
    return upcomingList.isEmpty
        ? Center(
            child: Text('No Upcoming Appointments'),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              final dynamic data = upcomingList[index];
              final int id = data['id'];
              String date = data['appointment_date'];
              String fullTime = data['appointment_time'];
              String shortTime = fullTime.substring(0, 5);
              final int doctorId = data['doctor_id'];

              void cancelApp() async {
                try {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final token = prefs.getString('token');

                  final response = await http.put(
                    Uri.parse('http://localhost:3000/patients/appointments/$id/cancel'),
                    headers: {
                      'Content-Type': 'application/json',
                      if (token != null) 'Authorization': 'Bearer $token',
                    },
                    body: jsonEncode({
                      'appointmentId' : id
                    }),
                  );
                  if(response.statusCode >= 200 && response.statusCode < 300){
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainScreen()), (route)=>false);
                  }else{
                    print(response.body);
                  }
                } catch (e) {
                  print('Error F $e');
                }
              }

              void confirmApp() async {
                try {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final token = prefs.getString('token');

                  final response = await http.put(
                    Uri.parse('http://localhost:3000/patients/appointments/$id/confirm'),
                    headers: {
                      'Content-Type': 'application/json',
                      if (token != null) 'Authorization': 'Bearer $token',
                    },
                    body: jsonEncode({
                      
                      'appointmentId' : id
                    }),
                  );
                  if(response.statusCode >= 200 && response.statusCode < 300){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainScreen()), (route)=>false);
                  }else{
                    print(response.body);
                  }
                } catch (e) {
                  print('Error F $e');
                }
              }



              return NewAppointmetCard(
                id: data['id'],
                drName: data['doctor'],
                category: data['specialization'],
                status: data['status'],
                date: date,
                time: shortTime,
                cancel: (){
                  cancelApp();
                },
                reschedule: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ReservationScreen(doctorId: doctorId, reschedule: true, appointmentId: id,)));
                },
                confirm: () {
                  confirmApp();
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: upcomingList.length,
          );
  }
}
