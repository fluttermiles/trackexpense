import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/data/remote/splitFriend/split_friend_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'split_friend_event.dart';
part 'split_friend_state.dart';

class SplitFriendBloc extends Bloc<SplitFriendBlocEvent, SplitFriendBlocState> {
  final SplitFriendRepository splitFriendRepository;
  SplitFriendBloc({required this.splitFriendRepository}) : super(SplitFriendBlocInitial()) {
    on<SplitFriend>((event, emit) async {
      emit(SplitFriendBlocLoading());
      final response = await splitFriendRepository.getSplitFriendData(userId: event.userId);
      Logger.printError(response.toString());
      switch(response){
        case DataStateSuccess<List<SplitFriendModel>>(data: var data):
          emit(SplitFriendBlocLoaded(data: data));
        case DataStateError<List<SplitFriendModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(SplitFriendBlocError(ex: ex));
      }
    });
  }
}
