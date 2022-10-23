import 'package:re_exam_5/data/models/currency/currency_model.dart';
import 'package:re_exam_5/data/api_services/currency_api_service/api_service.dart';

class CurrenciesRepository {
  CurrenciesRepository({required ApiService apiService})
      : _apiService = apiService;
  final ApiService _apiService;

  Future<List<CurrencyModel>> getCurrencies() async =>
      _apiService.getCategories();
}