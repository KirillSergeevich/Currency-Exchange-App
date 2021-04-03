import '../../model/rates/exchange_rate.dart';

class MainState {

  final List<ExchangeRate> rates;
  final bool isLoading;
  final bool isError;

  MainState({
    required this.rates,
    required this.isError,
    required this.isLoading,
  });

  MainState newState({
    bool? isError,
    bool? isLoading,
    List<ExchangeRate>? rates,
  }) {
    return MainState(
      rates: rates ?? this.rates,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

}
