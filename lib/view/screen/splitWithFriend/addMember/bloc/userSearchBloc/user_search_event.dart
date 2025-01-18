part of 'user_search_bloc.dart';

@immutable
sealed class UserSearchBlocEvent {}

class UserSearch extends UserSearchBlocEvent {
  final String prefix;
  UserSearch({required this.prefix});
}