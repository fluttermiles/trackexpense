import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/models/split_friend_detail_model.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/split_friend_detail_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'add_split_expense_event.dart';
part 'add_split_expense_state.dart';

class AddSplitExpenseBloc extends Bloc<AddSplitExpenseBlocEvent, AddSplitExpenseBlocState> {
  final SplitFriendDetailRepository splitFriendDetailRepository;
  AddSplitExpenseBloc({required this.splitFriendDetailRepository}) : super(AddSplitExpenseBlocInitial()) {
    on<AddSplitExpense>((event, emit) async {
      emit(AddSplitExpenseBlocLoading());
      final response = await splitFriendDetailRepository.addNewSplitDetailData(splitFriendDetailModel: event.splitFriendDetailModel);
      Logger.printError(response.toString());
      switch(response){
        case DataStateSuccess<SplitFriendDetailModel>(data: var data):
          emit(AddSplitExpenseBlocLoaded(data: data));
        case DataStateError<SplitFriendDetailModel>(ex: var ex):
          Logger.printError(ex.toString());
          emit(AddSplitExpenseBlocError(ex: ex));
      }
    });
  }
}
