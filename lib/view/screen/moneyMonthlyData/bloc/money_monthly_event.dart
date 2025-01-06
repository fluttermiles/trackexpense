part of 'money_monthly_bloc.dart';

@immutable
sealed class MoneyMonthlyBlocEvent {}

class MoneyMonthly extends MoneyMonthlyBlocEvent {
  final String title;
  final int month;
  final int year;

  MoneyMonthly({required this.title, required this.month, required this.year});
}