part of 'add_user_split_bloc.dart';


@immutable
sealed class AddUserSplitBlocState {
  const AddUserSplitBlocState();
}

final class AddUserSplitBlocInitial extends AddUserSplitBlocState{
  const AddUserSplitBlocInitial();
}

final class AddUserSplitBlocLoading extends AddUserSplitBlocState{
  const AddUserSplitBlocLoading();
}

final class AddUserSplitBlocLoaded extends AddUserSplitBlocState{
  const AddUserSplitBlocLoaded({required this.data});

  final NotificationModel data;
}

final class AddUserSplitBlocError extends AddUserSplitBlocState{
  const AddUserSplitBlocError({this.ex});

  final String? ex;
}

extension AddUserSplitBlocExtension on AddUserSplitBlocState {
  bool get isSuccess {
    switch(this) {
      case AddUserSplitBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  NotificationModel get newsplitFirendData {
    switch(this){
      case AddUserSplitBlocLoaded(data: final data):
        return data;
      default:
        return NotificationModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case AddUserSplitBlocLoading():
        return true;
      default:
        return false;
    }
  }
}