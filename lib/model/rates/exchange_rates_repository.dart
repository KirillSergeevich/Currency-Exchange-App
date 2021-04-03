import '../../system/remote/remote_service.dart';
import '../../utils/wrapper.dart';
import 'exchange_rate.dart';
import 'i_exchange_rates_repository.dart';

class ExchangeRatesRepository implements IExchangeRatesRepository {
  final RemoteService _remote;

  ExchangeRatesRepository(this._remote);

  @override
  Future<Wrapper<ExchangeRates>> loadExchangeRates() {
    return _remote.fetchExchangeRates();
  }
}
