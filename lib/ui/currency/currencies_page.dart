import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_exam_5/cubits/currency/currencies_cubit.dart';
import 'package:formz/formz.dart';
import 'package:re_exam_5/ui/currency/widgets/currency_item_view.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies",style: TextStyle(color: Colors.white,fontSize: 32),),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<CurrenciesCubit, CurrenciesState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.status == FormzStatus.submissionFailure) {
            return const Text("Error");
          } else if (state.status == FormzStatus.submissionSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return CurrencyItemView(
                  currencyModel: state.currencies[index],

                );
              },
              itemCount: state.currencies.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}