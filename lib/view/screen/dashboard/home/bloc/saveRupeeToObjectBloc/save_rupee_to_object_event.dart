part of 'save_rupee_to_object_bloc.dart';

@immutable
sealed class SaveRupeeToObjectEvent {}

class SaveRupeeToObject extends SaveRupeeToObjectEvent {
  final String userId;

  SaveRupeeToObject({required this.userId});
}