import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

Text textWidget(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
        textStyle: TextStyle(color: Colors.white, fontSize: 25)),
  );
}

Text textWidget2(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
        textStyle: TextStyle(color: Colors.black, fontSize: 25)),
  );
}
