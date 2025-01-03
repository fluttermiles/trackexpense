import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/expenseCreditBloc/expense_credit_bloc.dart';

part 'rupee_monthly_data_event.dart';
part 'rupee_monthly_data_state.dart';

class RupeeMonthlyDataBloc extends Bloc<RupeeMonthlyDataBlocEvent, RupeeMonthlyDataBlocState> {
  final RupeeMateRepository rupeeMateRepository;
  final ExpenseCreditBloc expenseCreditBloc;
  RupeeMonthlyDataBloc({required this.rupeeMateRepository, required this.expenseCreditBloc}) : super(RupeeMonthlyDataBlocInitial()) {
    on<RupeeMonthlyData>((event, emit) async {
      emit(RupeeMonthlyDataBlocLoading());
      final response = await rupeeMateRepository.getRupeeData(userId: event.userId, year: event.year, month: event.month);
      switch(response) {
        case DataStateSuccess<List<RupeeMateModel>>(data: var data):
          Logger.printSuccess(data.toString());
          expenseCreditBloc.add(ExpenseCreditData(month: DateTime.now().month, year: DateTime.now().year, rupeeMateList: data));
          emit(RupeeMonthlyDataBlocLoaded(data: data));
        case DataStateError<List<RupeeMateModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(RupeeMonthlyDataBlocError(ex: ex));
      }
    });
  }
}
