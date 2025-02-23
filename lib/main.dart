import 'package:flutter/material.dart';
import 'package:patient_app/appointment/appointment_provider.dart';
import 'package:provider/provider.dart';

import 'boarding/walkthrough.dart';

void main() {
  runApp(const PatientApp());
}

class PatientApp extends StatelessWidget {
  const PatientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Walkthrough(),
      ),
    );
  }
}
