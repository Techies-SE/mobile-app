import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:patient_app/auth/verification_done.dart';
import 'package:patient_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChangePassword extends StatefulWidget {
 const ChangePassword({super.key});


 @override
 State<ChangePassword> createState() => _ChangePasswordState();
}


class _ChangePasswordState extends State<ChangePassword> {
 //to track the visibility of password
 bool _isObsecure = true;


 final TextEditingController _newPasswordController = TextEditingController();
 final TextEditingController _newConfirmedPasswordController =
     TextEditingController();


 bool isValidPassword(String password) {
   final regex = RegExp(
     r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
   );
   return regex.hasMatch(password);
 }


 //handle password change
 void _handlePasswordChange() async {
   String newPassword = _newPasswordController.text;
   String newConfirmedPassword = _newConfirmedPasswordController.text;


   if (!isValidPassword(newPassword)) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text(
             'Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.')));
   } else if (newPassword != newConfirmedPassword) {
     ScaffoldMessenger.of(context)
         .showSnackBar(SnackBar(content: Text('Passwords do not match')));
   } else {
     try {
       //if the password match and secure enough
       final apiLink = "http://localhost:3000/login/change-password";
       final newPassword = _newConfirmedPasswordController.text;
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String? token = prefs.getString('token');
       int? id = prefs.getInt('id');
       final response = await http.post(
         Uri.parse(apiLink),
          headers: {
               'Content-Type': 'application/json',
               'Authorization': 'Bearer $token',
             },
         body: jsonEncode({'userId': id, 'newPassword': newPassword}),
       );


       if (response.statusCode == 200) {
         SharedPreferences prefs = await SharedPreferences.getInstance();
         String? token = prefs.getString('token');


         if (token != null) {
           final apiLink = "http://localhost:3000/profile";
           final response = await http.get(
             Uri.parse(apiLink),
             headers: {
               'Content-Type': 'application/json',
               'Authorization': 'Bearer $token',
             },
           );
           if (response.statusCode == 200) {
             final profileData = jsonDecode(response.body);
             final userData = profileData['user'];
             print(userData);
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => VerificationDone(),
               ),
             );
           } else {
             // Handle profile fetch error
             final errorData = jsonDecode(response.body);
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                   content:
                       Text(errorData['error'] ?? 'Failed to fetch profile')),
             );
           }
         }
       } else {
         // Handle password change error
         final errorData = jsonDecode(response.body);
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
               content:
                   Text(errorData['error'] ?? 'Failed to change password')),
         );
       }
     } catch (e) {
       print('Error during password change: $e');
       ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
             content: Text('Failed to connect to server. Please try again.')),
       );
     }
   }
 }


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     appBar: AppBar(
       automaticallyImplyLeading: false,
       backgroundColor: Colors.white,
     ),
     body: Padding(
       padding: EdgeInsets.symmetric(
         horizontal: 30,
       ),
       child: SingleChildScrollView(
         child: Column(
           children: [
             Icon(
               Icons.lock_outline_rounded,
               size: 42,
               color: Color(0xff343330),
             ),
             Text(
               'Change Your Password',
               style: GoogleFonts.inter(
                 fontSize: 24,
                 fontWeight: FontWeight.w500,
               ),
             ),
             Text(
               textAlign: TextAlign.center,
               'Your password has expired.'
               ' Please create a new password to  continue.',
               style: GoogleFonts.poppins(
                 fontSize: 13,
               ),
             ),
             // SizedBox(
             //   height: 31,
             // ),
             // Align(
             //   alignment: Alignment.centerLeft,
             //   child: Text('Current Password'),
             // ),
             // SizedBox(
             //   height: 4,
             // ),
             // Container(
             //   width: double.infinity,
             //   height: 50,
             //   padding: EdgeInsets.only(
             //     left: 10,
             //   ),
             //   decoration: BoxDecoration(
             //     color: Color(0xffD9F2EF),
             //     borderRadius: BorderRadius.circular(10),
             //   ),
             //   child: TextField(
             //     decoration: InputDecoration(
             //       contentPadding: EdgeInsets.only(top: 8),
             //       suffixIcon: Icon(
             //         CupertinoIcons.eye_slash,
             //         size: 22,
             //       ),
             //       suffixIconColor: textColorSecondary,
             //       hintText: 'Enter current password',
             //       hintStyle: GoogleFonts.poppins(
             //         fontSize: 13,
             //       ),
             //       border: InputBorder.none,
             //     ),
             //   ),
             // ),
             SizedBox(
               height: 20,
             ),
             Align(
               alignment: Alignment.centerLeft,
               child: Text('New Password'),
             ),
             SizedBox(
               height: 4,
             ),
             // New Password TextField
             Container(
               width: double.infinity,
               height: 50,
               padding: EdgeInsets.only(
                 left: 10,
               ),
               decoration: BoxDecoration(
                 color: Color(0xffD9F2EF),
                 borderRadius: BorderRadius.circular(10),
               ),
               child: TextField(
                 obscureText: _isObsecure,
                 controller: _newPasswordController,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top: 8),
                   suffixIcon: IconButton(
                     onPressed: () {
                       setState(() {
                         _isObsecure = !_isObsecure; // Toggle visibility
                       });
                     },
                     icon: Icon(
                       _isObsecure ? Icons.visibility_off : Icons.visibility,
                     ),
                   ),
                   hintText: 'Enter new password',
                   hintStyle: GoogleFonts.poppins(
                     fontSize: 13,
                   ),
                   border: InputBorder.none,
                 ),
               ),
             ),
             SizedBox(
               height: 20,
             ),
             Align(
               alignment: Alignment.centerLeft,
               child: Text('Confirm New Password'),
             ),
             SizedBox(
               height: 4,
             ),
             //New Confirmed Password
             Container(
               width: double.infinity,
               height: 50,
               padding: EdgeInsets.only(
                 left: 10,
               ),
               decoration: BoxDecoration(
                 color: Color(0xffD9F2EF),
                 borderRadius: BorderRadius.circular(10),
               ),
               child: TextField(
                 controller: _newConfirmedPasswordController,
                 obscureText: _isObsecure,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top: 8),
                   suffixIcon: IconButton(
                     onPressed: () {
                       setState(() {
                         _isObsecure = !_isObsecure; // Toggle visibility
                       });
                     },
                     icon: Icon(
                       _isObsecure ? Icons.visibility_off : Icons.visibility,
                     ),
                   ),
                   hintText: 'Confirm new password',
                   hintStyle: GoogleFonts.poppins(fontSize: 13),
                   border: InputBorder.none,
                 ),
               ),
             ),
             SizedBox(
               height: 20,
             ),
             Card(
               color: searchAndMore,
               child: Padding(
                 padding: const EdgeInsets.symmetric(
                     vertical: 23.0, horizontal: 25),
                 child: SizedBox(
                   width: double.infinity,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Password Requirements',
                       ),
                       SizedBox(
                         height: 4,
                       ),
                       Row(
                         children: [
                           Icon(
                             CupertinoIcons.checkmark,
                             size: 12,
                           ),
                           SizedBox(
                             width: 7,
                           ),
                           Text(
                             'Minimum 8 characters',
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       Row(
                         children: [
                           Icon(
                             CupertinoIcons.checkmark,
                             size: 12,
                           ),
                           SizedBox(
                             width: 7,
                           ),
                           Text(
                             'At least one uppercase letter',
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       Row(
                         children: [
                           Icon(
                             CupertinoIcons.checkmark,
                             size: 12,
                           ),
                           SizedBox(
                             width: 7,
                           ),
                           Text(
                             'At least one number',
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 5,
                       ),
                       Row(
                         children: [
                           Icon(
                             CupertinoIcons.checkmark,
                             size: 12,
                           ),
                           SizedBox(
                             width: 7,
                           ),
                           Text(
                             'At least one special character',
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 30,
             ),
             TextButton(
               onPressed: _handlePasswordChange,
               style: TextButton.styleFrom(
                 minimumSize: Size(339, 64),
                 backgroundColor: mainBgColor,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                 ),
               ),
               child: Text(
                 'Change Password',
                 style: GoogleFonts.poppins(
                   fontSize: 16,
                   color: Colors.white,
                 ),
               ),
             ),
             SizedBox(
               height: 10,
             ),
             Text(
               'Need help? Contact Support',
               style: GoogleFonts.poppins(
                 fontSize: 12,
               ),
             ),
             SizedBox(
               height: 10,
             )
           ],
         ),
       ),
     ),
   );
 }
}
