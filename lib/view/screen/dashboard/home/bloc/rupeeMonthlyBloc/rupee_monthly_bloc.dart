import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';
import 'package:trackexpense/utils/utils.dart';

part 'rupee_monthly_event.dart';
part 'rupee_monthly_state.dart';

class RupeeMonthlyBloc extends Bloc<RupeeMonthlyBlocEvent, RupeeMonthlyBlocState> {
  final RupeeMateRepository rupeeMateRepository;
  RupeeMonthlyBloc({required this.rupeeMateRepository}) : super(RupeeMonthlyBlocInitial()) {
    on<RupeeMonthly>((event, emit) async {
      emit(RupeeMonthlyBlocLoading());
      final response = await rupeeMateRepository.getRupeeData(userId: event.userId, month: event.month, year: event.year);
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
