import 'package:trackexpense/core/state/data_state.dart';
import 'package:trackexpense/data/remote/notification/models/notification_model.dart';
import 'package:trackexpense/data/remote/notification/notification_repository.dart';
import 'package:trackexpense/utils/utils.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationBlocEvent, NotificationBlocState> {
  final NotificationRepository notificationRepository;
  NotificationBloc({required this.notificationRepository}) : super(NotificationBlocInitial()) {
    on<FetchNotification>((event, emit) async {
      emit(NotificationBlocLoading());
      final response = await notificationRepository.getNotificationData(userId: event.userId);
      switch(response){
        case DataStateSuccess<List<NotificationModel>>(data: var data):
          emit(NotificationBlocLoaded(data: data));
        case DataStateError<List<NotificationModel>>(ex: var ex):
          emit(NotificationBlocError(ex: ex));
      }
    });
  }
}
