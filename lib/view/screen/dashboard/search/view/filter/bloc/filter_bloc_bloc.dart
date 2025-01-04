

import 'package:trackexpense/utils/utils.dart';

part 'filter_bloc_event.dart';
part 'filter_bloc_state.dart';

class FilterBlocBloc extends Bloc<FilterBlocEvent, FilterBlocState> {
  FilterBlocBloc() : super(FilterBlocInitial()) {
    on<Filter>((event, emit) {
      emit(FilterBlocLoaded(month: event.month, year: event.year));
    });
  }
}
