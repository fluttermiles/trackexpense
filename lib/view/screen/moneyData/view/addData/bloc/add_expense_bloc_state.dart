part of 'add_expense_bloc_bloc.dart';

@immutable
sealed class AddExpenseBlocState {
  const AddExpenseBlocState();
}

final class AddExpenseBlocInitial extends AddExpenseBlocState{
  const AddExpenseBlocInitial();
}

final class AddExpenseBlocLoading extends AddExpenseBlocState{
  const AddExpenseBlocLoading();
}

final class AddExpenseBlocLoaded extends AddExpenseBlocState{
  const AddExpenseBlocLoaded({required this.data});

  final RupeeMateModel data;
}

final class AddExpenseBlocError extends AddExpenseBlocState{
  const AddExpenseBlocError({this.ex});

  final String? ex;
}

extension AddExpenseBlocExtension on AddExpenseBlocState {
  bool get isSuccess {
    switch(this) {
      case AddExpenseBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  RupeeMateModel get newExpenseData {
    switch(this){
      case AddExpenseBlocLoaded(data: final data):
        return data;
      default:
        return RupeeMateModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case AddExpenseBlocLoading():
        return true;
      default:
        return false;
    }
  }
}