import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.yellow.shade100,
      onSecondary: Colors.black,
      surface: Colors.yellow.shade100,
      onSurface: Colors.black,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 50,
        fontStyle: FontStyle.italic,
      ),

      titleLarge: GoogleFonts.poppins(
        fontSize: 30,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Colors.grey.shade900,

    colorScheme: ColorScheme.dark(
      primary: Colors.yellow,
      onPrimary: Colors.black,
      secondary: Colors.yellow.shade100,
      onSecondary: Colors.black,
      surface: Colors.grey.shade800,
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 50,
        fontStyle: FontStyle.italic,
      ),

      titleLarge: GoogleFonts.poppins(
        fontSize: 30,
      ),
      bodyMedium: GoogleFonts.getFont('Poppins'),
      displaySmall: GoogleFonts.getFont('Poppins'),
    ),
  );
}


