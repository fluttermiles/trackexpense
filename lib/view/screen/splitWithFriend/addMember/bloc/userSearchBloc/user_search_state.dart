part of 'user_search_bloc.dart';

@immutable
sealed class UserSearchBlocState {
  const UserSearchBlocState();
}

final class UserSearchBlocInitial extends UserSearchBlocState{
  const UserSearchBlocInitial();
}

final class UserSearchBlocLoading extends UserSearchBlocState{
  const UserSearchBlocLoading();
}

final class UserSearchBlocLoaded extends UserSearchBlocState{
  const UserSearchBlocLoaded({required this.data});

  final List<String> data;
}

final class UserSearchBlocError extends UserSearchBlocState{
  const UserSearchBlocError({this.ex});

  final String? ex;
}

extension UserSearchExtension on UserSearchBlocState {
  bool get isSuccess {
    switch(this) {
      case UserSearchBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<String> get emailList {
    switch(this){
      case UserSearchBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case UserSearchBlocLoading():
        return true;
      default:
        return false;
    }
  }
}
