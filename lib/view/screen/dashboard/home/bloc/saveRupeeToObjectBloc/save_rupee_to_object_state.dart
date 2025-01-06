part of 'save_rupee_to_object_bloc.dart';

@immutable
sealed class SaveRupeeToObjectState {
  const SaveRupeeToObjectState();
}

final class SaveRupeeToObjectInitial extends SaveRupeeToObjectState{
  const SaveRupeeToObjectInitial();
}

final class SaveRupeeToObjectLoading extends SaveRupeeToObjectState{
  const SaveRupeeToObjectLoading();
}

final class SaveRupeeToObjectLoaded extends SaveRupeeToObjectState{
  const SaveRupeeToObjectLoaded({required this.data});

  final List<RupeeMateModel> data;
}

final class SaveRupeeToObjectError extends SaveRupeeToObjectState{
  const SaveRupeeToObjectError({this.ex});

  final String? ex;
}

extension SaveRupeeToObjectExtension on SaveRupeeToObjectState {
  bool get isSuccess {
    switch(this) {
      case SaveRupeeToObjectLoaded(data: _):
        return true;
      default:
        return false;
    }
  }

  bool get isLoading {
    switch(this) {
      case SaveRupeeToObjectLoading():
        return true;
      default:
        return false;
    }
  }
}