part of 'expense_credit_bloc.dart';

@immutable
sealed class ExpenseCreditBlocEvent {}

class ExpenseCreditData extends ExpenseCreditBlocEvent {
  final int month;
  final int year;
  final List<RupeeMateModel> rupeeMateList;

  ExpenseCreditData({required this.month, required this.year, required this.rupeeMateList});
}