part of 'add_travel_bloc.dart';

@immutable
sealed class AddTravelBlocEvent {}

class AddTravel extends AddTravelBlocEvent {
  final TravelModel travelModel;

  AddTravel({required this.travelModel});
}