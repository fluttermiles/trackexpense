part of 'money_monthly_bloc.dart';

@immutable
sealed class MoneyMonthlyBlocEvent {}

class MoneyMonthly extends MoneyMonthlyBlocEvent {
  final List<RupeeMateModel> rupeeMateList;

  MoneyMonthly({required this.rupeeMateList});
}