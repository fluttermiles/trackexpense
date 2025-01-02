import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';
import 'package:trackexpense/utils/utils.dart';

part 'rupee_data_event.dart';
part 'rupee_data_state.dart';

class RupeeDataBloc extends Bloc<RupeeDataBlocEvent, RupeeDataBlocState> {
  final RupeeMateRepository rupeeMateRepository;
  RupeeDataBloc({required this.rupeeMateRepository}) : super(RupeeDataBlocInitial()) {
    on<RupeeData>((event, emit) async {
      emit(RupeeDataBlocLoading());
      final response = await rupeeMateRepository.getRupeeData(userId: event.userId, day: event.selectedDate.day, month: event.selectedDate.month, year: event.selectedDate.year);
      switch(response) {
        case DataStateSuccess<List<RupeeMateModel>>(data: var data):
          Logger.printSuccess(data.toString());
          emit(RupeeDataBlocLoaded(data: data));
        case DataStateError<List<RupeeMateModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(RupeeDataBlocError(ex: ex));
      }
    });
  }
}
