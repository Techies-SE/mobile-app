import 'package:flutter/material.dart';
import 'package:patient_app/components/booking_card.dart';
import 'package:patient_app/components/new_appointment_card.dart';
//import 'package:patient_app/constants.dart';

class Cancelled extends StatelessWidget {
  const Cancelled({super.key, required this.cancelledList});

  final List<dynamic> cancelledList;

  @override
  Widget build(BuildContext context) {
    return cancelledList.isEmpty
        ? Center(
            child: Text('No Cancelled Appointments'),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              final dynamic data = cancelledList[index];
              String date = data['appointment_date'];
              String fullTime = data['appointment_time'];
              String shortTime = fullTime.substring(0, 5);
// Result: "10:30"
              // return BookingCard(
              //     time: '${data['appointment_date']} ( $shortTime )',
              //     image: 'doctor.png',
              //     name: data['doctor'],
              //     position: data['specialization']);
              return NewAppointmetCard(
                id: data['id'],
                drName: data['doctor'],
                category: data['specialization'],
                status: data['status'],
                date: date,
                time: shortTime,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: cancelledList.length,
          );
  }
}
