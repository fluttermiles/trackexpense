part of 'add_user_split_bloc.dart';

@immutable
sealed class AddUserSplitBlocEvent {}

class AddUserSplit extends AddUserSplitBlocEvent {
  final NotificationModel notificationModel;
  final String emailId;

  AddUserSplit({required this.notificationModel, required this.emailId});
}