part of 'logout_bloc.dart';

@immutable
sealed class LogoutBlocState {
  const LogoutBlocState();
}

final class LogoutBlocInitial extends LogoutBlocState{
  const LogoutBlocInitial();
}

final class LogoutBlocLoading extends LogoutBlocState{
  const LogoutBlocLoading();
}

final class LogoutBlocLoaded extends LogoutBlocState{
  const LogoutBlocLoaded();
}

final class LogoutBlocError extends LogoutBlocState{
  const LogoutBlocError({this.ex});

  final String? ex;
}

extension LogoutBlocExtension on LogoutBlocState {
  bool get isSuccess {
    switch(this) {
      case LogoutBlocLoaded():
        return true;
      default:
        return false;
    }
  }

  bool get isLoading {
    switch(this) {
      case LogoutBlocLoading():
        return true;
      default:
        return false;
    }
  }
}