import 'package:flutter/material.dart';
import 'package:re_exam_5/ui/currency/currencies_page.dart';
import 'package:re_exam_5/utils/constants.dart';

class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case currencies:
        return MaterialPageRoute(
          builder: (context) => const CurrencyPage(),
        );
    }
    return null;
  }
}