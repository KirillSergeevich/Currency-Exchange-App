import 'package:flutter/material.dart';

import 'pages/main/main_page.dart';
import 'theme/currency_theme.dart';
import 'theme/theme_extensions.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(CurrencyApp());
}

class CurrencyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: darkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Currency App Demo',
            theme: context.theme.materialTheme,
            home: MainPage(),
          );
        },
      ),
    );
  }
}
