import 'package:flutter/cupertino.dart';
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
          // automaticallyImplyLeading: provider.pageChange,
          leading: provider.pageChange
              ? IconButton(
                  onPressed: () {
                    provider.controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    provider.setPageChange(false);
                  },
                  icon: Icon(CupertinoIcons.back),
                )
              : SizedBox(),
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
