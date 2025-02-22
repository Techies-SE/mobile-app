import 'package:flutter/material.dart';
import 'package:patient_app/appointment/all_categories.dart';
import 'package:patient_app/appointment/appointment_provider.dart';
import 'package:patient_app/appointment/main_appointment.dart';
import 'package:patient_app/constants.dart';
import 'package:provider/provider.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppointmentProvider>(context);
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(
            'Appointment',
            style: appbarTestStyle,
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: provider.controller,
          children: [
            MainAppointment(),
            AllCategories(),
          ],
        ));
  }
}
