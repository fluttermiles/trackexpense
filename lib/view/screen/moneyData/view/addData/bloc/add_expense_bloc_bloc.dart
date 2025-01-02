import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';
import 'package:trackexpense/utils/utils.dart';

part 'add_expense_bloc_event.dart';
part 'add_expense_bloc_state.dart';

class AddExpenseBlocBloc extends Bloc<AddExpenseBlocEvent, AddExpenseBlocState> {
  final RupeeMateRepository rupeeMateRepository;
  AddExpenseBlocBloc({required this.rupeeMateRepository}) : super(AddExpenseBlocInitial()) {
    on<AddExpense>((event, emit) async {
      emit(const AddExpenseBlocLoading());
      final response = await rupeeMateRepository.addNewRupeeData(rupeeMateModel: event.expenseModel);
      switch(response) {
        case DataStateSuccess<RupeeMateModel>(data: var data):
          emit(AddExpenseBlocLoaded(data: data));
          Logger.printSuccess(data.toString());
        case DataStateError<RupeeMateModel>(ex: var ex):
          emit(AddExpenseBlocError(ex: ex));
          Logger.printSuccess(ex.toString());
      }
    });
  }
}
