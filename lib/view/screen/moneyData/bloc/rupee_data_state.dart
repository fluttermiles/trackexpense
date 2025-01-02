part of 'rupee_data_bloc.dart';

@immutable
sealed class RupeeDataBlocState {
  const RupeeDataBlocState();
}

final class RupeeDataBlocInitial extends RupeeDataBlocState{
  const RupeeDataBlocInitial();
}

final class RupeeDataBlocLoading extends RupeeDataBlocState{
  const RupeeDataBlocLoading();
}

final class RupeeDataBlocLoaded extends RupeeDataBlocState{
  const RupeeDataBlocLoaded({required this.data});

  final List<RupeeMateModel> data;
}

final class RupeeDataBlocError extends RupeeDataBlocState{
  const RupeeDataBlocError({this.ex});

  final String? ex;
}

extension RupeeDataBlocExtension on RupeeDataBlocState {
  bool get isSuccess {
    switch(this) {
      case RupeeDataBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<RupeeMateModel> get newExpenseData {
    switch(this){
      case RupeeDataBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case RupeeDataBlocLoading():
        return true;
      default:
        return false;
    }
  }
}