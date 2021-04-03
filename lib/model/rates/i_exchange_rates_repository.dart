import '../../utils/wrapper.dart';

import 'exchange_rate.dart';

abstract class IExchangeRatesRepository {
  Future<Wrapper<ExchangeRates>> loadExchangeRates();
}
