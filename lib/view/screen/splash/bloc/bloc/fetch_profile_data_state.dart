part of 'fetch_profile_data_bloc.dart';

@immutable
sealed class FetchProfileBlocState {
  const FetchProfileBlocState();
}

final class FetchProfileBlocInitial extends FetchProfileBlocState{
  const FetchProfileBlocInitial();
}

final class FetchProfileBlocLoading extends FetchProfileBlocState{
  const FetchProfileBlocLoading();
}

final class FetchProfileBlocLoaded extends FetchProfileBlocState{
  const FetchProfileBlocLoaded({required this.data});

  final ProfileModel data;
}

final class FetchProfileBlocError extends FetchProfileBlocState{
  const FetchProfileBlocError({this.ex});

  final String? ex;
}

extension FetchProfileBlocExtension on FetchProfileBlocState {
  bool get isSuccess {
    switch(this) {
      case FetchProfileBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  ProfileModel get profileData {
    switch(this){
      case FetchProfileBlocLoaded(data: final data):
        return data;
      default:
        return ProfileModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case FetchProfileBlocLoading():
        return true;
      default:
        return false;
    }
  }
}