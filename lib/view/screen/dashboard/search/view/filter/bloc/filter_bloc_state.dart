part of 'filter_bloc_bloc.dart';

@immutable
sealed class FilterBlocState {
  const FilterBlocState();
}

final class FilterBlocInitial extends FilterBlocState{
  const FilterBlocInitial();
}

final class FilterBlocLoaded extends FilterBlocState{
  const FilterBlocLoaded({required this.month, required this.year});

  final int month;
  final int year;
}

final class FilterBlocError extends FilterBlocState{
  const FilterBlocError({this.ex});

  final String? ex;
}

extension FilterBlocExtension on FilterBlocState {
  int get month {
    switch(this){
      case FilterBlocLoaded(month: final month):
        return month;
      default:
        return DateTime.now().month;
    }
  }

  int get year {
    switch(this){
      case FilterBlocLoaded(year: final year):
        return year;
      default:
        return DateTime.now().year;
    }
  }
}