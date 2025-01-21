part of 'notification_bloc.dart';

@immutable
sealed class NotificationBlocState {
  const NotificationBlocState();
}

final class NotificationBlocInitial extends NotificationBlocState{
  const NotificationBlocInitial();
}

final class NotificationBlocLoading extends NotificationBlocState{
  const NotificationBlocLoading();
}

final class NotificationBlocLoaded extends NotificationBlocState{
  const NotificationBlocLoaded({required this.data});

  final List<NotificationModel> data;
}

final class NotificationBlocError extends NotificationBlocState{
  const NotificationBlocError({this.ex});

  final String? ex;
}

extension NotificationExtension on NotificationBlocState {
  bool get isSuccess {
    switch(this) {
      case NotificationBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<NotificationModel> get notificationList {
    switch(this){
      case NotificationBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case NotificationBlocLoading():
        return true;
      default:
        return false;
    }
  }
}
