part of 'rupee_monthly_bloc.dart';

@immutable
sealed class RupeeMonthlyBlocEvent {}

class RupeeMonthly extends RupeeMonthlyBlocEvent {
  final int month;
  final int year;
  final String userId;

  RupeeMonthly({required this.month, required this.year, required this.userId});
}