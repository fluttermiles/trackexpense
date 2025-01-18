part of 'add_split_friend_bloc.dart';

@immutable
sealed class AddSplitFriendBlocEvent {}

class AddSplitFriend extends AddSplitFriendBlocEvent {
  final SplitFriendModel splitFriendModel;

  AddSplitFriend({required this.splitFriendModel});
}