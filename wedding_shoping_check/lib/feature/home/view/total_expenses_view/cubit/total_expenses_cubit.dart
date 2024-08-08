import 'package:bloc/bloc.dart';
import 'package:wedding_shopping_check/feature/home/view/total_expenses_view/cubit/total_expenses_state.dart';
import 'package:wedding_shopping_check/feature/stats/service/calculate_total_price_service.dart';
import 'package:wedding_shopping_check/product/constans/strings.dart';

class TotalExpensesCubit extends Cubit<TotalExpensesState> {
  TotalExpensesCubit() : super(const TotalExpensesInitial());

  Future<void> getTotalExpenses() async {
    try {
      final totalExpenses = await CalculateTotalPriceService.instance.calculateAllPrice(user: user);
      emit(TotalExpensesLoaded(totalExpenses));
    } catch (e) {
      emit(TotalExpensesError(message: e.toString())); // Hata mesajı eklemek
    }
  }
}
