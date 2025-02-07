part of 'split_friend_detail_bloc.dart';
@immutable
sealed class SplitFriendDetailBlocState {
  const SplitFriendDetailBlocState();
}

final class SplitFriendDetailBlocInitial extends SplitFriendDetailBlocState{
  const SplitFriendDetailBlocInitial();
}

final class SplitFriendDetailBlocLoading extends SplitFriendDetailBlocState{
  const SplitFriendDetailBlocLoading();
}

final class SplitFriendDetailBlocLoaded extends SplitFriendDetailBlocState{
  const SplitFriendDetailBlocLoaded({required this.data});

  final List<SplitFriendDetailModel> data;
}

final class SplitFriendDetailBlocError extends SplitFriendDetailBlocState{
  const SplitFriendDetailBlocError({this.ex});

  final String? ex;
}

extension SplitFriendDetailExtension on SplitFriendDetailBlocState {
  bool get isSuccess {
    switch(this) {
      case SplitFriendDetailBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  List<SplitFriendDetailModel> get splitFriendList {
    switch(this){
      case SplitFriendDetailBlocLoaded(data: final data):
        return data;
      default:
        return [];
    }
  }

  bool get isLoading {
    switch(this) {
      case SplitFriendDetailBlocLoading():
        return true;
      default:
        return false;
    }
  }
}
