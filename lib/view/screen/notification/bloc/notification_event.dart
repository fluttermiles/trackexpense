part of 'notification_bloc.dart';

@immutable
sealed class NotificationBlocEvent {}

class FetchNotification extends NotificationBlocEvent {
  final String userId;
  FetchNotification({required this.userId});
}