import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const pageColor1 = Color(0xff013BCA);
const pageColor2 = Color(0xffFDB7D8);

final TextStyle defaultTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  letterSpacing: -1.5,
);

final TextStyle appBarTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  // letterSpacing: -0.5,
  fontSize: 16,
);

String assetPath(fileName) => 'assets/$fileName.gif';
