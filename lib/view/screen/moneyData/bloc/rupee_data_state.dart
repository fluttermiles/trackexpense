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

  double get expense {
    switch(this){
      case RupeeDataBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Expense')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get credit {
    switch(this){
      case RupeeDataBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Credit')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get lend {
    switch(this){
      case RupeeDataBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Lend')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get debt {
    switch(this){
      case RupeeDataBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Debt')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
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