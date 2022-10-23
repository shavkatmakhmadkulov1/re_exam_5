import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_exam_5/cubits/currency/currencies_cubit.dart';
import 'package:re_exam_5/data/repository/currencies_repository.dart';
import 'package:re_exam_5/data/api_services/currency_api_service/api_client.dart';
import 'package:re_exam_5/data/api_services/currency_api_service/api_service.dart';
import 'package:re_exam_5/ui/router.dart';
import 'package:re_exam_5/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService apiService =
  ApiService(apiClient: ApiClient());
  // I will not use Multi repository. However I don't need to it.
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrenciesCubit(
            currenciesRepository: CurrenciesRepository(
              apiService: apiService,
            ),
          )..getCurrencies(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: currencies,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}