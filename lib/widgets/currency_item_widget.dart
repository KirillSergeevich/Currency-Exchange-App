import 'package:flutter/widgets.dart';

import '../model/rates/exchange_rate.dart';
import '../theme/theme_extensions.dart';

class CurrencyItemWidget extends StatelessWidget {
  final ExchangeRate _exchangeRate;

  CurrencyItemWidget(this._exchangeRate);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: context.theme.cardBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _exchangeRate.rate.toString(),
            style: TextStyle(fontSize: 25, color: context.theme.primaryTextColor),
          ),
          Text(
            _exchangeRate.currency,
            style: TextStyle(
              fontSize: 25, color: context.theme.primaryTextColor
            ),
          ),
        ],
      ),
    );
  }
}
