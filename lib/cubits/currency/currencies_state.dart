part of 'currencies_cubit.dart';

class CurrenciesState extends Equatable {
  const CurrenciesState({
    required this.currencies,
    this.errorText = '',
    this.status = FormzStatus.pure,
  });
  final List<CurrencyModel> currencies;
  final String errorText;
  final FormzStatus status;

  CurrenciesState copyWith({
    List<CurrencyModel>? categories,
    String? errorText,
    FormzStatus? status,
  }) =>
      CurrenciesState(
        currencies: categories ?? currencies,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [currencies, status, errorText];
}
