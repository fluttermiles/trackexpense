part of 'logout_bloc.dart';

@immutable
sealed class LogoutBlocEvent {}

class LogoutEvent extends LogoutBlocEvent {
  LogoutEvent();
}