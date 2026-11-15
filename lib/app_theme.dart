import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.yellow.shade200,
    ),

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
      labelLarge: GoogleFonts.poppins(
        fontSize: 28,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 22,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 30,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Colors.grey.shade900,
    iconTheme: IconThemeData(
      color: Colors.yellow,
    ),

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
      titleMedium: GoogleFonts.poppins(
        fontSize: 22,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 30,
      ),
      bodyMedium: GoogleFonts.getFont('Poppins'),
      displaySmall: GoogleFonts.getFont('Poppins'),
      labelLarge: GoogleFonts.poppins(
        fontSize: 28,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}


