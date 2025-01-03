import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';
import 'package:trackexpense/utils/utils.dart';

part 'rupee_monthly_data_event.dart';
part 'rupee_monthly_data_state.dart';

class RupeeMonthlyDataBloc extends Bloc<RupeeMonthlyDataBlocEvent, RupeeMonthlyDataBlocState> {
  final RupeeMateRepository rupeeMateRepository;
  RupeeMonthlyDataBloc({required this.rupeeMateRepository}) : super(RupeeMonthlyDataBlocInitial()) {
    on<RupeeMonthlyData>((event, emit) async {
      emit(RupeeMonthlyDataBlocLoading());
      final response = await rupeeMateRepository.getRupeeData(userId: event.userId);
      switch(response) {
        case DataStateSuccess<List<RupeeMateModel>>(data: var data):
          Logger.printSuccess(data.toString());
          emit(RupeeMonthlyDataBlocLoaded(data: data));
        case DataStateError<List<RupeeMateModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(RupeeMonthlyDataBlocError(ex: ex));
      }
    });
  }
}
