part of 'split_friend_detail_bloc.dart';


@immutable
sealed class SplitFriendDetailBlocEvent {}

class SplitFriendDetail extends SplitFriendDetailBlocEvent {
  final String splitFriendId;
  SplitFriendDetail({required this.splitFriendId});
}