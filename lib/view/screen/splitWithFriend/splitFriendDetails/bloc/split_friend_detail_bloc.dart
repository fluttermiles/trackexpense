import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/models/split_friend_detail_model.dart';
import 'package:trackexpense/data/remote/splitFriendDetail/split_friend_detail_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'split_friend_detail_event.dart';
part 'split_friend_detail_state.dart';

class SplitFriendDetailBloc extends Bloc<SplitFriendDetailBlocEvent, SplitFriendDetailBlocState> {
  final SplitFriendDetailRepository splitFriendDetailRepository;
  SplitFriendDetailBloc({required this.splitFriendDetailRepository}) : super(SplitFriendDetailBlocInitial()) {
    on<SplitFriendDetail>((event, emit) async {
      emit(SplitFriendDetailBlocLoading());
      final response = await splitFriendDetailRepository.getSplitDetailData(splitFriendId: event.splitFriendId);
      Logger.printError(response.toString());
      switch(response){
        case DataStateSuccess<List<SplitFriendDetailModel>>(data: var data):
          emit(SplitFriendDetailBlocLoaded(data: data));
        case DataStateError<List<SplitFriendDetailModel>>(ex: var ex):
          Logger.printError(ex.toString());
          emit(SplitFriendDetailBlocError(ex: ex));
      }
    });
  }
}
