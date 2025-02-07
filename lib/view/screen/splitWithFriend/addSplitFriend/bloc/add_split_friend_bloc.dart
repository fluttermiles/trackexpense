import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/data/remote/splitFriend/split_friend_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'add_split_friend_event.dart';
part 'add_split_friend_state.dart';

class AddSplitFriendBloc extends Bloc<AddSplitFriendBlocEvent, AddSplitFriendBlocState> {
  final SplitFriendRepository splitFriendRepository;
  AddSplitFriendBloc({required this.splitFriendRepository}) : super(AddSplitFriendBlocInitial()) {
    on<AddSplitFriend>((event, emit) async {
      emit(AddSplitFriendBlocLoading());
      final response = await splitFriendRepository.addSplitFriendData(splitFriendModel: event.splitFriendModel);
      switch(response){
        case DataStateSuccess<SplitFriendModel>(data: var data):
          Logger.printWarning(data.toString());
          emit(AddSplitFriendBlocLoaded(data: data));
        case DataStateError<SplitFriendModel>(ex: var ex):
          Logger.printError(ex.toString());
          emit(AddSplitFriendBlocError(ex: ex));
      }
    });
  }
}
