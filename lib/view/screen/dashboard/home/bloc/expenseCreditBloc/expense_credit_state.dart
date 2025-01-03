part of 'expense_credit_bloc.dart';

@immutable
sealed class ExpenseCreditBlocState {
  const ExpenseCreditBlocState();
}

final class ExpenseCreditBlocInitial extends ExpenseCreditBlocState{
  const ExpenseCreditBlocInitial();
}

final class ExpenseCreditBlocLoading extends ExpenseCreditBlocState{
  const ExpenseCreditBlocLoading();
}

final class ExpenseCreditBlocLoaded extends ExpenseCreditBlocState{
  const ExpenseCreditBlocLoaded({required this.data, required this.month, required this.year});

  final List<RupeeMateModel> data;
  final int month;
  final int year;
}

final class ExpenseCreditBlocError extends ExpenseCreditBlocState{
  const ExpenseCreditBlocError({this.ex});

  final String? ex;
}

extension ExpenseCreditBlocExtension on ExpenseCreditBlocState {
  bool get isSuccess {
    switch(this) {
      case ExpenseCreditBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<RupeeMateModel> get newExpenseData {
    switch(this){
      case ExpenseCreditBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  double get expense {
    switch(this){
      case ExpenseCreditBlocLoaded(data: final data, month: final month, year: final year):
        return data.where((item) => item.year == year && item.month == month && item.type == 'Expense')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get credit {
    switch(this){
      case ExpenseCreditBlocLoaded(data: final data, month: final month, year: final year):
        return data.where((item) => item.year == year && item.month == month && item.type == 'Credit')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get lend {
    switch(this){
      case ExpenseCreditBlocLoaded(data: final data, month: final month, year: final year):
        return data.where((item) => item.year == year && item.month == month && item.type == 'Lend')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  double get debt {
    switch(this){
      case ExpenseCreditBlocLoaded(data: final data, month: final month, year: final year):
        return data.where((item) => item.year == year && item.month == month && item.type == 'Debt')
          .fold(0.0, (sum, item) => sum + (item.amount ?? 0.0));
      default:
        return 0.0;
    }
  }

  bool get isLoading {
    switch(this) {
      case ExpenseCreditBlocLoading():
        return true;
      default:
        return false;
    }
  }
}