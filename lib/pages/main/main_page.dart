import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme_extensions.dart';
import '../../utils/injector.dart';
import '../../widgets/base/currency_appbar.dart';
import '../../widgets/currency_item_widget.dart';
import 'main_cubit.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  final _cubit = getIt.get<MainCubit>();

  @override
  void initState() {
    super.initState();
    _cubit.loadRates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.theme.surfaceColor,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: _cubit.loadRates,
          ),
          body: Column(
            children: [
              CurrencyAppBar('1 USD is'),
              Expanded(
                child: Stack(
                  children: [
                    if (state.isLoading)
                      Center(child: CircularProgressIndicator()),
                    if (state.isError)
                      _errorMessage('Something went wrong. Please try again.'),
                    ListView.builder(
                      itemCount: state.rates.length,
                      itemBuilder: (context, position) {
                        return CurrencyItemWidget(state.rates[position]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _errorMessage(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          color: context.theme.primaryTextColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
