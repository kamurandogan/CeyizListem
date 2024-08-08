import 'package:equatable/equatable.dart';

sealed class TotalExpensesState extends Equatable {
  const TotalExpensesState({this.totalExpenses, this.message});

  final double? totalExpenses;
  final String? message; // Hata mesajı eklemek

  @override
  List<Object?> get props => [totalExpenses, message];
}

final class TotalExpensesInitial extends TotalExpensesState {
  const TotalExpensesInitial() : super(totalExpenses: 0);
}

final class TotalExpensesLoaded extends TotalExpensesState {
  const TotalExpensesLoaded(double totalExpenses) : super(totalExpenses: totalExpenses);
}

final class TotalExpensesError extends TotalExpensesState {
  const TotalExpensesError({required String message}) : super(totalExpenses: 0, message: message);
}
