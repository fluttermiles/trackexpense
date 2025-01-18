part of 'split_friend_bloc.dart';

@immutable
sealed class SplitFriendBlocState {
  const SplitFriendBlocState();
}

final class SplitFriendBlocInitial extends SplitFriendBlocState{
  const SplitFriendBlocInitial();
}

final class SplitFriendBlocLoading extends SplitFriendBlocState{
  const SplitFriendBlocLoading();
}

final class SplitFriendBlocLoaded extends SplitFriendBlocState{
  const SplitFriendBlocLoaded({required this.data});

  final List<SplitFriendModel> data;
}

final class SplitFriendBlocError extends SplitFriendBlocState{
  const SplitFriendBlocError({this.ex});

  final String? ex;
}

extension SplitFriendExtension on SplitFriendBlocState {
  bool get isSuccess {
    switch(this) {
      case SplitFriendBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<SplitFriendModel> get splitFriendList {
    switch(this){
      case SplitFriendBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case SplitFriendBlocLoading():
        return true;
      default:
        return false;
    }
  }
}
