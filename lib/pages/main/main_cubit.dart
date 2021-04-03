import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/rates/i_exchange_rates_repository.dart';
import '../../utils/injector.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final IExchangeRatesRepository _ratesRepo =
      getIt.get<IExchangeRatesRepository>();

  MainCubit()
      : super(
          MainState(
            rates: [],
            isLoading: false,
            isError: false,
          ),
        );

  void loadRates() {
    emit(state.newState(isLoading: true, rates: [], isError: false));
    _ratesRepo.loadExchangeRates().then((value) {
      if (value.success()) {
        emit(state.newState(
          rates: value.data?.exchangeRates,
          isLoading: false,
          isError: false,
        ));
      } else {
        emit(state.newState(
          isLoading: false,
          isError: true,
        ));
      }
    }).catchError((er) {
      emit(state.newState(
        rates: [],
        isLoading: false,
        isError: true,
      ));
    });
  }
}
