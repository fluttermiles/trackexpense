part of 'notification_bloc.dart';

@immutable
sealed class NotificationBlocEvent {}

class FetchNotification extends NotificationBlocEvent {
  final String userId;
  final bool isEditNotification;
  final String? notificationId;
  final List<NotificationModel>? notificationList;
  FetchNotification({required this.userId, this.notificationList, this.isEditNotification = false, this.notificationId});
}