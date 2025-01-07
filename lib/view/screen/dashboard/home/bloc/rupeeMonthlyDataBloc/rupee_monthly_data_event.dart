part of 'rupee_monthly_data_bloc.dart';

@immutable
sealed class RupeeMonthlyDataBlocEvent {}

class RupeeMonthlyData extends RupeeMonthlyDataBlocEvent {
  final bool? isLogOut;
  RupeeMonthlyData({this.isLogOut});
}