part of 'rupee_data_bloc.dart';

@immutable
sealed class RupeeDataBlocEvent {}

class RupeeData extends RupeeDataBlocEvent {
  final DateTime selectedDate;
  final String userId;

  RupeeData({required this.selectedDate, required this.userId});
}