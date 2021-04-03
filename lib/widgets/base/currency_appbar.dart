import 'package:flutter/cupertino.dart';
import '../../theme/theme_extensions.dart';

class CurrencyAppBar extends StatelessWidget {
  final String text;

  CurrencyAppBar(this.text);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 25, top: 40, bottom: 10, right: 25),
        child: Text(text, style: TextStyle(fontSize: 28.0, color: context.theme.primaryTextColor)),
      ),
    );
  }
}
