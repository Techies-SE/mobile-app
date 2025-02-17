import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient_app/auth/otp_screen.dart';
import 'package:patient_app/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13),
                width: 339,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffD9F2EF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    width: 339,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffD9F2EF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
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
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(),
                    ),
                  );
                },
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
