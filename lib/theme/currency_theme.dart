import 'package:flutter/material.dart';

class CurrencyTheme {
  final ThemeData materialTheme;
  final Color primaryTextColor;
  final Color surfaceColor;
  final Color cardBackgroundColor;
  
  CurrencyTheme({
    required this.cardBackgroundColor,
    required this.primaryTextColor,
    required this.materialTheme,
    required this.surfaceColor,
  });
}

final darkTheme = CurrencyTheme(
  surfaceColor: Color(0xFF222222),
  primaryTextColor: Colors.white,
  cardBackgroundColor: Color(0xFF333333),
  materialTheme: ThemeData(
    primarySwatch: Colors.grey,
  ),
);

final lightTheme = CurrencyTheme(
  surfaceColor: Colors.white,
  cardBackgroundColor: Color(0xFFEEEEEE),
  primaryTextColor: Colors.black,
  materialTheme: ThemeData(
    primarySwatch: Colors.grey,
  ),
);
