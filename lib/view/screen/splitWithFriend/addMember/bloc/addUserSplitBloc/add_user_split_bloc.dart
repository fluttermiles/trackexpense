
import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/notification/models/notification_model.dart';
import 'package:trackexpense/data/remote/notification/notification_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'add_user_split_event.dart';
part 'add_user_split_state.dart';

class AddUserSplitBloc extends Bloc<AddUserSplitBlocEvent, AddUserSplitBlocState> {
  final NotificationRepository notificationRepository;
  AddUserSplitBloc({required this.notificationRepository}) : super(AddUserSplitBlocInitial()) {
    on<AddUserSplit>((event, emit) async {
      emit(AddUserSplitBlocLoading());
      final response = await notificationRepository.addNewNotificationData(notificationModel: event.notificationModel, emailId: event.emailId);
      Logger.printError(response.toString());
      switch(response){
        case DataStateSuccess<NotificationModel>(data: var data):
          emit(AddUserSplitBlocLoaded(data: data));
        case DataStateError<NotificationModel>(ex: var ex):
          emit(AddUserSplitBlocError(ex: ex));
      }
    });
  }
}
