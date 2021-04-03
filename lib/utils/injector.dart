import 'package:get_it/get_it.dart';

import '../model/rates/exchange_rates_repository.dart';
import '../model/rates/i_exchange_rates_repository.dart';
import '../pages/main/main_cubit.dart';
import '../system/remote/remote_service.dart';

final getIt = _GetItProvider()._init(GetIt.instance);

class _GetItProvider {
  GetIt _init(GetIt getIt) {

    //Services
    getIt.registerSingleton<RemoteService>(RemoteService());

    //System
    getIt.registerSingleton<IExchangeRatesRepository>(ExchangeRatesRepository(getIt.get<RemoteService>()));

    // Cubits
    getIt.registerFactory(() => MainCubit());
    return getIt;
  }
}