import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/utils.dart';

part 'rupee_monthly_event.dart';
part 'rupee_monthly_state.dart';

class RupeeMonthlyBloc extends Bloc<RupeeMonthlyBlocEvent, RupeeMonthlyBlocState> {
  final RupeeObjectRepository rupeeObjectRepository;
  RupeeMonthlyBloc({required this.rupeeObjectRepository}) : super(RupeeMonthlyBlocInitial()) {
    on<RupeeMonthly>((event, emit) async {
      emit(RupeeMonthlyBlocLoading());
      final response = await rupeeObjectRepository.getRupeeDataByFilters(month: event.month, year: event.year);
      switch(response) {
        case DataStateSuccess<List<RupeeMateModel>>(data: var data):
          Logger.printSuccess(data.toString());
          emit(RupeeMonthlyBlocLoaded(data: data));
        case DataStateError<List<RupeeMateModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(RupeeMonthlyBlocError(ex: ex));
      }
    });
  }
}
