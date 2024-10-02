import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/helpers/localization_helpers.dart';
import 'package:flutter/material.dart';

var appLightTheme = ThemeData(
    fontFamily: isEnglish() ? "LEMONMILK" : "PNU-Bold",
    colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      color: kPrimaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontFamily: isEnglish() ? "LEMONMILK" : "PNU-Bold",
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white)
);

