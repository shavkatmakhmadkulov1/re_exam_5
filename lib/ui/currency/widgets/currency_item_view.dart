import 'package:flutter/material.dart';
import 'package:re_exam_5/data/models/currency/currency_model.dart';

class CurrencyItemView extends StatelessWidget {
  const CurrencyItemView({
    Key? key,
    required this.currencyModel,
  }) : super(key: key);



  final CurrencyModel currencyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,

      decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(width: 2, color: Colors.black),
          ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(
              currencyModel.code,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          const  SizedBox(
              width: 16,
            ),
            Text(
              currencyModel.title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.lightGreenAccent),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(currencyModel.nbuBuyPrice,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontSize: 26, color: Colors.amberAccent)),
                  Text(currencyModel.date,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
