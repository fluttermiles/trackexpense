part of 'accept_reject_split_bloc.dart';

@immutable
sealed class AcceptRejectSplitBlocState {
  const AcceptRejectSplitBlocState();
}

final class AcceptRejectSplitBlocInitial extends AcceptRejectSplitBlocState{
  const AcceptRejectSplitBlocInitial();
}

final class AcceptRejectSplitBlocLoading extends AcceptRejectSplitBlocState{
  const AcceptRejectSplitBlocLoading();
}

final class AcceptRejectSplitBlocLoaded extends AcceptRejectSplitBlocState{
  const AcceptRejectSplitBlocLoaded({required this.data});

  final NotificationModel data;
}

final class AcceptRejectSplitBlocError extends AcceptRejectSplitBlocState{
  const AcceptRejectSplitBlocError({this.ex});

  final String? ex;
}

extension AcceptRejectSplitBlocExtension on AcceptRejectSplitBlocState {
  bool get isSuccess {
    switch(this) {
      case AcceptRejectSplitBlocLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  NotificationModel get acceptSplitData {
    switch(this){
      case AcceptRejectSplitBlocLoaded(data: final data):
        return data;
      default:
        return NotificationModel();
    }
  }

  bool get isLoading {
    switch(this) {
      case AcceptRejectSplitBlocLoading():
        return true;
      default:
        return false;
    }
  }
}