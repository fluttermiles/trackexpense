import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/utils/utils.dart';

part 'expense_credit_event.dart';
part 'expense_credit_state.dart';

class ExpenseCreditBloc extends Bloc<ExpenseCreditBlocEvent, ExpenseCreditBlocState> {
  ExpenseCreditBloc() : super(ExpenseCreditBlocInitial()) {
    on<ExpenseCreditData>((event, emit) {
      emit(ExpenseCreditBlocLoaded(month: event.month, year: event.year, data: event.rupeeMateList));
    });
  }
}
