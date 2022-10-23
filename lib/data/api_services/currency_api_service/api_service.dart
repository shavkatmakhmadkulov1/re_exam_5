import 'package:dio/dio.dart';
import 'package:re_exam_5/data/models/currency/currency_model.dart';
import 'package:re_exam_5/data/api_services/currency_api_service/api_client.dart';

class ApiService {
  ApiService({required ApiClient apiClient})
      : _openApiClient = apiClient;

  final ApiClient _openApiClient;

  Future<List<CurrencyModel>> getCategories() async {
    try {
      Response response =
      await _openApiClient.dio.get(_openApiClient.dio.options.baseUrl);
      if (response.statusCode! <= 200 || response.statusCode! <= 299) {
        return (response.data as List?)
            ?.map((category) => CurrencyModel.fromJson(category))
            .toList() ??
            [];
      } else {
        throw Exception();
      }
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

}