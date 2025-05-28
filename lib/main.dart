import 'package:flutter/material.dart';
import 'package:patient_app/appointment/appointment_provider.dart';
import 'package:patient_app/auth/login_screen.dart';
import 'package:patient_app/main_screen.dart';
import 'package:patient_app/services/api_service.dart';
import 'package:patient_app/services/general_service.dart';
import 'package:patient_app/services/noti_service.dart';
import 'package:patient_app/services/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //init notification
   NotiService().initNotification();

  runApp(const PatientApp());
}

class PatientApp extends StatefulWidget {
  const PatientApp({super.key});

  @override
  State<PatientApp> createState() => _PatientAppState();
}

class _PatientAppState extends State<PatientApp> {
  String? token;
  Future<void> isUserLogin() async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    setState(() {
      this.token = token!;
    });
  }

  bool validToken = false;
  Future<void> checkToken() async{
    final response = await ApiService.get('/profile');
    if(response.statusCode == 200){
     setState(() {
        validToken = true;
     });
    }else{
      setState(() {
         validToken = false;
      });
    }

  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserLogin();
    checkToken();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => GeneralService())
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: token != null && validToken ? MainScreen() : LoginScreen(),
      ),
    );
  }
}
