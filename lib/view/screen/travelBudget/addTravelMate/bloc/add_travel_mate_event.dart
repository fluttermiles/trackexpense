part of 'add_travel_mate_bloc.dart';

@immutable
sealed class AddTravelMateBlocEvent {}

class AddTravelMate extends AddTravelMateBlocEvent {
  final TravelMateModel travelMateModel;

  AddTravelMate({required this.travelMateModel});
}