part of 'rupee_monthly_bloc.dart';

@immutable
sealed class RupeeMonthlyBlocState {
  const RupeeMonthlyBlocState();
}

final class RupeeMonthlyBlocInitial extends RupeeMonthlyBlocState{
  const RupeeMonthlyBlocInitial();
}

final class RupeeMonthlyBlocLoading extends RupeeMonthlyBlocState{
  const RupeeMonthlyBlocLoading();
}

final class RupeeMonthlyBlocLoaded extends RupeeMonthlyBlocState{
  const RupeeMonthlyBlocLoaded({required this.data});

  final List<RupeeMateModel> data;
}

final class RupeeMonthlyBlocError extends RupeeMonthlyBlocState{
  const RupeeMonthlyBlocError({this.ex});

  final String? ex;
}

extension RupeeMonthlyBlocExtension on RupeeMonthlyBlocState {
  bool get isSuccess {
    switch(this) {
      case RupeeMonthlyBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  double get expense {
    switch(this){
      case RupeeMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Expense')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get credit {
    switch(this){
      case RupeeMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Credit')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get lend {
    switch(this){
      case RupeeMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Lend')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get debt {
    switch(this){
      case RupeeMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Debt')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  List<RupeeMateModel> get newData {
    switch(this){
      case RupeeMonthlyBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case RupeeMonthlyBlocLoading():
        return true;
      default:
        return false;
    }
  }
}