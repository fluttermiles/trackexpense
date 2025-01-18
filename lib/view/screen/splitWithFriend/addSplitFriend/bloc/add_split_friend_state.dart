part of 'add_split_friend_bloc.dart';

@immutable
sealed class AddSplitFriendBlocState {
  const AddSplitFriendBlocState();
}

final class AddSplitFriendBlocInitial extends AddSplitFriendBlocState{
  const AddSplitFriendBlocInitial();
}

final class AddSplitFriendBlocLoading extends AddSplitFriendBlocState{
  const AddSplitFriendBlocLoading();
}

final class AddSplitFriendBlocLoaded extends AddSplitFriendBlocState{
  const AddSplitFriendBlocLoaded({required this.data});

  final SplitFriendModel data;
}

final class AddSplitFriendBlocError extends AddSplitFriendBlocState{
  const AddSplitFriendBlocError({this.ex});

  final String? ex;
}

extension AddSplitFriendBlocExtension on AddSplitFriendBlocState {
  bool get isSuccess {
    switch(this) {
      case AddSplitFriendBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  SplitFriendModel get newsplitFirendData {
    switch(this){
      case AddSplitFriendBlocLoaded(data: final data):
        return data;
      default:
        return SplitFriendModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case AddSplitFriendBlocLoading():
        return true;
      default:
        return false;
    }
  }
}