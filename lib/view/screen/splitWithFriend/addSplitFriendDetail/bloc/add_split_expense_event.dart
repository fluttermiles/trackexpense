part of 'add_split_expense_bloc.dart';

@immutable
sealed class AddSplitExpenseBlocEvent {}

class AddSplitExpense extends AddSplitExpenseBlocEvent {
  final SplitFriendDetailModel splitFriendDetailModel;

  AddSplitExpense({required this.splitFriendDetailModel});
}