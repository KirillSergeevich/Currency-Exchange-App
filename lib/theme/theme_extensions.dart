import 'package:flutter/widgets.dart';

import 'currency_theme.dart';
import 'theme_provider.dart';

extension ThemeExtensions on BuildContext {
  CurrencyTheme get theme {
    return ThemeProvider.of(this).theme;
  }
}
