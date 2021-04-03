import '../../utils/api_object.dart';

class ExchangeRates extends ApiObject {
  final String currency;
  final Map<String, num> rates;

  List<ExchangeRate> get exchangeRates => rates.entries
      .map((e) => ExchangeRate(currency: e.key, rate: e.value.toDouble()))
      .toList();

  ExchangeRates({
    required this.currency,
    this.rates = const {},
  });

  factory ExchangeRates.fromJson(Map<String, dynamic> json) {
    return ExchangeRates(
      currency: json['base'],
      rates: Map<String, num>.from(json['rates']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'base': currency,
      'rates': rates,
    };
  }
}

class ExchangeRate {
  final String currency;
  final double rate;

  ExchangeRate({
    required this.currency,
    required this.rate,
  });
}
