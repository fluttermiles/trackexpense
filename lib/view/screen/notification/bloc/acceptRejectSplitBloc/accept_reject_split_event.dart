part of 'accept_reject_split_bloc.dart';

@immutable
sealed class AcceptRejectSplitEvent {}

class AcceptRejectSplit extends AcceptRejectSplitEvent {
  // final String splitId;
  // final String notificationId;
  final UserList userList;
  final NotificationModel notificationModel;
  AcceptRejectSplit({ required this.userList, required this.notificationModel});
}
//required this.splitId, required this.notificationId,