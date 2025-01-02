part of 'user_authenticate_bloc.dart';

@immutable
sealed class UserAuthenticateBlocState {
  const UserAuthenticateBlocState();
}

final class UserAuthenticateBlocInitial extends UserAuthenticateBlocState{
  const UserAuthenticateBlocInitial();
}

final class UserAuthenticateBlocLoading extends UserAuthenticateBlocState{
  const UserAuthenticateBlocLoading();
}

final class UserAuthenticateBlocLoaded extends UserAuthenticateBlocState{
  const UserAuthenticateBlocLoaded({required this.data});

  final ProfileModel data;
}

final class UserAuthenticateBlocError extends UserAuthenticateBlocState{
  const UserAuthenticateBlocError({this.ex});

  final String? ex;
}

extension UserAuthenticateBlocExtension on UserAuthenticateBlocState {
  bool get isSuccess {
    switch(this) {
      case UserAuthenticateBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  ProfileModel get profileData {
    switch(this){
      case UserAuthenticateBlocLoaded(data: final data):
        return data;
      default:
        return ProfileModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case UserAuthenticateBlocLoading():
        return true;
      default:
        return false;
    }
  }
}