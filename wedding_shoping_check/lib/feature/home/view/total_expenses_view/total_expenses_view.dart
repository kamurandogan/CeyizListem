import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen/colors.gen.dart';
import 'package:wedding_shopping_check/feature/home/view/total_expenses_view/cubit/total_expenses_cubit.dart';
import 'package:wedding_shopping_check/feature/home/view/total_expenses_view/cubit/total_expenses_state.dart';

class TotalExpensesView extends StatefulWidget {
  const TotalExpensesView({super.key});

  @override
  State<TotalExpensesView> createState() => _TotalExpensesViewState();
}

class _TotalExpensesViewState extends State<TotalExpensesView> {
  @override
  void initState() {
    super.initState();
    context.read<TotalExpensesCubit>().getTotalExpenses(); // Bu satırı initState'de çağırın.
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TotalExpensesCubit, TotalExpensesState>(
      builder: (context, state) {
        if (state is TotalExpensesError) {
          return Center(
            child: Text('Error: ${state.message}', style: const TextStyle(color: Colors.red)),
          );
        }

        final totalExpenses = state is TotalExpensesLoaded ? state.totalExpenses ?? 0.0 : 0.0;

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _totalExpensesText(context),
            _totalExpensesValue(totalExpenses, context),
          ],
        );
      },
    );
  }

  Widget _totalExpensesValue(double totalExpenses, BuildContext context) {
    return Text(
      '$totalExpenses TL',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorName.secondary),
    );
  }

  Text _totalExpensesText(BuildContext context) {
    return Text(
      'Toplam Harcama:  ',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
