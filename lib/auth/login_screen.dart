import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/auth/otp_screen.dart';
import 'package:patient_app/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});


 @override
 State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {


 final TextEditingController _phoneNumController = TextEditingController();
 final TextEditingController _passwordController = TextEditingController();


 Future <void> login()async{
   final String apiLink = "http://localhost:3000/login";


   final response = await http.post(
     Uri.parse(apiLink),
     headers: {"Content-Type" : "application/json"},
     body: jsonEncode({
       "phone_no" : _phoneNumController.text,
       "password" : _passwordController.text,
     }),
   );
   if(response.statusCode == 200){
     final data = jsonDecode(response.body);
     final bool isFirstTimeLogIn = data['firstTimeLogin'];
     final String token = data['token'];
     final int id = data['id'];
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setInt('id', id);
     await prefs.setString('token', token);


     print(token);
     print(id);
    
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OtpScreen(firstTimeLogin: isFirstTimeLogIn,)));
   }else{
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text("Invalid phone number or password"))
     );
   }
 }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/images/login_bg.png'),
           fit: BoxFit.cover,
         ),
       ),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Spacer(
               flex: 3,
             ),
             Image.asset(
               'assets/images/logo.png',
               width: 110,
               height: 110,
             ),
             SizedBox(
               height: 20,
             ),
             RichText(
               text: TextSpan(
                 text: 'MFU',
                 style: GoogleFonts.inter(
                   fontSize: 32,
                   fontWeight: FontWeight.bold,
                   color: mainBgColor,
                 ),
                 children: [
                   TextSpan(
                     text: ' Wellness Center',
                     style: GoogleFonts.inter(
                       fontSize: 32,
                       fontWeight: FontWeight.bold,
                       color: Color(0xffC0B257),
                     ),
                   ),
                 ],
               ),
             ),
             Spacer(
               flex: 2,
             ),
             //Phone Number TextField
             Container(
               padding: EdgeInsets.symmetric(horizontal: 13),
               width: 339,
               height: 50,
               decoration: BoxDecoration(
                 color: Color(0xffD9F2EF),
                 borderRadius: BorderRadius.circular(10),
               ),
               child: TextField(
                 controller: _phoneNumController,
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Phone Number',
                   hintStyle: GoogleFonts.poppins(
                     fontSize: 13,
                   ),
                 ),
               ),
             ),
             Spacer(),
             Column(
               children: [
                 //Password TextField
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 13),
                   width: 339,
                   height: 50,
                   decoration: BoxDecoration(
                     color: Color(0xffD9F2EF),
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: TextField(
                     obscureText: true,
                     controller: _passwordController,
                     decoration: InputDecoration(
                       border: InputBorder.none,
                       hintText: 'Password',
                       hintStyle: GoogleFonts.poppins(
                         fontSize: 13,
                       ),
                     ),
                   ),
                 ),
                 Align(
                   alignment: Alignment(0.76, 0),
                   child: GestureDetector(
                     child: Text(
                       'Forget password?',
                       style: GoogleFonts.poppins(
                         fontSize: 11,
                       ),
                     ),
                   ),
                 )
               ],
             ),
             Spacer(),
             //LogIn Button
             TextButton(
               onPressed: login,
               style: TextButton.styleFrom(
                 minimumSize: Size(339, 64),
                 backgroundColor: mainBgColor,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
               child: Text(
                 'Login',
                 style: GoogleFonts.poppins(
                   fontSize: 16,
                   color: Colors.white,
                 ),
               ),
             ),
             Spacer(
               flex: 3,
             ),
           ],
         ),
       ),
     ),
   );
 }
}
