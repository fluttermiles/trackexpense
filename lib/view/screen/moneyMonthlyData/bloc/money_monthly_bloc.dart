
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/utils.dart';

part 'money_monthly_event.dart';
part 'money_monthly_state.dart';

class MoneyMonthlyBloc extends Bloc<MoneyMonthlyBlocEvent, MoneyMonthlyBlocState> {
  final RupeeObjectRepository rupeeObjectRepository;
  MoneyMonthlyBloc({required this.rupeeObjectRepository}) : super(MoneyMonthlyBlocInitial()) {
    on<MoneyMonthly>((event, emit) async {
      emit(MoneyMonthlyBlocLoading());
      final response = await rupeeObjectRepository.getRupeeDataByFilters(title: event.title.isNotEmpty ? event.title : null, month: event.month, year: event.year);
      switch(response) {
        case DataStateSuccess<List<RupeeMateModel>>(data: var data):
          Logger.printSuccess(data.toString());
          emit(MoneyMonthlyBlocLoaded(data: data));
        case DataStateError<List<RupeeMateModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(MoneyMonthlyBlocError(ex: ex));
      }
    });
  }
}
