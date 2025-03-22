import 'package:flutter/material.dart';
import 'package:patient_app/components/booking_card.dart';
import 'package:patient_app/constants.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> doctors = [
  {
    'image': 'dr_lee.png',
    'name': 'Dr. Daniel Lee',
    'position': 'Gastroenterologist',
  },
  {
    'image': 'nathan.png',
    'name': 'Dr. Nathan Harris',
    'position': 'Cardiologist',
  }
];
    return ListView.separated(
      itemBuilder: (context, index) {
        final dynamic data = doctors[index];
        return BookingCard(
            image: data['image'],
            name: data['name'],
            position: data['position']);
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: 2,
    );
  }
}
