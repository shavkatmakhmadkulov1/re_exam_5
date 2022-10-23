import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:re_exam_5/data/models/currency/currency_model.dart';
import 'package:re_exam_5/data/repository/currencies_repository.dart';
import 'package:formz/formz.dart';

part 'currencies_state.dart';

class CurrenciesCubit extends Cubit<CurrenciesState> {
  CurrenciesCubit({required CurrenciesRepository currenciesRepository})
      : _currenciesRepository = currenciesRepository,
        super(const CurrenciesState(currencies: []));

  final CurrenciesRepository _currenciesRepository;

  void getCurrencies() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final currencies = await _currenciesRepository.getCurrencies();
      emit(state.copyWith(
        categories: currencies,
        status: FormzStatus.submissionSuccess,
      ));
    } on DioError catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorText: error.toString(),
        ),
      );
    }
  }
}
