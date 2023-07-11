import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const seedColor = Color(0xff9e2e20);

class AppTheme {
  static ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(iconColor: seedColor),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.sora(),
        ),
      );
}
