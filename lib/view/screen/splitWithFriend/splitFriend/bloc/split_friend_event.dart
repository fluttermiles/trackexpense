part of 'split_friend_bloc.dart';

@immutable
sealed class SplitFriendBlocEvent {}

class SplitFriend extends SplitFriendBlocEvent {
  final String userId;
  SplitFriend({required this.userId});
}