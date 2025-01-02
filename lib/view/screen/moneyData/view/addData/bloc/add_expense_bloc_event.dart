part of 'add_expense_bloc_bloc.dart';

@immutable
sealed class AddExpenseBlocEvent {}

class AddExpense extends AddExpenseBlocEvent {
  final RupeeMateModel expenseModel;

  AddExpense({required this.expenseModel});
}