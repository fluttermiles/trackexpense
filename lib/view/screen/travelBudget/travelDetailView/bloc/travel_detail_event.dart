part of 'travel_detail_bloc.dart';

@immutable
sealed class TravelMateDataBlocEvent {}

class TravelMateData extends TravelMateDataBlocEvent {
  final String travelId;
  TravelMateData({required this.travelId});
}