part of 'add_travel_bloc.dart';

@immutable
sealed class AddTravelBlocState {
  const AddTravelBlocState();
}

final class AddTravelBlocInitial extends AddTravelBlocState{
  const AddTravelBlocInitial();
}

final class AddTravelBlocLoading extends AddTravelBlocState{
  const AddTravelBlocLoading();
}

final class AddTravelBlocLoaded extends AddTravelBlocState{
  const AddTravelBlocLoaded({required this.data});

  final TravelModel data;
}

final class AddTravelBlocError extends AddTravelBlocState{
  const AddTravelBlocError({this.ex});

  final String? ex;
}

extension AddTravelBlocExtension on AddTravelBlocState {
  bool get isSuccess {
    switch(this) {
      case AddTravelBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  TravelModel get newExpenseData {
    switch(this){
      case AddTravelBlocLoaded(data: final data):
        return data;
      default:
        return TravelModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case AddTravelBlocLoading():
        return true;
      default:
        return false;
    }
  }
}