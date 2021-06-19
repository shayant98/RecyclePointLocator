import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/styles.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: kEmeraldGreen,
    accentColor: kEmeraldGreen,
    splashColor: kEmeraldGreen,
    scaffoldBackgroundColor: kDarkJungleGreen,
    toggleableActiveColor: kEmeraldGreen,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kEmeraldGreen, foregroundColor: kPlatinum),
    colorScheme: ColorScheme.dark(),
    shadowColor: kDarkJungleGreen.withOpacity(0.5),
  );
  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    primaryColor: kEmeraldGreen,
    accentColor: kEmeraldGreen,
    splashColor: kEmeraldGreen,
    toggleableActiveColor: kEmeraldGreen,
    colorScheme: ColorScheme.light(),
    scaffoldBackgroundColor: kPlatinum,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: kEmeraldGreen, foregroundColor: kPlatinum),
    shadowColor: kShadow.withOpacity(0.5),
  );
}
