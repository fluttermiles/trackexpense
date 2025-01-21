import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/notification/models/notification_model.dart';
import 'package:trackexpense/data/remote/notification/notification_repository.dart';
import 'package:trackexpense/data/remote/splitFriend/models/split_friend_model.dart';
import 'package:trackexpense/data/remote/splitFriend/split_friend_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'accept_reject_split_event.dart';
part 'accept_reject_split_state.dart';

class AcceptRejectSplitBloc extends Bloc<AcceptRejectSplitEvent, AcceptRejectSplitBlocState> {
  final SplitFriendRepository splitFriendRepository;
  final NotificationRepository notificationRepository;
  AcceptRejectSplitBloc({required this.notificationRepository, required this.splitFriendRepository}) : super(AcceptRejectSplitBlocInitial()) {
    on<AcceptRejectSplit>((event, emit) async {
      emit(AcceptRejectSplitBlocLoading());
      final splitResponse = await splitFriendRepository.addUserToSplitFriend(splitId: event.notificationModel.splitId ?? 'Empty SplitId', userData: event.userList);
      if(splitResponse == 'User Added') {
        final notificationResponse = await notificationRepository.updateNotificationData(notificationModel: event.notificationModel);
        switch(notificationResponse){
          case DataStateSuccess<NotificationModel>(data: var data):
            emit(AcceptRejectSplitBlocLoaded(data: data));
          case DataStateError<NotificationModel>(ex: var ex):
            emit(AcceptRejectSplitBlocError(ex: ex));
        }
      }
    });
  }
}
