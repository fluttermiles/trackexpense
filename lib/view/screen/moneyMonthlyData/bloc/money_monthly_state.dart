part of 'money_monthly_bloc.dart';

@immutable
sealed class MoneyMonthlyBlocState {
  const MoneyMonthlyBlocState();
}

final class MoneyMonthlyBlocInitial extends MoneyMonthlyBlocState{
  const MoneyMonthlyBlocInitial();
}

final class MoneyMonthlyBlocLoading extends MoneyMonthlyBlocState{
  const MoneyMonthlyBlocLoading();
}

final class MoneyMonthlyBlocLoaded extends MoneyMonthlyBlocState{
  const MoneyMonthlyBlocLoaded({required this.data});

  final List<RupeeMateModel> data;
}

final class MoneyMonthlyBlocError extends MoneyMonthlyBlocState{
  const MoneyMonthlyBlocError({this.ex});

  final String? ex;
}

extension MoneyMonthlyBlocExtension on MoneyMonthlyBlocState {
  bool get isSuccess {
    switch(this) {
      case MoneyMonthlyBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<RupeeMateModel> get newExpenseData {
    switch(this){
      case MoneyMonthlyBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  double get expense {
    switch(this){
      case MoneyMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Expense')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get credit {
    switch(this){
      case MoneyMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Credit')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get lend {
    switch(this){
      case MoneyMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Lend')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get debt {
    switch(this){
      case MoneyMonthlyBlocLoaded(data: final data):
        return data.where((item) => item.type == 'Debt')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  bool get isLoading {
    switch(this) {
      case MoneyMonthlyBlocLoading():
        return true;
      default:
        return false;
    }
  }
}