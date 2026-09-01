import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme(BuildContext context){
  return ThemeData(
    primaryColor: Color(0xfff45a08),
    primarySwatch: MaterialColor(
      0xfff45a08, 
      <int, Color>{
         50: Color(0xfff45a08),
         100: Color(0xfff45a08),
         200: Color(0xfff45a08),
         300: Color(0xfff45a08),
         400: Color(0xfff45a08),
         500: Color(0xfff45a08),
         600: Color(0xfff45a08),
         700: Color(0xfff45a08),
         800: Color(0xfff45a08),
         900: Color(0xfff45a08),
      }
      ),
      textTheme: GoogleFonts.sourceSans3TextTheme(
        Theme.of(context).textTheme,
      ),
  );
}