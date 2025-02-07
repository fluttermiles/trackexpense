part of 'add_split_expense_bloc.dart';

@immutable
sealed class AddSplitExpenseBlocState {
  const AddSplitExpenseBlocState();
}

final class AddSplitExpenseBlocInitial extends AddSplitExpenseBlocState{
  const AddSplitExpenseBlocInitial();
}

final class AddSplitExpenseBlocLoading extends AddSplitExpenseBlocState{
  const AddSplitExpenseBlocLoading();
}

final class AddSplitExpenseBlocLoaded extends AddSplitExpenseBlocState{
  const AddSplitExpenseBlocLoaded({required this.data});

  final SplitFriendDetailModel data;
}

final class AddSplitExpenseBlocError extends AddSplitExpenseBlocState{
  const AddSplitExpenseBlocError({this.ex});

  final String? ex;
}

extension AddSplitExpenseBlocExtension on AddSplitExpenseBlocState {
  bool get isSuccess {
    switch(this) {
      case AddSplitExpenseBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  SplitFriendDetailModel get newSplitExpenseData {
    switch(this){
      case AddSplitExpenseBlocLoaded(data: final data):
        return data;
      default:
        return SplitFriendDetailModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case AddSplitExpenseBlocLoading():
        return true;
      default:
        return false;
    }
  }
}