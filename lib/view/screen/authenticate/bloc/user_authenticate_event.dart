part of 'user_authenticate_bloc.dart';

@immutable
sealed class UserAuthenticateBlocEvent {}

class UserAuthenticate extends UserAuthenticateBlocEvent {
  UserAuthenticate();
}