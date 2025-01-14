part of 'add_travel_mate_bloc.dart';

@immutable
sealed class AddTravelMateBlocState {
  const AddTravelMateBlocState();
}

final class AddTravelMateBlocInitial extends AddTravelMateBlocState{
  const AddTravelMateBlocInitial();
}

final class AddTravelMateBlocLoading extends AddTravelMateBlocState{
  const AddTravelMateBlocLoading();
}

final class AddTravelMateBlocLoaded extends AddTravelMateBlocState{
  const AddTravelMateBlocLoaded({required this.data});

  final TravelMateModel data;
}

final class AddTravelMateBlocError extends AddTravelMateBlocState{
  const AddTravelMateBlocError({this.ex});

  final String? ex;
}

extension AddTravelMateBlocExtension on AddTravelMateBlocState {
  bool get isSuccess {
    switch(this) {
      case AddTravelMateBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  TravelMateModel get newTraveMateData {
    switch(this){
      case AddTravelMateBlocLoaded(data: final data):
        return data;
      default:
        return TravelMateModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case AddTravelMateBlocLoading():
        return true;
      default:
        return false;
    }
  }
}