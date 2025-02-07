part of 'travel_detail_bloc.dart';

@immutable
sealed class TravelMateDataBlocState {
  const TravelMateDataBlocState();
}

final class TravelMateDataBlocInitial extends TravelMateDataBlocState{
  const TravelMateDataBlocInitial();
}

final class TravelMateDataBlocLoading extends TravelMateDataBlocState{
  const TravelMateDataBlocLoading();
}

final class TravelMateDataBlocLoaded extends TravelMateDataBlocState{
  const TravelMateDataBlocLoaded({required this.data});

  final List<TravelMateModel> data;
}

final class TravelMateDataBlocError extends TravelMateDataBlocState{
  const TravelMateDataBlocError({this.ex});

  final String? ex;
}

extension TravelMateDataExtension on TravelMateDataBlocState {
  bool get isSuccess {
    switch(this) {
      case TravelMateDataBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<TravelMateModel> get travelMateList {
    switch(this){
      case TravelMateDataBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  List<TravelMateModel> get estimatedTravelMateList {
    switch(this){
      case TravelMateDataBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Estimated Expense').toList();
      default:
        return [];
    }
  }

  List<TravelMateModel> get actualTravelMateList {
    switch(this){
      case TravelMateDataBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Actual Expenditure').toList();
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case TravelMateDataBlocLoading():
        return true;
      default:
        return false;
    }
  }
}
