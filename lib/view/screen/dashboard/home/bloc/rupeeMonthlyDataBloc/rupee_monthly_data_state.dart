part of 'rupee_monthly_data_bloc.dart';

@immutable
sealed class RupeeMonthlyDataBlocState {
  const RupeeMonthlyDataBlocState();
}

final class RupeeMonthlyDataBlocInitial extends RupeeMonthlyDataBlocState{
  const RupeeMonthlyDataBlocInitial();
}

final class RupeeMonthlyDataBlocLoading extends RupeeMonthlyDataBlocState{
  const RupeeMonthlyDataBlocLoading();
}

final class RupeeMonthlyDataBlocLoaded extends RupeeMonthlyDataBlocState{
  const RupeeMonthlyDataBlocLoaded({required this.data});

  final List<RupeeMateModel> data;
}

final class RupeeMonthlyDataBlocError extends RupeeMonthlyDataBlocState{
  const RupeeMonthlyDataBlocError({this.ex});

  final String? ex;
}

extension RupeeMonthlyDataBlocExtension on RupeeMonthlyDataBlocState {
  bool get isSuccess {
    switch(this) {
      case RupeeMonthlyDataBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<String> get uniqueTitles {
    switch(this){
      case RupeeMonthlyDataBlocLoaded(data: final data):
        List<String> uniqueTitles = data.map((item) => item.title ?? '').toSet().toList();
        uniqueTitles.add('All');
        return uniqueTitles;
      default:
        return [];
    }
  }

  List<RupeeMateModel> get newExpenseData {
    switch(this){
      case RupeeMonthlyDataBlocLoaded(data: final data):
        return data.where((item) => item.month == DateTime.now().month && item.year == DateTime.now().year).toList();
      default:
        return [];
    }
  }

  List<RupeeMateModel> get allData {
    switch(this){
      case RupeeMonthlyDataBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case RupeeMonthlyDataBlocLoading():
        return true;
      default:
        return false;
    }
  }
}