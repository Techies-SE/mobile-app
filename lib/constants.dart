import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

const Color mainBgColor = Color(0xff3BA092);

const Color goldenColor = Color(0xffC0B257);

const Color bgColor = Color(0xffFFFBFB);

const Color textColorSecondary = Color(0xff595959);

const Color textColor = Color(0xff404040);

const Color textFieldColor = Color(0xffD9F2EF);

const Color searchAndMore = Color(0xffF4EEEE);

const Color cardColor = Color(0xffE6F6F4);

const Color cancelButtonColor = Color(0xffE5E7EB);

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

var appbarTestStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w500,
  fontSize: 24,
  color: Color(0xff404040),
);
