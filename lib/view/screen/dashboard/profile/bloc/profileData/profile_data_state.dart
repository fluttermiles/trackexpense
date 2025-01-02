part of 'profile_data_bloc.dart';

@immutable
sealed class ProfileBlocState {
  const ProfileBlocState();
}

final class ProfileBlocInitial extends ProfileBlocState{
  const ProfileBlocInitial();
}

final class ProfileBlocLoading extends ProfileBlocState{
  const ProfileBlocLoading();
}

final class ProfileBlocLoaded extends ProfileBlocState{
  const ProfileBlocLoaded({required this.data});

  final ProfileModel data;
}

final class ProfileBlocError extends ProfileBlocState{
  const ProfileBlocError({this.ex});

  final String? ex;
}

extension ProfileBlocExtension on ProfileBlocState {
  bool get isSuccess {
    switch(this) {
      case ProfileBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  ProfileModel get profileData {
    switch(this){
      case ProfileBlocLoaded(data: final data):
        return data;
      default:
        return ProfileModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case ProfileBlocLoading():
        return true;
      default:
        return false;
    }
  }
}