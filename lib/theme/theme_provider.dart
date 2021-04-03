import 'package:flutter/widgets.dart';

import 'currency_theme.dart';

class ThemeProvider extends InheritedWidget {
  final CurrencyTheme theme;

  const ThemeProvider({
    Key? key,
    required Widget child,
    required this.theme,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) => theme != oldWidget.theme;

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>() ??
        (throw UnsupportedError(''));
  }
}
