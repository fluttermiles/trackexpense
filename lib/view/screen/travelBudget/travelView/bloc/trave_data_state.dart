part of 'trave_data_bloc.dart';

@immutable
sealed class TravelDataBlocState {
  const TravelDataBlocState();
}

final class TravelDataBlocInitial extends TravelDataBlocState{
  const TravelDataBlocInitial();
}

final class TravelDataBlocLoading extends TravelDataBlocState{
  const TravelDataBlocLoading();
}

final class TravelDataBlocLoaded extends TravelDataBlocState{
  const TravelDataBlocLoaded({required this.data});

  final List<TravelModel> data;
}

final class TravelDataBlocError extends TravelDataBlocState{
  const TravelDataBlocError({this.ex});

  final String? ex;
}

extension TravelDataExtension on TravelDataBlocState {
  bool get isSuccess {
    switch(this) {
      case TravelDataBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<TravelModel> get travelList {
    switch(this){
      case TravelDataBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case TravelDataBlocLoading():
        return true;
      default:
        return false;
    }
  }
}
