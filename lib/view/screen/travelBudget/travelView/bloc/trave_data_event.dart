part of 'trave_data_bloc.dart';
@immutable
sealed class TravelDataBlocEvent {}

class TravelData extends TravelDataBlocEvent {
  final String userId;
  TravelData({required this.userId});
}