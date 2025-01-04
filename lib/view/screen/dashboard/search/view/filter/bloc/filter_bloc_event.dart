part of 'filter_bloc_bloc.dart';

@immutable
sealed class FilterBlocEvent {}

class Filter extends FilterBlocEvent {
  Filter({required this.month, required this.year});
  final int month;
  final int year;
}