part of 'rupee_monthly_data_bloc.dart';

@immutable
sealed class RupeeMonthlyDataBlocEvent {}

class RupeeMonthlyData extends RupeeMonthlyDataBlocEvent {
  final int month;
  final int year;
  final String userId;

  RupeeMonthlyData({required this.month, required this.year, required this.userId});
}