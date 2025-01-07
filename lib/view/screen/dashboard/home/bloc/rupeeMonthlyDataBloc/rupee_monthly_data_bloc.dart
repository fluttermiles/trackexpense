import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/utils.dart';
import 'package:trackexpense/view/screen/dashboard/home/bloc/expenseCreditBloc/expense_credit_bloc.dart';

part 'rupee_monthly_data_event.dart';
part 'rupee_monthly_data_state.dart';

class RupeeMonthlyDataBloc extends Bloc<RupeeMonthlyDataBlocEvent, RupeeMonthlyDataBlocState> {
  final RupeeObjectRepository rupeeObjectRepository;
  final ExpenseCreditBloc expenseCreditBloc;
  RupeeMonthlyDataBloc({required this.rupeeObjectRepository, required this.expenseCreditBloc}) : super(RupeeMonthlyDataBlocInitial()) {
    on<RupeeMonthlyData>((event, emit) async {
      emit(RupeeMonthlyDataBlocLoading());
      if(event.isLogOut ?? false) {
        expenseCreditBloc.add(ExpenseCreditData(month: DateTime.now().month, year: DateTime.now().year, rupeeMateList: []));
        emit(RupeeMonthlyDataBlocLoaded(data: []));
        return;
      }
      final response = await rupeeObjectRepository.getRupeeDataByFilters(month: DateTime.now().month, year: DateTime.now().year );
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
