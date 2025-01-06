import 'package:firebase_auth/firebase_auth.dart';
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/local/rupeeMate/rupeemate_object_repo.dart';
import 'package:trackexpense/data/remote/rupeemate/models/rupeemate_model.dart';
import 'package:trackexpense/data/remote/rupeemate/rupeemate_repo.dart';
import 'package:trackexpense/utils/utils.dart';

part 'add_expense_bloc_event.dart';
part 'add_expense_bloc_state.dart';

class AddExpenseBlocBloc extends Bloc<AddExpenseBlocEvent, AddExpenseBlocState> {
  final RupeeMateRepository rupeeMateRepository;
  final RupeeObjectRepository rupeeObjectRepository;
  AddExpenseBlocBloc({required this.rupeeMateRepository, required this.rupeeObjectRepository}) : super(AddExpenseBlocInitial()) {
    on<AddExpense>((event, emit) async {
      emit(const AddExpenseBlocLoading());
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      if(userId.isEmpty) {
        await rupeeObjectRepository.setRupeeToObjectBox(rupeeMateModel: event.expenseModel, isSynced: false);
        emit(AddExpenseBlocLoaded(data: event.expenseModel));
      } else {
        final response = await rupeeMateRepository.addNewRupeeData(rupeeMateModel: event.expenseModel);
        switch(response) {
          case DataStateSuccess<RupeeMateModel>(data: var data):
            await rupeeObjectRepository.setRupeeToObjectBox(rupeeMateModel: event.expenseModel, isSynced: true);
            emit(AddExpenseBlocLoaded(data: data));
            Logger.printSuccess(data.toString());
          case DataStateError<RupeeMateModel>(ex: var ex):
            await rupeeObjectRepository.setRupeeToObjectBox(rupeeMateModel: event.expenseModel, isSynced: false);
            emit(AddExpenseBlocError(ex: ex));
            Logger.printSuccess(ex.toString());
        }
      }
    });
  }
}
